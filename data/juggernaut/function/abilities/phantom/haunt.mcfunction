scoreboard players set @s ability_cooldown0 4000
function juggernaut:raycasts/raycast {\
    player_tag:"phantom",\
    raycast_id:"haunt",\
    target_tag:"runner",\
    hit_distance:1.5,\
    raycast_limit:48,\
    collides_with_blocks:0,\
}