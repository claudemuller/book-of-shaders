#version 330

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {
    vec2 st = gl_FragCoord.st/u_resolution;
    vec2 ms = gl_FragCoord.st/u_mouse;
    gl_FragColor = vec4(ms.xy,0.0,1.0);
}
