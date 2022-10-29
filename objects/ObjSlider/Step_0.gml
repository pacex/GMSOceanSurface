/// @description Update value on click and drag

if (mouse_check_button(mb_left) && enableGUI){
	var mx = window_mouse_get_x()
	var my = window_mouse_get_y()
	
	if (mx >= x && mx < x+width && my >= y && my < y+32){
		position = clamp((mx - x) / width, 0, 1)
	}
}
