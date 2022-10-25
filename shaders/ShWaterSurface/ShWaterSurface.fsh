#define PI 3.14159265359 // Pi .. duh
#define G 9.81	// Gravitational constant
#define NUM_WAVES 64 // Number of Waves (this constant needs to equal the length of wave parameter arrays submitted to the shader!!)

varying vec4 v_vWorldPositionInitial; // World space position of the fragment if there was no wave displacement
varying vec4 v_vViewPosition; // View space position of the fragment after displacement
varying vec4 v_vPosition; // World space position of the fragment after displacement
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_vLinDepth; // Linearized depth value

uniform float ufTime; // Time in ms

// Wave parameters
uniform float ufAmplitudes[NUM_WAVES];
uniform float ufKx[NUM_WAVES];
uniform float ufKy[NUM_WAVES];

// Lighting parameters
uniform mat4 ufView;
uniform mat4 ufProj;

uniform mat4 ufInvView;

// Depth and Albedo
uniform sampler2D depthSampler;
uniform sampler2D albedoSampler;
uniform float ufCameraFar;

float dotNonNeg(vec3 i, vec3 j){
	return max(0.0, dot(i,j));
}

// Cube mapped sky reflection
uniform sampler2D cubeMap0;
uniform sampler2D cubeMap1;
uniform sampler2D cubeMap2;
uniform sampler2D cubeMap3;
uniform sampler2D cubeMap4;
uniform sampler2D cubeMap5;

//Function to find largest component of vec3. returns 0 for x, 1 for y, 2 for z
int argmax3 (vec3 v){
    return v.y > v.x ? ( v.z > v.y ? 2 : 1 ) : ( v.z > v.x ? 2 : 0 );
}

/* Sample cube map:
    dir is the vector (in world space) from the center of the cube that will be extended.
    The point at which this extended vector "intersects" the cube is the sampling location.
*/
vec4 getCubeMapColor(vec3 dir){
    vec3 absDir = abs(dir);
    vec3 dirOnCube; //Scaled version of dir to land on unit cube.
    vec2 uv; //Texture coordinates on the corresponding surface
    
    int samplerIndex; //What surface to sample, i.e. which face of the cube do we land on?
    
    /* Therefor we simply check which entry of dir is the largest.
        This corresponds to the axis of (i.e. perpendicular to) the cube face the vector will land on.
    */
    int maxInd = argmax3(absDir); 
    if (maxInd == 0){ //x
        //Rescale dir to land on unit cube
        dirOnCube = dir / dir.x;
        
        //Calculate location on the face from remaining vector components and rescale them to fit surface orientation.
        uv = vec2(dirOnCube.y, sign(dir.x) * dirOnCube.z);
        
        //Select cube map surface sampler from max component's sign (i.e. do we hit the face in fron or behind?)
        samplerIndex = dir.x < 0.0 ? 1 : 0;
    }else if (maxInd == 1){ //y
        //Rescale dir to land on unit cube
        dirOnCube = dir / dir.y;
        
        //Calculate location on the face from remaining vector components and rescale them to fit surface orientation.
        uv = vec2(-dirOnCube.x, sign(dir.y) * dirOnCube.z);
        
        //Select cube map surface sampler from max component's sign (i.e. do we hit the face in fron or behind?)
        samplerIndex = dir.y < 0.0 ? 3 : 2;
    }else{ //z
        //Rescale dir to land on unit cube
        dirOnCube = dir / dir.z;
        
        //Calculate location on the face from remaining vector components and rescale them to fit surface orientation.
        uv = vec2(-dirOnCube.x, -sign(dir.z) * dirOnCube.y);
        
        //Select cube map surface sampler from max component's sign (i.e. do we hit the face in fron or behind?)
        samplerIndex = dir.z < 0.0 ? 5 : 4;
    }
    
    //Rescale surface coords from [-1,1] to [0,1]
    uv = (uv + vec2(1.0)) * 0.5;
    
    //Read color value from corresponding surface
    if (samplerIndex == 0){
        return texture2D(cubeMap0, uv);
    }else if (samplerIndex == 1){
        return texture2D(cubeMap1, uv);
    }else if (samplerIndex == 2){
        return texture2D(cubeMap2, uv);
    }else if (samplerIndex == 3){
        return texture2D(cubeMap3, uv);
    }else if (samplerIndex == 4){
        return texture2D(cubeMap4, uv);
    }else {
        return texture2D(cubeMap5, uv);
    }
}

// Write floating point depth as color onto depth map surface
vec3 packDepth(float f) {
    return vec3( floor( f * 255.0 ) / 255.0, fract( f * 255.0 ), fract( f * 255.0 * 255.0 ) );
}

float unpackDepth(vec4 col){
    if (col.a < 1.0){
        return ufCameraFar;
    }
    return col.x + col.y / 255.0 + col.z / 255.0 / 255.0;
}

vec2 viewSpaceToScreen(vec4 viewPos){
	vec4 projPos = ufProj * viewPos;
	return (projPos.xy / projPos.w) * 0.5 + vec2(0.5);
}

float sampleDepth(vec2 screenPos){
	vec4 sampledColor = texture2D(depthSampler, screenPos);
	return unpackDepth(sampledColor);
}

vec4 sampleAlbedo(vec2 screenPos){
	vec4 sampledColor = texture2D(albedoSampler, screenPos);
	if (screenPos.x < 0.0 || screenPos.x >= 1.0 || screenPos.y < 0.0 || screenPos.y >= 1.0){
		sampledColor.a = 0.0;
	}
	return sampledColor;
}

float viewSpaceToLinDepth(vec4 viewPos){
	vec4 projPos = ufProj * viewPos;
	return projPos.z / ufCameraFar;
}

void main()
{
	// GERSTNER WAVE NORMAL	
	vec3 normal = vec3(0.0);
	
	float normal_strength = 8.0;
	
	for (int i = 0; i < NUM_WAVES; i++){
		
		vec2 wave_direction = vec2(ufKx[i], ufKy[i]);
	
		float amp = ufAmplitudes[i];
		float theta = sqrt(length(wave_direction) * G) * 0.001 * PI * ufTime + // Time
			(wave_direction.x * v_vWorldPositionInitial.x + wave_direction.y * v_vWorldPositionInitial.y); // Space
		
		// Calculate tangent and bitangtent by displacement derivatives
		vec3 tangent = vec3(1.0 - amp * wave_direction.x * wave_direction.x * cos(theta),
						-amp * wave_direction.x * wave_direction.y * cos(theta),
						amp * wave_direction.x * -sin(theta) * normal_strength);
		vec3 bitangent = vec3(-amp *  wave_direction.x * wave_direction.y * cos(theta),
							1.0 - amp * wave_direction.y * wave_direction.y * cos(theta),
							amp * wave_direction.y * -sin(theta) * normal_strength);
							
		tangent = normalize(tangent);
		bitangent = normalize(bitangent);
		
		normal += normalize(cross(tangent, bitangent));
	
	}
	normal = normalize(normal);
	
	// REFLECTIONS
	vec3 normal_view = normalize((ufView * vec4(normal, 0.0)).xyz);
	vec4 reflected = vec4(normalize(reflect(v_vViewPosition.xyz, normal_view)), 0.0);
	float d_min = 0.0;
	float maxInterval = 512.0;
	float interval = maxInterval;
	
	vec4 current = v_vViewPosition + (d_min + interval * 0.5) * reflected;
	current.w = 1.0;
	float sampledDepth = 0.0;
	float currentDepth = 0.0;
	
	while(interval > 0.00001){
		current = v_vViewPosition + (d_min + interval * 0.5) * reflected;
		sampledDepth = sampleDepth(viewSpaceToScreen(current));
		currentDepth = viewSpaceToLinDepth(current);
		if (sampledDepth > currentDepth){
			d_min += 0.5 * interval;
		}
		interval *= 0.5;
	}
	
	vec4 reflectColor = sampleAlbedo(viewSpaceToScreen(current));
	//reflectColor = vec4(d_min / 512.0, 0.0, 0.0, 1.0);
	
	if (reflectColor.a < 1.0 || sampledDepth < viewSpaceToLinDepth(v_vViewPosition)){
		reflectColor = getCubeMapColor((ufInvView * reflected).xyz);
	}
	
	
	// BASE COLOR
	vec3 baseColor = mix(reflectColor.rgb, vec3(0.388, 0.529, 0.945), pow(abs(dot(normalize(-v_vViewPosition.xyz), normal_view)), 0.7));

	vec2 screenPos = viewSpaceToScreen(ufView * v_vPosition);
	float bgDepth = sampleDepth(screenPos); // Sample depth of geometry behind water surface
	float deltaDepth = (bgDepth - v_vLinDepth) * ufCameraFar; // Difference between water surface depth and sampled background depth
	
	vec3 deepColor = 0.2 * baseColor; // Dark deep color
	deepColor = mix(texture2D(albedoSampler, screenPos + normal.xy * 0.1).rgb, deepColor, clamp(deltaDepth * 0.1, 0.0, 1.0));
	
		/*	Mix base and deep color based on ray incident angle on water surface
			baseColor for shallow angles, deepColor for steep angles
		*/
	vec3 color = mix(baseColor, deepColor, pow(abs(dot(normalize(-v_vViewPosition.xyz), normal_view)), 0.4));
	
	// FOAM
	color = mix(vec3(0.9), color, clamp(deltaDepth * 0.6, 0.0, 1.0));
	
	// LIGHTING
	vec3 light_direction_world = normalize(vec3(1.0, -1.0, 0.2));
	vec3 reflected_world = reflect(light_direction_world, normal);
	vec3 reflected_view = (ufView * vec4(reflected_world, 0.0)).xyz;


	float ambient = 0.7;	
	float diffuse = 0.3;
	float specular = 0.2;
	float alpha = 50.0;
	
	color *= ambient;
	
	color += diffuse * dotNonNeg(normal, light_direction_world) * baseColor + specular * pow(dotNonNeg(normalize(-v_vViewPosition.xyz), normalize(reflected_view)), alpha);
	
	
	
	
    //gl_FragColor = vec4(normal*0.5 + vec3(0.5), 1.0);
	gl_FragColor = vec4(color, 1.0);
	//gl_FragColor = texture2D(depthSampler, screenPos);
	//gl_FragColor = vec4(packDepth(v_vLinDepth), 1.0);
	//gl_FragColor = texture2D(albedoSampler, screenPos);
	//gl_FragColor = vec4(vec3(bgDepth) * 80.0, 1.0);
	//gl_FragColor = reflectColor;
}
