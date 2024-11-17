execute at @s anchored eyes run function juggernaut:raycasts/raycast {\
    player_tag:"blood_stalker",\
    raycast_tag:"blood_stalker_raycast",\
    target_tag:"runner",\
    hit_distance:1.5,\
    raycast_limit:24,\
    move_function_id:4,\
    hit_function_id:3,\
    collides_with_blocks:1,\
}