execute if entity @s[tag=!using_camera] run return fail

execute at @s anchored eyes run function juggernaut:raycasts/raycast {\
    player_tag:"eclipse_stalker",\
    raycast_tag:"eclipse_stalker_raycast",\
    target_tag:"runner",\
    hit_distance:2,\
    raycast_limit:30,\
    move_function_id:0,\
    hit_function_id:8,\
    collides_with_blocks:1,\
}