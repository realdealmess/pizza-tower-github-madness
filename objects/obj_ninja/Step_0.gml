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

if ((state == enemy_states.stun) && ((stunned > 40) && (birdcreated == 0)))
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != enemy_states.stun)
    birdcreated = 0
if ((hitboxcreate == 0) && ((state == enemy_states.charge) && ((obj_player.state != states.mach3) && (obj_player.state != states.mach2))))
{
    hitboxcreate = 1
    with (instance_create(x, y, obj_forkhitbox))
    {
        sprite_index = spr_player_mask
        ID = other.id
    }
}
if (attack == 0)
    sprite_index = spr_pizzaboy
if ((attack == 0) && ((state != enemy_states.grabbed) && (state != enemy_states.stun)))
{
    state = enemy_states.idle
    roaming = 0
}
if (state != enemy_states.idle)
    roaming = 1
if (x != obj_player.x)
{
    if (((obj_player.x > (x - 200)) && (obj_player.x < (x + 200))) && (obj_player.y == y))
    {
        if ((state == enemy_states.walk) || (state == enemy_states.idle))
        {
            if (sprite_index == spr_pizzaboy)
                instance_create(x, y, obj_balloonpop)
            image_xscale = (-sign((x - obj_player.x)))
            roaming = 1
            attack = 1
            vsp = -11
            scr_sound(sound_enemythrow)
            image_index = 0
            image_xscale = (-sign((x - obj_player.x)))
            state = enemy_states.charge
        }
    }
}
if ((flash == 1) && (alarm[2] <= 0))
    alarm[2] = (0.15 * room_speed)
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

