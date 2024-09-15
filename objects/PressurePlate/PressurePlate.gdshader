shader_type canvas_item;

uniform float pression : hint_range(0.0, 1.0);
uniform float elevation: hint_range(0.0, 1.0) = 0.002;

void fragment() {
	float displacement = elevation * (1.0 - pression);
	vec2 displaced = vec2(UV.x + displacement, UV.y + displacement);
	vec4 original = texture(TEXTURE, UV);

	vec4 shadow = vec4(0.0, 0.0, 0.0, original.a);
	vec4 displaced_color = texture(TEXTURE, displaced);

	if (displaced_color.a < 1.0) {
		COLOR = shadow;
	} else {
		COLOR = displaced_color;
	}
}