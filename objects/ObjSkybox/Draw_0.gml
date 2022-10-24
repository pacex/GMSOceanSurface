/// @description Draw skybox


matrix_set(matrix_world, matrix_build(ObjCamera.x, ObjCamera.y, ObjCamera.z, 0,0,0, 1,1,1))

vertex_submit(buffer_front, pr_trianglelist, sprite_get_texture(SprSkybox,2))
vertex_submit(buffer_right, pr_trianglelist, sprite_get_texture(SprSkybox,4))
vertex_submit(buffer_back, pr_trianglelist, sprite_get_texture(SprSkybox,0))
vertex_submit(buffer_left, pr_trianglelist, sprite_get_texture(SprSkybox,3))
vertex_submit(buffer_bottom, pr_trianglelist, sprite_get_texture(SprSkybox,1))
vertex_submit(buffer_top, pr_trianglelist, sprite_get_texture(SprSkybox,5))

ScrResetWorldMat()
