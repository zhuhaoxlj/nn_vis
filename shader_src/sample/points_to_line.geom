#version 440

layout(points) in;
in vec3 vs_normal[];
in float vs_discard[];
in vec4 vs_next_position[];

layout(line_strip, max_vertices = 2) out;

uniform mat4 projection;

void main()
{
    if (vs_discard[0] == 0.0) {
        gl_Position = projection * gl_in[0].gl_Position;
        EmitVertex();
        gl_Position = projection * vs_next_position[0];
        EmitVertex();
    }
    EndPrimitive();
}
