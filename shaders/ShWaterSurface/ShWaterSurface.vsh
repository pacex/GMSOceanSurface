#define PI 3.14159265359						// Pi .. duh
#define G 9.81									// Gravitational constant
#define NUM_WAVES 64							// Number of Waves (this number needs to equal the length of wave parameter arrays submitted to the shader!!)

attribute vec3 in_Position;						// (x,y,z)
attribute vec3 in_Normal;						// (x,y,z)
attribute vec4 in_Colour;						// (r,g,b,a)
attribute vec2 in_TextureCoord;					// (u,v)

varying vec4 v_vWorldPositionInitial;
varying vec4 v_vPosition;
varying vec4 v_vViewPosition;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_vLinDepth;

uniform float uTime;

// Wave parameters
uniform float uAmplitudes[NUM_WAVES];
uniform float uKx[NUM_WAVES];
uniform float uKy[NUM_WAVES];

// Depth
uniform float uCameraFar;

float tanh(float xx){
	float e = exp(2.0 * xx);
	return (e - 1.0) / (e + 1.0);
}

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);	
	v_vWorldPositionInitial = gm_Matrices[MATRIX_WORLD] * object_space_pos;
	
	vec4 world_space_pos = v_vWorldPositionInitial;
	
	// GERSTNER WAVE DISPLACEMENT
	for(int i = 0; i < NUM_WAVES; i++){ // Iterate over waves
		
		vec2 wave_direction = vec2(uKx[i], uKy[i]);
		vec2 wave_direction_norm = normalize(wave_direction);
		
		float amp = uAmplitudes[i];
		float km = length(wave_direction);
		float h = 1000000.0;
		float theta = sqrt(km * G) * // Angular frequency
			PI * 0.001 * uTime + // Time (converted to seconds)
			(wave_direction.x * v_vWorldPositionInitial.x + wave_direction.y * v_vWorldPositionInitial.y); // Space
		
		// Vertical displacement
		world_space_pos.z -= amp * cos(theta);
	
		// Horizontal displacement
		world_space_pos.x -= (amp) * wave_direction_norm.x * sin(theta);
		world_space_pos.y -= (amp) * wave_direction_norm.y * sin(theta);
	}
	
    gl_Position = gm_Matrices[MATRIX_PROJECTION] * gm_Matrices[MATRIX_VIEW] * world_space_pos;
    
	v_vViewPosition = gm_Matrices[MATRIX_VIEW] * world_space_pos;
	v_vPosition = world_space_pos;
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
	v_vLinDepth = gl_Position.z / uCameraFar;
}
