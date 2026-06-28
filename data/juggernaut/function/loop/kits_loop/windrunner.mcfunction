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