/// @description Depth and Albedo render passes

// Depth render pass
if (!surface_exists(depthSurface)){
	depthSurface = surface_create(window_get_width(), window_get_height())
}

surface_set_target(depthSurface)
draw_clear_alpha(c_black, 0)
camera_apply(view_camera[0])
shader_set(ShDepth)
shader_set_uniform_f(shader_get_uniform(ShDepth, "uCameraNear"), camNear)
shader_set_uniform_f(shader_get_uniform(ShDepth, "uCameraFar"), camFar)

	// .. depth rendering goes here ..
	with(all){
		event_perform(ev_other, ev_user0)
	}

shader_reset()
surface_reset_target()


// Albedo render pass
if (!surface_exists(albedoSurface)){
	albedoSurface = surface_create(window_get_width(), window_get_height())
}
surface_set_target(albedoSurface)
draw_clear_alpha(c_black, 0)
camera_apply(view_camera[0])

	// .. albedo rendering goes here ..
	with(all){
		event_perform(ev_other, ev_user1)
	}

surface_reset_target()