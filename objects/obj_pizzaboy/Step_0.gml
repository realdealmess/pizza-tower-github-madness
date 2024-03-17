switch state
{
    case enemy_states.idle:
        scr_enemy_idle()
        break
    case enemy_states.charge:
        scr_enemy_charge()
        break
    case enemy_states.turn:
        scr_enemy_turn()
        break
    case enemy_states.walk:
        scr_enemy_walk()
        break
    case enemy_states.land:
        scr_enemy_land()
        break
    case enemy_states.hit:
        scr_enemy_hit()
        break
    case enemy_states.stun:
        scr_enemy_stun()
        break
    case enemy_states.pizzagoblin_throw:
        scr_pizzagoblin_throw()
        break
    case enemy_states.grabbed:
        scr_enemy_grabbed()
        break
}


if ((flash == 1) && (alarm[2] <= 0))
    alarm[2] = (0.15 * room_speed)
if (state == enemy_states.walk)
    state = enemy_states.idle
if (state != enemy_states.grabbed)
    depth = 0
if (state != enemy_states.stun)
    thrown = 0
if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        mask_index = other.sprite_index
        baddieID = other.id
        other.boundbox = 1
    }
}

