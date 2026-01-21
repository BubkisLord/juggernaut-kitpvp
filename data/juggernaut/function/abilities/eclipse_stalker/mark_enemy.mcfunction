execute if entity @s[tag=!using_camera] run return fail

execute at @s anchored eyes run function juggernaut:raycasts/raycast {\
    player_tag:"eclipse_stalker",\
    raycast_tag:"shadow_mark",\
    target_tag:"runner",\
    hit_distance:4,\
    raycast_limit:300,\
    move_function_id:0,\
    collides_with_blocks:1,\
}