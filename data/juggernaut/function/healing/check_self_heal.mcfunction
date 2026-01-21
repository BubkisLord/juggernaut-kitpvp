scoreboard players set @s self_healing_base 2
scoreboard players set @s self_healing_modifier 100

execute if entity @s[tag=using_fractured_aid] run scoreboard players remove @s self_healing_modifier 90
execute if entity @s[tag=using_self_preservation] run scoreboard players add @s self_healing_modifier 90
execute if entity @s[tag=blood_pact_active] run scoreboard players add @s self_healing_modifier 300
execute at @s if entity @a[tag=harbinger,distance=..8] as @a[tag=harbinger,distance=..8] if score @s health < @s max_health as @p run scoreboard players add @s self_healing_modifier 15
execute at @s if entity @a[tag=using_overwhelming_presence,distance=..15] run scoreboard players remove @s self_healing_modifier 15

scoreboard players operation @s self_healing_per_tick = @s self_healing_base
scoreboard players operation @s self_healing_per_tick *= @s self_healing_modifier

scoreboard players operation @s self_healing_display_speed = @s self_healing_modifier
scoreboard players operation @s self_healing_display_speed -= #100 var

# Run healing function
function juggernaut:healing/try_self_heal