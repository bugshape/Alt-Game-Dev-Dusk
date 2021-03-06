/// @description Player Movement

//check for death
if health_ <= 0 {
	instance_destroy();	
}

//horizontal movement
var hinput = keyboard_check(vk_right) - keyboard_check(vk_left);

if hinput != 0 {
	speed_[h] += hinput*acceleration_;
	speed_[h] = clamp(speed_[h], -maxSpeed, maxSpeed);
	var flipped = (mouse_x > x)*2-1;
	image_speed = flipped*hinput*1; //animates in reverse or forward (no need for two sprites)
} else {
	speed_[h] = lerp(speed_[h], 0, friction_);
	image_speed = 0;
	image_index = 0; //set postion to first frame when not moving
}

//Jump
if !place_meeting(x, y+1, obj_solid) {
	speed_[v] += gravity_; 
	image_speed = 0;
	image_index = 1; //image used when jumping
} else {
	if keyboard_check_pressed(vk_up) {
		speed_[v] = jumpHeight_;
		xScale = image_xscale*.8; //skinny
		yScale = image_yscale*1.4; //taller
	}
}

//Move script
move(speed_, 0);

//Check for Landing
if place_meeting(x, y+1, obj_solid) and !place_meeting(x, yprevious+1, obj_solid) {
	xScale = image_xscale*1.2; //wider
	yScale = image_yscale*.9; //shorter

}

// move back to normal scale
xScale = lerp(xScale, image_xscale, .2);
yScale = lerp(yScale, image_yscale, .2);


