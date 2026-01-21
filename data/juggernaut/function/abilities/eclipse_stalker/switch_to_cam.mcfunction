tag @s add finding_camera
execute as @p[tag=eclipse_stalker] at @s anchored eyes run function juggernaut:raycasts/raycast {\
    player_tag:"eclipse_stalker",\
    raycast_tag:"switch_to_cam",\
    target_tag:camera,\
    hit_distance:1,\
    raycast_limit:300,\
    move_function_id:0,\
    collides_with_blocks:0,\
}
tag @s remove finding_camera