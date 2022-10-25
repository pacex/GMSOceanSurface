/// @description Draw Model

shader_set(ShTurbine)
shader_set_uniform_f(shader_get_uniform(ShTurbine, "camFar"), camFar)
shader_set_uniform_f_array(shader_get_uniform(ShTurbine, "proj"), projection)

// Base
vertex_submit(model_base, pr_trianglelist, texture_base)

// Rotor
matrix_set(matrix_world, matrix_build(0,1,-36.3,-current_time*0.03*ObjWaterSurface.windSpeed,0,0,1,1,1))
vertex_submit(model_rotor, pr_trianglelist, texture_rotor)
ScrResetWorldMat()

shader_reset()

