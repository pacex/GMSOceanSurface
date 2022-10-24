varying float linearizedDepth;
varying vec2 v_vTexcoords;

// Write floating point depth as color onto depth map surface
vec3 packDepth(float f) {
    return vec3( floor( f * 255.0 ) / 255.0, fract( f * 255.0 ), fract( f * 255.0 * 255.0 ) );
}

float unpackDepth(vec4 col){
    if (col.a < 1.0){
        return 999999999.0;
    }
    return col.x + col.y / 255.0 + col.z / 255.0 / 255.0;
}

void main() {        
    float depth = linearizedDepth;
    gl_FragColor = vec4( packDepth(depth), 1.0 );
}