execute at @p[tag=juggernaut] run spreadplayers ~ ~ 0 8 under 200 false @s[tag=in_chase]
kill @e[type=item,distance=..9]
execute if entity @s[tag=!in_chase] run scoreboard players set @s jug_kit_cooldown 2
execute if entity @s[tag=!in_chase] run particle angry_villager ~ ~ ~ 0.5 1 0.5 0 60 force @s