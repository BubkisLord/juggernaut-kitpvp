playsound entity.ender_dragon.shoot master @a[distance=..35] ~ ~ ~ 3 0.8
execute as @a[tag=dragon] run function juggernaut:raycasts/raycast {\
    player_tag:"dragon",\
    raycast_id:"strong_dragon_breath",\
    target_tag:"runner",\
    hit_distance:3,\
    raycast_limit:32,\
    move_function_id:1,\
    collides_with_blocks:1,\
}