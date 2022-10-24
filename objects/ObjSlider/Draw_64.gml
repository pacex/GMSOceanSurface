/// @description Draw Slider and text

var col_background = c_dkgrey
var col_main = c_orange

draw_set_color(col_background)
draw_rectangle(x,y, x+width,y+32, false)
draw_set_color(col_main)
draw_rectangle(x,y, x+(width*position),y+32, false)

draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_text(x+4, y+16, lerp(val_min, val_max, position))
draw_set_halign(fa_right)
draw_set_valign(fa_middle)
draw_text(x-4, y+16, label)

draw_set_halign(fa_left)
draw_set_valign(fa_top)


