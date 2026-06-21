scoreboard players set @s self_healing_base 2
scoreboard players set @s self_healing_modifier 100

execute at @s if entity @a[tag=using_overwhelming_presence,distance=..20] run scoreboard players remove @s self_healing_modifier 90
execute at @s if entity @a[tag=using_oppression] run scoreboard players remove @s self_healing_modifier 70
execute at @s if entity @a[tag=using_deep_cuts] run scoreboard players remove @s self_healing_modifier 90

execute if entity @s[tag=using_healer] run scoreboard players add @s self_healing_modifier 250
execute if entity @s[tag=using_no_caution] run scoreboard players set @s self_healing_modifier 0

scoreboard players operation @s self_healing_per_tick = @s self_healing_base
scoreboard players operation @s self_healing_per_tick *= @s self_healing_modifier

scoreboard players operation @s self_healing_display_speed = @s self_healing_modifier
scoreboard players operation @s self_healing_display_speed -= #100 var

# Run healing function
function juggernaut:healing/try_self_heal