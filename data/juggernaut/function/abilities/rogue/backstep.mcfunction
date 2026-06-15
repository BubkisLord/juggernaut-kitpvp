execute if entity @s[tag=in_chase] at @p[tag=juggernaut] positioned ^ ^ ^-1.5 run tp @s ~ ~ ~ facing ^ ^ ^-3000

execute if entity @s[tag=!in_chase] run particle angry_villager ~ ~0.5 ~ 1 1 1 0 80 force
execute if entity @s[tag=!in_chase] run scoreboard players set @s ability_cooldown1 2