/// @description Draw GUI

if (enableGUI){
	draw_sprite(SprCheckbox, value, x, y)

	draw_set_halign(fa_right)
	draw_set_valign(fa_middle)
	draw_text(x-4, y+16, label)

	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}

