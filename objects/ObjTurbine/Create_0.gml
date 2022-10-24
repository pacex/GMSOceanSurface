/// @description Load Model

b_base = buffer_load("wind_turbine_base.buf")
model_base = vertex_create_buffer_from_buffer(b_base, vertexBufferFormatModel)
buffer_delete(b_base)
texture_base = sprite_get_texture(SprTurbine, 0)

b_rotor = buffer_load("wind_turbine_rotor.buf")
model_rotor = vertex_create_buffer_from_buffer(b_rotor, vertexBufferFormatModel)
buffer_delete(b_rotor)
texture_rotor = sprite_get_texture(SprTurbine, 1)


