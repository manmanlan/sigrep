shader_type canvas_item;

void fragment() {
    vec2 uv_centered = UV - vec2(0.5);
    float dist = length(uv_centered);
    if (dist > 0.5) {
        discard;  // Makes the outside transparent
    }
}
