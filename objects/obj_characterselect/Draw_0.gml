if (ready == 0)
{
    if (selected == 0)
    {
        draw_sprite(spr_player1cursor, -1, 344, enemy_states.idle)
        if (global.coop == 1)
            draw_sprite(spr_player2cursor, -1, 528, enemy_states.idle)
    }
    if (selected == 1)
    {
        draw_sprite(spr_player1cursor, -1, 528, enemy_states.idle)
        if (global.coop == 1)
            draw_sprite(spr_player2cursor, -1, 344, enemy_states.idle)
    }
}
else
{
    if (selected == 0)
    {
        draw_sprite(spr_player1cursorselected, -1, 344, enemy_states.idle)
        if (global.coop == 1)
            draw_sprite(spr_player2cursorselected, -1, 528, enemy_states.idle)
    }
    if (selected == 1)
    {
        draw_sprite(spr_player1cursorselected, -1, 528, enemy_states.idle)
        if (global.coop == 1)
            draw_sprite(spr_player2cursorselected, -1, 344, enemy_states.idle)
    }
}

