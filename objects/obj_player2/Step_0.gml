scr_getinput2()
if (state != enemy_states.grabbed && state != states.hurt)
    thrown = 0
if (global.coop == 0)
    fightball = 0
if (state != states.mach3 && state != enemy_states.grabbed)
    fightball = 0
if (key_start && global.coop == 1 && fightball == 0)
{
    with (instance_create(x, y, obj_dashcloud))
        sprite_index = spr_bombexplosion
    repeat (6)
        instance_create(x, y, obj_baddiegibs)
    global.coop = 0
    instance_destroy(obj_cooppointer)
    instance_destroy(obj_coopflag)
    obj_player1.spotlight = 1
    obj_player1.depth = -7
    scr_soundeffect(sfx_explosion)
}
if (global.coop == 0)
{
    obj_player1.spotlight = 1
    x = -1000
    y = 500
    state = states.titlescreen
    if instance_exists(obj_coopflag)
        instance_destroy(obj_coopflag)
    if instance_exists(obj_cooppointer)
        instance_destroy(obj_cooppointer)
}
scr_playersounds()
if (grounded && state != states.handstandjump)
    suplexmove = 0
if (state != states.freefall)
    freefallsmash = 0
if (global.playerhealth <= 0 && state != states.gameover)
{
    image_index = 0
    sprite_index = spr_deathstart
    state = states.gameover
}
if (state == states.gameover && y > (room_height * 2))
{
    scr_playerreset()
    targetDoor = "none"
    room = hub_room1
}
if ((!instance_exists(baddiegrabbedID)) && (state == states.grab || state == states.superslam || state == states.tacklecharge))
    state = states.normal
if (!(state == states.grab || state == states.superslam || state == states.mach2))
    baddiegrabbedID = 0
if grinding
    state = states.grind
if (anger == 0)
    angry = 0
if (anger > 0)
{
    angry = 1
    anger -= 1
}
if (sprite_index == spr_winding && state != states.normal)
    windingAnim = 0
if (state != states.grab)
    swingdingbuffer = 0
if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
    instance_create((x + random_range(-5, 5)), (y + 46), obj_vomit)
if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
{
    with (instance_create((x + random_range(-5, 5)), (y + 46), obj_vomit))
        sprite_index = spr_vomit2
}
if (global.playerhealth == 1 && (!instance_exists(obj_sweat)) && obj_player.state == states.normal)
    instance_create(x, y, obj_sweat)
if (angry == 1 && (!instance_exists(angryeffectid)) && state == states.normal)
{
    with (instance_create(x, y, obj_angrycloud))
    {
        playerid = other.object_index
        other.angryeffectid = id
    }
}
if (global.combotime == 0 && global.combo != 0)
    global.combo = 0
if (input_buffer_jump < 8)
    input_buffer_jump++
if (input_buffer_secondjump < 8)
    input_buffer_secondjump++
if (input_buffer_highjump < 8)
    input_buffer_highjump++
if (key_particles == 1)
    instance_create(random_range((x + 25), (x - 25)), random_range((y + 35), (y - 25)), obj_keyeffect)
if (inv_frames == 0 && hurted == 0)
    image_alpha = 1
if (state == states.mach2 || state == states.tacklecharge || state == states.skateboard || state == states.knightpep || state == states.boxxedpep || state == states.cheesepep || state == states.knightpepslopes || state == states.knightpepattack || state == states.bombpep || state == states.facestomp || state == states.machfreefall || state == states.machroll || state == states.mach3 || state == states.freefall || state == states.Sjump)
    attacking = 1
else
    attacking = 0
if (state == states.throwing || state = states.punch || state == states.backkick || state == states.shoulder || state == states.uppunch)
    grabbing = 1
else
    grabbing = 0
if (state == states.mach3 || state == states.slipnslide || (state == states.hurt && thrown == 1) || state == states.mach2 || state == states.climbwall || state == states.freefall || state == states.tumble || state == states.fireass || state == states.firemouth || state == states.noise_hookshot || state == states.skateboard || state == 35 || state == states.Sjump || state == states.machroll || state == states.machfreefall || state == states.tacklecharge || (state == states.superslam && sprite_index == spr_piledriver) || state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes || state == states.boxxedpep || state == states.cheesepep || state == states.cheeseball)
    instakillmove = 1
else
    instakillmove = 0
if (flash == 1 && alarm[0] <= 0)
    alarm[0] = (0.15 * room_speed)
if (state != states.mach3 && state != states.machslide)
    autodash = 0
if ((state != states.jump && state != states.crouchjump && state != states.slap) || vsp < 0)
    fallinganimation = 0
if (state != states.freefall_land && state != states.normal && state != states.machslide)
    facehurt = 0
if (state != states.normal && state != states.machslide)
    machslideAnim = 0
if (state != states.normal)
{
    idle = 0
    dashdust = 0
}
if (state != states.mach1 && state != states.jump && state != states.noise_hookshot && state != states.handstandjump && state != states.normal && state != states.mach2 && state != states.mach3 && state != states.freefallprep && state != states.knightpep && state != states.shotgun && state != states.knightpepslopes)
    momemtum = 0
if (state != states.Sjump && state != states.Sjump_prep)
    a = 0
if (state != states.facestomp)
    facestompAnim = 0
if (state != states.freefall && state != states.facestomp && state != states.superslam && state != states.freefall_land)
    superslam = 0
if (state != states.mach2)
    machpunchAnim = 0
if (state != states.jump)
    ladderbuffer = 0
if (state != states.jump)
    stompAnim = 0
if ((state == states.mach3 || (state == enemy_states.grabbed && instance_exists(obj_player1) && obj_player1.state == states.mach3) || state == states.mach2 || state == states.climbwall || state == states.noise_hookshot || state == states.machroll || state == states.tacklecharge || state == states.handstandjump || state == states.machslide) && macheffect == 0)
{
    macheffect = 1
    toomuchalarm1 = 6
    with (instance_create(x, y, obj_mach3effect))
    {
        playerid = other.object_index
        image_index = (other.image_index - 1)
        image_xscale = other.xscale
        sprite_index = other.sprite_index
    }
}
if (!(state == states.mach3 || (state == enemy_states.grabbed && instance_exists(obj_player1) && obj_player1.state == states.mach3) || state == states.mach2 || state == states.climbwall || state == states.noise_hookshot || state == states.machroll || state == states.tacklecharge || state == states.handstandjump || state == states.machslide))
    macheffect = 0
if (toomuchalarm1 > 0)
{
    toomuchalarm1 -= 1
    if (toomuchalarm1 <= 0 && (state == states.mach3 || (state == enemy_states.grabbed && instance_exists(obj_player1) && obj_player1.state == states.mach3) || state == states.climbwall || state == states.noise_hookshot || state == states.mach2 || state == states.tacklecharge || state == states.machslide || state == states.machroll || state == states.handstandjump || (state == states.chainsaw && mach2 >= 100)))
    {
        with (instance_create(x, y, obj_mach3effect))
        {
            playerid = other.object_index
            image_index = (other.image_index - 1)
            image_xscale = other.xscale
            sprite_index = other.sprite_index
        }
        toomuchalarm1 = 6
    }
}
if (y < -800)
{
    x = roomstartx
    y = -500
    state = states.freefall
    vsp = 10
}
if (character == "S")
{
    if (state == states.crouchjump || state == states.crouch)
        state = states.normal
}
if (!place_meeting(x, y, obj_solid))
{
    if (state != states.jump && sprite_index != spr_bombpepintro && sprite_index != spr_knightpepthunder && state != states.tumble && state != states.fireass && state != states.crouch && state != states.boxxedpep && state != states.pistol && sprite_index != spr_player_crouchshoot && state != 65 && state != 33 && state != 37 && state != 73 && state != 68 && state != 67)
        mask_index = spr_player_mask
    else
        mask_index = spr_crouchmask
}
else if place_meeting(x, y, obj_solid)
    mask_index = spr_crouchmask
if (character == "S" && state == states.bombpep)
    mask_index = spr_player_mask
else if (character == "S")
    mask_index = spr_crouchmask
if (state == states.got_treasure || sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder || state == states.keyget || state == states.door || state == states.ejected || state == states.victory || state == states.comingoutdoor || state == states.gameover)
    cutscene = 1
else
    cutscene = 0
if ((place_meeting(x, y, obj_door) || place_meeting(x, y, obj_dresser) || place_meeting(x, y, obj_snick) || place_meeting(x, y, obj_keydoor) || (place_meeting(x, y, obj_exitgate) && global.panic == 1)) && (!instance_exists(obj_uparrow)) && scr_solid(x, (y + 1)) && state == states.normal && obj_player1.spotlight == 0)
{
    with (instance_create(x, y, obj_uparrow))
        playerid = other.object_index
}
if (state == states.mach2 && (!instance_exists(speedlineseffectid)))
{
    with (instance_create(x, y, obj_speedlines))
    {
        playerid = other.object_index
        other.speedlineseffectid = id
    }
}
scr_collide_destructibles()
if (state != states.titlescreen && state != enemy_states.grabbed && state != states.door && state != states.Sjump && state != states.ejected && state != states.comingoutdoor && state != states.boulder && state != states.keyget && state != states.victory && state != states.portal && state != states.timesup && state != states.got_treasure && state != states.gameover)
    scr_collide_player()
if (state == states.boulder)
    scr_collide_player()


