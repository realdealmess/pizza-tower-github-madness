if instance_exists(baddieID)
{
    with (baddieID)
    {
        state = enemy_states.stun
        stunned = 100
        vsp = -5
    }
}

