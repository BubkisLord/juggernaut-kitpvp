execute if entity @s[tag=!using_camera] run return fail

execute at @s anchored eyes run function juggernaut:raycasts/raycast {\
    player_tag:"eclipse_stalker",\
    target_tag:"runner",\
    raycast_id: "materialise",\
    hit_distance:8,\
    raycast_limit:300,\
    move_function_id:0,\
    collides_with_blocks:0,\
}