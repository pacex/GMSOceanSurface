varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;
varying vec4 v_vViewPosition;

uniform mat4 proj;
uniform float camFar;

vec3 packDepth(float f) {
    return vec3( floor( f * 255.0 ) / 255.0, fract( f * 255.0 ), fract( f * 255.0 * 255.0 ) );
}

void main()
{
	vec3 light_direction_world = normalize(vec3(1.0, -1.0, 0.2));
	
	vec4 tex_color = texture2D( gm_BaseTexture, v_vTexcoord );
	
	vec3 col = tex_color.rgb;
	
	//vec4 projPos = proj * v_vViewPosition;
	
    gl_FragColor = v_vColour * vec4(mix(col, col * max(0.0, dot(normalize(v_vNormal), -light_direction_world)), 0.6), tex_color.a);
	//gl_FragColor = vec4(packDepth(projPos.z / camFar), 1.0);
}
