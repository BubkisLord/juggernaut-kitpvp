tag @s add finding_camera
execute at @s anchored eyes run function juggernaut:raycasts/raycast {\
    player_tag:"eclipse_stalker",\
    raycast_tag:"eclipse_stalker_raycast",\
    target_tag:"camera",\
    hit_distance:4,\
    raycast_limit:300,\
    move_function_id:0,\
    hit_function_id:5,\
    collides_with_blocks:0,\
}
tag @s remove finding_camera