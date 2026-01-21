execute as @a[tag=chameleon] run function juggernaut:raycasts/raycast {\
    player_tag:"chameleon",\
    raycast_id:"clone_player",\
    target_tag:"runner",\
    hit_distance:6,\
    raycast_limit:120,\
    collides_with_blocks:0,\
}