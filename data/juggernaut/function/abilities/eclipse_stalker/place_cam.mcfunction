scoreboard players set #stalker_cameras var 0
execute as @e[type=armor_stand,tag=camera] run scoreboard players add #stalker_cameras var 1
execute if score #stalker_cameras var matches ..5 at @s anchored eyes run function juggernaut:raycasts/raycast {\
    player_tag:"eclipse_stalker",\
    raycast_tag:"eclipse_stalker_raycast",\
    target_tag:"_",\
    hit_distance:0,\
    raycast_limit:60,\
    move_function_id:2,\
    hit_function_id:6,\
    collides_with_blocks:1,\
}