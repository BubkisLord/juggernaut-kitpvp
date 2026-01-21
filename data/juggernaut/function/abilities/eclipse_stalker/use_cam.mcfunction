tag @s add finding_camera
execute at @s anchored eyes run function juggernaut:raycasts/raycast {\
    player_tag:"eclipse_stalker",\
    raycast_tag:"use_cam",\
    target_tag:"camera",\
    hit_distance:5,\
    raycast_limit:300,\
    move_function_id:0,\
    collides_with_blocks:0,\
}
tag @s remove finding_camera