tag @s add teleporting
function juggernaut:raycasts/raycast {\
    player_tag:"eclipse_stalker",\
    raycast_tag:"stalker_tp",\
    target_tag:"shadow_marked",\
    hit_distance:6,\
    raycast_limit:120,\
    move_function_id:3,\
    collides_with_blocks:0,\
}
tag @s remove teleporting