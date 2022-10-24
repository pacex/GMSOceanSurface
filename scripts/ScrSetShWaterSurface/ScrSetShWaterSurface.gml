
function ScrSetShWaterSurface(){

	shader_set(ShWaterSurface)
	
	/* Set Shader uniforms
		u... : Vertex stage uniforms
		uf... : Fragment stage uniforms
	*/
	
	// TIME
	shader_set_uniform_f(shader_get_uniform(ShWaterSurface, "uTime"), current_time)
	shader_set_uniform_f(shader_get_uniform(ShWaterSurface, "ufTime"), current_time)
	
	// WAVE PARAMETERS
	shader_set_uniform_f_array(shader_get_uniform(ShWaterSurface, "uAmplitudes"), amplitudes)
	shader_set_uniform_f_array(shader_get_uniform(ShWaterSurface, "ufAmplitudes"), amplitudes)
	shader_set_uniform_f_array(shader_get_uniform(ShWaterSurface, "uKx"), kx)
	shader_set_uniform_f_array(shader_get_uniform(ShWaterSurface, "ufKx"), kx)
	shader_set_uniform_f_array(shader_get_uniform(ShWaterSurface, "uKy"), ky)
	shader_set_uniform_f_array(shader_get_uniform(ShWaterSurface, "ufKy"), ky)
	
	// LIGHTING PARAMETERS
	shader_set_uniform_f_array(shader_get_uniform(ShWaterSurface, "ufView"), view)
	shader_set_uniform_f_array(shader_get_uniform(ShWaterSurface, "ufProj"), projection)
	shader_set_uniform_f_array(shader_get_uniform(ShWaterSurface, "ufInvView"), invView)
	
	// CUBE MAP SKY REFLECTIONS                     ... the sprite subimage mappings are (and will remain) a mess ...
	texture_set_stage(shader_get_sampler_index(ShWaterSurface, "cubeMap0"), sprite_get_texture(SprSkybox, 3))
	texture_set_stage(shader_get_sampler_index(ShWaterSurface, "cubeMap1"), sprite_get_texture(SprSkybox, 4))
	texture_set_stage(shader_get_sampler_index(ShWaterSurface, "cubeMap2"), sprite_get_texture(SprSkybox, 2))
	texture_set_stage(shader_get_sampler_index(ShWaterSurface, "cubeMap3"), sprite_get_texture(SprSkybox, 0))
	texture_set_stage(shader_get_sampler_index(ShWaterSurface, "cubeMap4"), sprite_get_texture(SprSkybox, 5))
	texture_set_stage(shader_get_sampler_index(ShWaterSurface, "cubeMap5"), sprite_get_texture(SprSkybox, 1))
	
	// DEPTH AND ALBEDO
	shader_set_uniform_f(shader_get_uniform(ShWaterSurface, "uCameraFar"), camFar)
	shader_set_uniform_f(shader_get_uniform(ShWaterSurface, "ufCameraFar"), camFar)
	if (surface_exists(depthSurface)){
		texture_set_stage(shader_get_sampler_index(ShWaterSurface, "depthSampler"), surface_get_texture(depthSurface))
	}
	if (surface_exists(albedoSurface)){
		texture_set_stage(shader_get_sampler_index(ShWaterSurface, "albedoSampler"), surface_get_texture(albedoSurface))
	}
}