execute as @a[tag=dragon] run function juggernaut:raycasts/raycast {\
    player_tag:"dragon",\
    raycast_id:"dragon_breath",\
    target_tag:"runner",\
    hit_distance:1.5,\
    raycast_limit:24,\
    move_function_id:1,\
    collides_with_blocks:1,\
}