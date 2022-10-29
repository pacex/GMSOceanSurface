/// @description Draw FPS

// Uncomment the following lines to display depth and albedo buffer

//draw_surface_ext(depthSurface, 0,0, 0.2, 0.2, 0, c_white, 1)
//draw_surface_ext(albedoSurface, 0, 256, 0.2, 0.2, 0, c_white, 1)

draw_set_color(c_dkgray)
draw_set_alpha(0.6)
draw_rectangle(1400,32,1920,288, false)
draw_rectangle(28,32,128,52, false)
draw_set_color(c_white)
draw_set_alpha(1)

draw_text(32,32,"FPS: " + string(fps));


