/* DEPTH SHADER
    writes depth values onto the surface
*/

attribute vec3 in_Position;
attribute vec2 in_Texcoords;

varying float linearizedDepth;
varying vec2 v_vTexcoords;

uniform float uCameraFar;
uniform float uCameraNear;

void main() {
    vec4 object_space_pos = vec4(in_Position,1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;

    linearizedDepth = gl_Position.z / uCameraFar;
    v_vTexcoords = in_Texcoords;
}