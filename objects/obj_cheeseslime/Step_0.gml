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


if ((state == enemy_states.stun) && ((stunned > 100) && (birdcreated == 0)))
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != enemy_states.stun)
    birdcreated = 0
if ((flash == 1) && (alarm[2] <= 0))
    alarm[2] = (0.15 * room_speed)
if (((obj_player1.x > (x - 400)) && (obj_player1.x < (x + 400))) && ((y <= (obj_player1.y + 60)) && (y >= (obj_player1.y - 60))))
{
    if ((state != enemy_states.idle) && (obj_player1.state == states.mach3))
    {
        state = enemy_states.idle
        sprite_index = scaredspr
        if (x != obj_player1.x)
            image_xscale = (-sign((x - obj_player1.x)))
    }
}
if instance_exists(obj_player2)
{
    if (((obj_player2.x > (x - 400)) && (obj_player2.x < (x + 400))) && ((y <= (obj_player2.y + 60)) && (y >= (obj_player2.y - 60))))
    {
        if ((state != enemy_states.idle) && (obj_player2.state == states.mach3))
        {
            state = enemy_states.idle
            sprite_index = scaredspr
            if (x != obj_player2.x)
                image_xscale = (-sign((x - obj_player2.x)))
        }
    }
}
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

