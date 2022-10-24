// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScrVertBufCreatePlane(n, size=1){
	
	if (n <= 0) return noone;
	
	buffer = vertex_create_buffer()
	
	vertex_begin(buffer, vertexBufferFormat)
	
	for(var xx = 0; xx < n; xx++){
		for(var yy = 0; yy < n; yy++){
			
			var x0, y0, x1, y1;
			x0 = xx * size / n
			y0 = yy * size / n
			x1 = (xx+1) * size / n
			y1 = (yy+1) * size / n
			
			vertex_position_3d(buffer, x0, y0, 0)
			vertex_color(buffer, c_white, 1)
			vertex_texcoord(buffer, xx/n, yy/n)
			vertex_normal(buffer, 0, 0, 1)
			
			vertex_position_3d(buffer, x1, y0, 0)
			vertex_color(buffer, c_white, 1)
			vertex_texcoord(buffer, (xx+1)/n, yy/n)
			vertex_normal(buffer, 0, 0, 1)
			
			vertex_position_3d(buffer, x0, y1, 0)
			vertex_color(buffer, c_white, 1)
			vertex_texcoord(buffer, xx/n, (yy+1)/n)
			vertex_normal(buffer, 0, 0, 1)
			
			
			
			vertex_position_3d(buffer, x1, y0, 0)
			vertex_color(buffer, c_white, 1)
			vertex_texcoord(buffer, (xx+1)/n, yy/n)
			vertex_normal(buffer, 0, 0, 1)
			
			vertex_position_3d(buffer, x1, y1, 0)
			vertex_color(buffer, c_white, 1)
			vertex_texcoord(buffer, (xx+1)/n, (yy+1)/n)
			vertex_normal(buffer, 0, 0, 1)
			
			vertex_position_3d(buffer, x0, y1, 0)
			vertex_color(buffer, c_white, 1)
			vertex_texcoord(buffer, xx/n, (yy+1)/n)
			vertex_normal(buffer, 0, 0, 1)
		}
	}
	
	vertex_end(buffer)
	
	return buffer;
}