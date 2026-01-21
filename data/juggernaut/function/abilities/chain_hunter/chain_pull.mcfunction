tag @s add teleporting
function juggernaut:raycasts/raycast {\
    player_tag:"chain_hunter",\
    raycast_id:"chain_pull",\
    target_tag:"runner",\
    hit_distance:2.5,\
    raycast_limit:20,\
    move_function_id:3,\
    collides_with_blocks:0,\
}
tag @s remove teleporting