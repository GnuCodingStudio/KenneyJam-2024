shader_type canvas_item;

uniform float progression: hint_range(0.0, 1.0, 0.01) = 0;
uniform float blur_size: hint_range(0.0, 1.0, 0.01) = .02;

void fragment() {
	float ratio = float(TEXTURE_PIXEL_SIZE.x) / float(TEXTURE_PIXEL_SIZE.y);
	vec2 centered_uv = UV - 0.5;
	centered_uv.x *= 1.70666667;
	float distance = length(centered_uv);

	float step_limit = progression;
	float step_size = .05;
	float alpha = 1.0 - smoothstep(step_limit, step_limit+step_size, distance);

	COLOR = vec4(vec3(0), alpha);
}

