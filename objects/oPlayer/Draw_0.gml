/// @description Insert description here
// You can write your code in this editor
draw_sprite(sShadow, 0, x, y);
if (invulnerable != 0) && ((invulnerable mod 8 < 2) == 0) && (flash == 0)
{
	//does not draw (hitflicker)
}
else
{
	if (flash != 0)
	{
		shader_set(flashShader);
		uFlash = shader_get_uniform(flashShader, "flash");
		shader_set_uniform_f(uFlash, flash);
	}
	draw_sprite_ext(sprite_index, image_index, floor(x), floor(y-z), image_xscale, image_yscale, image_angle, image_blend, image_alpha)
	if (shader_current() != -1) shader_reset();
}

