/// @description Vertex buffer

var s = 512

// Awful code that creates a skybox

buffer_front = vertex_create_buffer()
vertex_begin(buffer_front, vertexBufferFormat)

vertex_position_3d(buffer_front, -s, -s, -s)
vertex_color(buffer_front, c_white, 1)
vertex_texcoord(buffer_front, 0, 0)
vertex_normal(buffer_front, 0, 1, 0)

vertex_position_3d(buffer_front, s, -s, -s)
vertex_color(buffer_front, c_white, 1)
vertex_texcoord(buffer_front, 1, 0)
vertex_normal(buffer_front, 0, 1, 0)

vertex_position_3d(buffer_front, -s, -s, s)
vertex_color(buffer_front, c_white, 1)
vertex_texcoord(buffer_front, 0, 1)
vertex_normal(buffer_front, 0, 1, 0)


vertex_position_3d(buffer_front, s, -s, -s)
vertex_color(buffer_front, c_white, 1)
vertex_texcoord(buffer_front, 1, 0)
vertex_normal(buffer_front, 0, 1, 0)

vertex_position_3d(buffer_front, s, -s, s)
vertex_color(buffer_front, c_white, 1)
vertex_texcoord(buffer_front, 1, 1)
vertex_normal(buffer_front, 0, 1, 0)

vertex_position_3d(buffer_front, -s, -s, s)
vertex_color(buffer_front, c_white, 1)
vertex_texcoord(buffer_front, 0, 1)
vertex_normal(buffer_front, 0, 1, 0)

vertex_end(buffer_front)


buffer_right = vertex_create_buffer()
vertex_begin(buffer_right, vertexBufferFormat)

vertex_position_3d(buffer_right, s, -s, -s)
vertex_color(buffer_right, c_white, 1)
vertex_texcoord(buffer_right, 0, 0)
vertex_normal(buffer_right, -1, 0, 0)

vertex_position_3d(buffer_right, s, s, -s)
vertex_color(buffer_right, c_white, 1)
vertex_texcoord(buffer_right, 1, 0)
vertex_normal(buffer_right, -1, 0, 0)

vertex_position_3d(buffer_right, s, -s, s)
vertex_color(buffer_right, c_white, 1)
vertex_texcoord(buffer_right, 0, 1)
vertex_normal(buffer_right, -1, 0, 0)


vertex_position_3d(buffer_right, s, s, -s)
vertex_color(buffer_right, c_white, 1)
vertex_texcoord(buffer_right, 1, 0)
vertex_normal(buffer_right, -1, 0, 0)

vertex_position_3d(buffer_right, s, s, s)
vertex_color(buffer_right, c_white, 1)
vertex_texcoord(buffer_right, 1, 1)
vertex_normal(buffer_right, -1, 0, 0)

vertex_position_3d(buffer_right, s, -s, s)
vertex_color(buffer_right, c_white, 1)
vertex_texcoord(buffer_right, 0, 1)
vertex_normal(buffer_right, -1, 0, 0)

vertex_end(buffer_right)


buffer_back = vertex_create_buffer()
vertex_begin(buffer_back, vertexBufferFormat)

vertex_position_3d(buffer_back, s, s, -s)
vertex_color(buffer_back, c_white, 1)
vertex_texcoord(buffer_back, 0, 0)
vertex_normal(buffer_back, 0, -1, 0)

vertex_position_3d(buffer_back, -s, s, -s)
vertex_color(buffer_back, c_white, 1)
vertex_texcoord(buffer_back, 1, 0)
vertex_normal(buffer_back, 0, -1, 0)

vertex_position_3d(buffer_back, s, s, s)
vertex_color(buffer_back, c_white, 1)
vertex_texcoord(buffer_back, 0, 1)
vertex_normal(buffer_back, 0, -1, 0)


vertex_position_3d(buffer_back, -s, s, -s)
vertex_color(buffer_back, c_white, 1)
vertex_texcoord(buffer_back, 1, 0)
vertex_normal(buffer_back, 0, -1, 0)

vertex_position_3d(buffer_back, -s, s, s)
vertex_color(buffer_back, c_white, 1)
vertex_texcoord(buffer_back, 1, 1)
vertex_normal(buffer_back, 0, -1, 0)

vertex_position_3d(buffer_back, s, s, s)
vertex_color(buffer_back, c_white, 1)
vertex_texcoord(buffer_back, 0, 1)
vertex_normal(buffer_back, 0, -1, 0)

vertex_end(buffer_back)


buffer_left = vertex_create_buffer()
vertex_begin(buffer_left, vertexBufferFormat)

vertex_position_3d(buffer_left, -s, s, -s)
vertex_color(buffer_left, c_white, 1)
vertex_texcoord(buffer_left, 0, 0)
vertex_normal(buffer_left, 1, 0, 0)

vertex_position_3d(buffer_left, -s, -s, -s)
vertex_color(buffer_left, c_white, 1)
vertex_texcoord(buffer_left, 1, 0)
vertex_normal(buffer_left, 1, 0, 0)

vertex_position_3d(buffer_left, -s, s, s)
vertex_color(buffer_left, c_white, 1)
vertex_texcoord(buffer_left, 0, 1)
vertex_normal(buffer_left, 1, 0, 0)


vertex_position_3d(buffer_left, -s, -s, -s)
vertex_color(buffer_left, c_white, 1)
vertex_texcoord(buffer_left, 1, 0)
vertex_normal(buffer_left, 1, 0, 0)

vertex_position_3d(buffer_left, -s, -s, s)
vertex_color(buffer_left, c_white, 1)
vertex_texcoord(buffer_left, 1, 1)
vertex_normal(buffer_left, 1, 0, 0)

vertex_position_3d(buffer_left, -s, s, s)
vertex_color(buffer_left, c_white, 1)
vertex_texcoord(buffer_left, 0, 1)
vertex_normal(buffer_left, 1, 0, 0)

vertex_end(buffer_left)



buffer_top = vertex_create_buffer()
vertex_begin(buffer_top, vertexBufferFormat)

vertex_position_3d(buffer_top, -s, s, -s)
vertex_color(buffer_top, c_white, 1)
vertex_texcoord(buffer_top, 0, 0)
vertex_normal(buffer_top, 0, 0, 1)

vertex_position_3d(buffer_top, s, s, -s)
vertex_color(buffer_top, c_white, 1)
vertex_texcoord(buffer_top, 1, 0)
vertex_normal(buffer_top, 0, 0, 1)

vertex_position_3d(buffer_top, -s, -s, -s)
vertex_color(buffer_top, c_white, 1)
vertex_texcoord(buffer_top, 0, 1)
vertex_normal(buffer_top, 0, 0, 1)


vertex_position_3d(buffer_top, s, s, -s)
vertex_color(buffer_top, c_white, 1)
vertex_texcoord(buffer_top, 1, 0)
vertex_normal(buffer_top, 0, 0, 1)

vertex_position_3d(buffer_top, s, -s, -s)
vertex_color(buffer_top, c_white, 1)
vertex_texcoord(buffer_top, 1, 1)
vertex_normal(buffer_top, 0, 0, 1)

vertex_position_3d(buffer_top, -s, -s, -s)
vertex_color(buffer_top, c_white, 1)
vertex_texcoord(buffer_top, 0, 1)
vertex_normal(buffer_top, 0, 0, 1)

vertex_end(buffer_top)


buffer_bottom = vertex_create_buffer()
vertex_begin(buffer_bottom, vertexBufferFormat)

vertex_position_3d(buffer_bottom, s, s, s)
vertex_color(buffer_bottom, c_white, 1)
vertex_texcoord(buffer_bottom, 0, 0)
vertex_normal(buffer_bottom, 0, 0, -1)

vertex_position_3d(buffer_bottom, -s, s, s)
vertex_color(buffer_bottom, c_white, 1)
vertex_texcoord(buffer_bottom, 1, 0)
vertex_normal(buffer_bottom, 0, 0, -1)

vertex_position_3d(buffer_bottom, s, -s, s)
vertex_color(buffer_bottom, c_white, 1)
vertex_texcoord(buffer_bottom, 0, 1)
vertex_normal(buffer_bottom, 0, 0, -1)


vertex_position_3d(buffer_bottom, -s, s, s)
vertex_color(buffer_bottom, c_white, 1)
vertex_texcoord(buffer_bottom, 1, 0)
vertex_normal(buffer_bottom, 0, 0, -1)

vertex_position_3d(buffer_bottom, -s, -s, s)
vertex_color(buffer_bottom, c_white, 1)
vertex_texcoord(buffer_bottom, 1, 1)
vertex_normal(buffer_bottom, 0, 0, -1)

vertex_position_3d(buffer_bottom, s, -s, s)
vertex_color(buffer_bottom, c_white, 1)
vertex_texcoord(buffer_bottom, 0, 1)
vertex_normal(buffer_bottom, 0, 0, -1)

vertex_end(buffer_bottom)