/// @description Draw Water Surface

ScrSetShWaterSurface()
matrix_set(matrix_world, matrix_build(-256, -256, 0, 0,0,0, 1,1,1))

vertex_submit(surfacePlane, pr_trianglelist, sprite_get_texture(SprRoomTile, 0))

ScrResetWorldMat()
shader_reset()
