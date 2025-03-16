shader_type canvas_item;

uniform float radius = 20.0; // Adjust this to change the corner roundness

void fragment() {
    vec2 size = vec2(1.0, 1.0) / SCREEN_PIXEL_SIZE; // Get the size of the rect
    vec2 uv_scaled = UV * size;

    float dist_x = min(uv_scaled.x, size.x - uv_scaled.x);
    float dist_y = min(uv_scaled.y, size.y - uv_scaled.y);
    
    float corner_dist = min(dist_x, dist_y);
    
    if (corner_dist < radius) {
        float alpha = smoothstep(0.0, radius, corner_dist);
        COLOR.a *= alpha; // Apply transparency only at corners
    }
}
