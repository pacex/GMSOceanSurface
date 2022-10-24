/// @description Camera Control

// Update orientation
if (mouse_check_button_pressed(mb_right))
	window_mouse_set(window_get_width()*0.5, window_get_height()*0.5)


if (mouse_check_button(mb_right) && !mouse_check_button_pressed(mb_right)){
	window_set_cursor(cr_none)
	
	var sensitivity = 0.005
	
	azimuth += sensitivity * (window_mouse_get_x() - window_get_width()*0.5)
	
	elevation += sensitivity * (window_mouse_get_y() - window_get_height()*0.5)
	elevation = clamp(elevation, -0.499*pi, 0.499*pi)
	
	window_mouse_set(window_get_width()*0.5, window_get_height()*0.5)
	
}else{
	window_set_cursor(cr_default)
}

var look;
look[2] = sin(elevation)
look[1] = cos(azimuth) * cos(elevation)
look[0] = sin(azimuth) * cos(elevation)

// Update position
var spd = 1;

var right = keyboard_check(ord("D")) - keyboard_check(ord("A"))
var forward = keyboard_check(ord("W")) - keyboard_check(ord("S"))
var up = keyboard_check(vk_shift) - keyboard_check(vk_space)

x += right * lengthdir_x(spd, radtodeg(azimuth)) + forward * lengthdir_x(spd, radtodeg(azimuth-pi/2))
y += right * lengthdir_y(spd, radtodeg(azimuth)) + forward * lengthdir_y(spd, radtodeg(azimuth-pi/2))
z += up * spd/2


// Set view matrix
view = matrix_build_lookat(x,y,z,  // from
			x + look[0], y + look[1], z + look[2], // to
			0,0,-1) // up
			
invView = InverseMat4(view);
			
camera_set_view_mat(view_camera[0], view)