shader_type canvas_item;

uniform float radius = 20.0; // Adjust the radius for more/less roundness

void fragment() {
    vec2 size = TEXTURE_PIXEL_SIZE; // Get the rect's size
    vec2 pos = UV * size; // Scale UV to pixel space

    float corner = min(min(pos.x, size.x - pos.x), min(pos.y, size.y - pos.y));

    if (corner < radius) {
        float alpha = smoothstep(0.0, radius, corner);
        COLOR.a *= alpha; // Make the corners transparent
    }
}
