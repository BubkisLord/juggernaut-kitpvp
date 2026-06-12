execute as @a[tag=windrunner] if score @s is_sprinting matches 0 run scoreboard players add @s sprint_timeout 1
execute as @a[tag=windrunner] if score @s sprint_timeout matches 14 run scoreboard players set @s sprint_time 0
execute as @a[tag=windrunner] if score @s is_sprinting matches 1.. run scoreboard players add @s sprint_time 1
execute as @a[tag=windrunner] if score @s sprint_time matches 80.. run scoreboard players set @s sprint_time 80
execute as @a[tag=windrunner] if score @s is_sprinting matches 1.. run scoreboard players set @s sprint_timeout 0
execute as @a[tag=windrunner] run attribute @s movement_speed modifier remove juggernaut:windrunner_sprint
execute as @a[tag=windrunner] if score @s is_sprinting matches 1.. store result storage juggernaut:loop/kits_loop/windrunner value float 0.025 run scoreboard players get @s sprint_time
execute as @a[tag=windrunner] if score @s is_sprinting matches 1.. run data modify storage juggernaut:loop/kits_loop/windrunner attribute set value movement_speed
execute as @a[tag=windrunner] if score @s is_sprinting matches 1.. run data modify storage juggernaut:loop/kits_loop/windrunner modifier_id set value windrunner_sprint
execute as @a[tag=windrunner] if score @s is_sprinting matches 1.. run data modify storage juggernaut:loop/kits_loop/windrunner operation set value add_multiplied_total
execute as @a[tag=windrunner] if score @s is_sprinting matches 1.. run function juggernaut:attribute_management/apply_modifier with storage juggernaut:loop/kits_loop/windrunner
execute as @a[tag=windrunner,tag=in_chase,tag=double_chase_progress] run scoreboard players add #juggernaut_manager replenish_progress 1
execute as @a[tag=windrunner,tag=in_chase,tag=double_chase_progress] at @s if score #juggernaut_customisation completable_stations matches 1 as @n[type=armor_stand,tag=replenishment.station,tag=highest_station] run scoreboard players add @s replenish_amount 1
execute as @a[tag=windrunner,tag=double_chase_progress] if score @s jug_kit_cooldown matches 0..30 run tag @s remove double_chase_progress

function juggernaut:ability_management/check_ability {\
    player_tag:"windrunner",\
    item_id:"minecraft:magma_cream",\
    item_name:{"text": "Risky Business","color": "dark_aqua"},\
    description:[{"text": "Gives the juggernaut speed but doubles your replenishment for 10 seconds.","color": "gray"},{"text": "Cooldown: 40s","color": "dark_gray"}],\
    ability_id:"risky_business",\
    cooldown:40,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"jug_kit_cooldown",\
}