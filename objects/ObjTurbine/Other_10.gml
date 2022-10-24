/// @description Depth Render Pass

// Base
vertex_submit(model_base, pr_trianglelist, texture_base)

// Rotor
matrix_set(matrix_world, matrix_build(0,1,-36.3,-current_time*0.03*ObjWaterSurface.windSpeed,0,0,1,1,1))
vertex_submit(model_rotor, pr_trianglelist, texture_rotor)
ScrResetWorldMat()