
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;

void main()
{
	vec3 light_direction_world = normalize(vec3(1.0, -1.0, 0.2));
	
	vec4 tex_color = texture2D( gm_BaseTexture, v_vTexcoord );
	
	vec3 col = tex_color.rgb;
	
	
    gl_FragColor = v_vColour * vec4(mix(col, col * max(0.0, dot(normalize(v_vNormal), -light_direction_world)), 0.6), tex_color.a);
}
