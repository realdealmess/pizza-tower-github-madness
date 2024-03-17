if ((invframes == 0) && (state == enemy_states.stun))
{
    scr_sound(sound_slaphit)
    instance_create((x + (obj_player.xscale * 40)), y, obj_punchdust)
    state = enemy_states.grabbed
    obj_player.state = states.grab
    instance_destroy(other.id)
    obj_player.suplexhavetomash = 5
    obj_player.sprite_index = spr_player_grab
}

