with (other.id)
{
    if (((other.state == enemy_states.stun) && (other.thrown == 1)) || ((other.state == enemy_states.grabbed) && (obj_player.state == states.superslam)))
        instance_destroy()
}

