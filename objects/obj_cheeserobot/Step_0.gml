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
idlespr = spr_cheeserobot_idle
stunfallspr = spr_cheeserobot_stun
walkspr = spr_cheeserobot_walk
stunspr = spr_cheeserobot_stun
grabbedspr = spr_cheeserobot_stun
if ((flash == 1) && (alarm[2] <= 0))
    alarm[2] = (0.15 * room_speed)
if (hp <= 0)
    instance_destroy()
if (state != enemy_states.grabbed)
    depth = 0
if (state != enemy_states.stun)
    thrown = 0
if (bombreset > 0)
    bombreset--
if ((x != obj_player.x) && ((state != enemy_states.pizzagoblin_throw) && (bombreset == 0)))
{
    if (((obj_player.x > (x - 400)) && (obj_player.x < (x + 400))) && ((y <= (obj_player.y + 20)) && (y >= (obj_player.y - 20))))
    {
        if ((state == enemy_states.walk) || (state == enemy_states.idle))
        {
            scr_sound(sound_enemythrow)
            image_index = 0
            image_xscale = (-sign((x - obj_player.x)))
            state = enemy_states.pizzagoblin_throw
        }
    }
}

