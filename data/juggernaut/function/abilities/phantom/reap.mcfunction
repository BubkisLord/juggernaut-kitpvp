execute at @s run function juggernaut:raycasts/raycast {\
    player_tag:"phantom",\
    raycast_id:"reap",\
    target_tag:"runner",\
    hit_distance:2.2,\
    raycast_limit:36,\
    collides_with_blocks:0,\
}