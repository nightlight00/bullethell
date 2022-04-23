
// Inherit the parent event
event_inherited();


switch (phase) {
	default:
		xstart = get_box_dimension_x();
		ystart = get_box_dimension_y();
		speed = moveSpeed;
		phase++;
		break;	
	case 1:
		var _dir = point_direction(x, y, xstart, ystart);
		var _diff = angle_difference(_dir, direction);
		direction += _diff * 0.1;
		if (irandom(7) == 0) {
			direction += _diff * 0.15;
		}
		image_angle = direction;
		
		if (distance_to_point(xstart, ystart) < 10) {
			attackTimer = 0;
			phase++;
			speed = 0;
		}
		break;
	case 2:
		attackTimer++;
		if (attackTimer > 20 && attackTimer <= 40) {
			if (attackTimer mod 8 == 0) {
				attack_shoot(19, 2.7, o_bullet_head);
			}
		}
		if (attackTimer > 50) {
			phase = 0;
		}
		break;
}