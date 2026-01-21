execute if score #stalker_cameras var matches ..5 at @s anchored eyes run function juggernaut:raycasts/raycast {\
    player_tag:"eclipse_stalker",\
    raycast_id:"destroy_cam",\
    target_tag:"camera",\
    hit_distance:4,\
    raycast_limit:60,\
    move_function_id:2,\
    collides_with_blocks:1,\
}
scoreboard players set #stalker_cameras var 0
execute as @e[type=armor_stand,tag=camera] run scoreboard players add #stalker_cameras var 1