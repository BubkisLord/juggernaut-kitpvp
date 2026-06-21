execute if entity @s[tag=!medic] run scoreboard players set @s healing_base 5
execute if entity @s[tag=medic] run scoreboard players set @s healing_base 7
scoreboard players set @s healing_modifier 100

execute at @s if entity @a[tag=using_overwhelming_presence,distance=..20] run scoreboard players remove @s healing_modifier 90
execute at @s if entity @a[tag=using_oppression] run scoreboard players remove @s healing_modifier 70

execute if entity @s[tag=using_healer] run scoreboard players add @s healing_modifier 100
execute if entity @s[tag=using_no_caution] run scoreboard players set @s healing_modifier 0

scoreboard players operation @s healing_per_tick = @s healing_base
scoreboard players operation @s healing_per_tick *= @s healing_modifier

scoreboard players operation @s healing_display_speed = @s healing_modifier
scoreboard players operation @s healing_display_speed -= #100 var

execute at @s run function juggernaut:healing/try_heal_player {\
    distance: 1.75\
}