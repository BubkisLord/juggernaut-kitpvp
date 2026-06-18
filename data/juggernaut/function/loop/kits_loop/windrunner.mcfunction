execute as @a[tag=windrunner] if score @s is_sprinting matches 0 run scoreboard players add @s sprint_timeout 1
execute as @a[tag=windrunner] if score @s sprint_timeout matches 14 run scoreboard players set @s sprint_time 0
execute as @a[tag=windrunner] if score @s is_sprinting matches 1.. run scoreboard players add @s sprint_time 1
execute as @a[tag=windrunner] if score @s sprint_time matches 80.. run scoreboard players set @s sprint_time 80
execute as @a[tag=windrunner] if score @s is_sprinting matches 1.. run scoreboard players set @s sprint_timeout 0
execute as @a[tag=windrunner] at @s store result storage juggernaut:loop/kits_loop/windrunner movement_speed float 0.000001 run attribute @p[tag=juggernaut] movement_speed get 1000000
execute as @a[tag=windrunner] run function juggernaut:abilities/windrunner/set_movement_speed with storage juggernaut:loop/kits_loop/windrunner
execute as @a[tag=windrunner,tag=in_chase,tag=double_chase_progress] run scoreboard players add #juggernaut_manager replenish_progress 1
execute as @a[tag=windrunner,tag=in_chase,tag=double_chase_progress] at @s if score #juggernaut_customisation completable_stations matches 1 as @n[type=armor_stand,tag=replenishment.station,tag=highest_station] run scoreboard players add @s replenish_amount 1
execute as @a[tag=windrunner,tag=double_chase_progress] if score @s ability_cooldown0 matches 0..30 run tag @s remove double_chase_progress

function juggernaut:ability_management/check_ability {\
    player_tag:"windrunner",\
    item_id:"minecraft:magma_cream",\
    item_name:{"text": "Risky Business","color": "dark_aqua"},\
    description:[{"text": "Gives the juggernaut speed but doubles your replenishment for 10 seconds.","color": "gray"},{"text": "Cooldown: 40s","color": "dark_gray"}],\
    ability_id:"risky_business",\
    cooldown:40,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}