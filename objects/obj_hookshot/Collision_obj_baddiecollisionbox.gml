if (hooked == 0)
{
    targetbaddie = other.id
    hooked = 1
    obj_player.state = states.noise_hookshot
}
x = targetbaddie.x
y = targetbaddie.y

