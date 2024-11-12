scoreboard players set @s jug_kit_cooldown_2 4
tag @s add teleporting
function juggernaut:raycasts/raycast {\
    player_tag:"chain_hunter",\
    raycast_tag:"chain_hunter_raycast",\
    target_tag:"runner",\
    hit_distance:2.5,\
    raycast_limit:48,\
    move_function_id:3,\
    hit_function_id:4,\
    collides_with_blocks:0,\
}
tag @s remove teleporting