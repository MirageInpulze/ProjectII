/// @description Insert description here
// You can write your code in this editor

//if (!global.GamePaused)
//{
//	depth = -bbox_bottom;
//	if (lifted) && (instance_exists(oPlayer))
//	{
//		if (oPlayer.sprite_index != sPlayerLift)
//		{
//			x = oPlayer.x;
//			y = oPlayer.y;
//			z = 13;
//			depth = oPlayer.depth -1;
//		}
//	}
	
//	if (!lifted)
//	{
//		//Gets Thrown
//		if (thrown)
//		{
//			//throwDistance = entityThrowDistance
//			throwDistanceTravelled = min(throwDistanceTravelled + 3, throwDistance);
//			x = xstart + lengthdir_x(throwDistanceTravelled, direction);
//			y = ystart + lengthdir_y(throwDistanceTravelled, direction);
//			if (tilemap_get_at_pixel(collisionMap, x, y) > 0)
//			{
//				thrown = false;
//				grav = .1;
//			}
//			throwPercent = throwStartPercent + lerp(0, 1 - throwStartPercent, throwDistanceTravelled/throwDistance);
//			z = throwPeakHeight * sin(throwPercent * pi);
//			if (throwDistance == throwDistanceTravelled)
//			{
//				thrown = false;
//				if (entityThrowBreak) instance_destroy();
//			}
				
//		}
//		else
//		{
//			//Fallback if z>0
//			if (z > 0)
//			{
//				z = max (z - grav, 0);
//				grav += .1;
//				if ((z==0) && (entityThrowBreak)) instance_destroy();
//			}
//			else
//			{
//				grav = .1;
//			}
//		}
//	}
//}
//flash = max(flash - 0.04, 0);

if (!global.GamePaused)
{
	depth = -bbox_bottom;
	flash = max(flash-0.04, 0);
	switch state
	{
		case STATES.LIFTED:
			if (instance_exists(oPlayer) && oPlayer.sprite_index != sPlayerLift)
			{
				x = oPlayer.x;
				y = oPlayer.y;
				z = 13;
				depth = oPlayer.depth - 1;
			}
		break;
		case STATES.THROWN:
			throwDistanceTravelled = min(throwDistanceTravelled + throwSpeed, entityThrowDistance);			
			throwPercent = throwStartPercent + (1 - throwStartPercent) * (throwDistanceTravelled / entityThrowDistance);
			z = throwPeakHeight * sin(throwPercent * pi);
			if (!thrownCollision)
			{
				hSpeed = lengthdir_x(throwSpeed, direction);
				vSpeed = lengthdir_y(throwSpeed, direction);
				thrownCollision = TileCollision();
			}
			if (z == 0)
				state = STATES.LANDED;
		break;		
		case STATES.LANDED:
			state = STATES.DEFAULT;
			thrownCollision = false;			
			if (entityThrowBreak)
				instance_destroy();
			else
			{
				entityCollision = true;
				entityActivateScript = ActivateLiftable;
			}
		break;
	}
}

//if (!global.GamePaused)
//{
//    depth = -bbox_bottom;
//    flash = max(flash-0.04, 0);
//    switch obj_state
//    {
//        case STATES.LIFTED:
//            if (instance_exists(oPlayer) && oPlayer.sprite_index != sPlayerLift)
//            {
//                x = oPlayer.x;
//                y = oPlayer.y;
//                z = 13;
//                depth = oPlayer.depth - 1;
//            }
//        break;
//        case STATES.THROWN:
//            throwDistanceTravelled = min(throwDistanceTravelled + throwSpeed, entityThrowDistance);            throwPercent = throwStartPercent + (1 - throwStartPercent) * (throwDistanceTravelled / entityThrowDistance);
//            z = throwPeakHeight * sin(throwPercent * pi);
//            if (!thrownCollision)
//            {
//                hSpeed = lengthdir_x(throwSpeed, direction);
//                vSpeed = lengthdir_y(throwSpeed, direction);
//                thrownCollision = TileCollision();
//            }
//            if (z == 0)
//                obj_state = STATES.LANDED;
//        break;        
//        case STATES.LANDED:
//            obj_state = STATES.DEFAULT;
//            thrownCollision = false;            
//            if (entityThrowBreak)
//                instance_destroy();
//            else
//            {
//                entityCollision = true;
//                entityActivateScript = ActivateLiftable;
//            }
//        break;
//    }
//}
