scoreboard players set @s current_raycast_depth 0
function juggernaut:raycasts/raycast {\
    player_tag:"dragon",\
    raycast_tag:"dragon_breath_raycast",\
    target_tag:"runner",\
    hit_distance:30,\
    raycast_limit:2,\
    move_function_id:0,\
    hit_function_id:0,\
}