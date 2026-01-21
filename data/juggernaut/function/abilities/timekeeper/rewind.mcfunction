execute if entity @s[tag=rewinding] run tag @s add stop_rewind
execute unless entity @s[tag=rewinding] run tag @s add rewinding
execute if entity @s[tag=stop_rewind,tag=rewinding] run tag @s remove rewinding
execute if entity @s[tag=stop_rewind] run tag @s remove stop_rewind
execute if entity @s[tag=rewinding] run scoreboard players set @s jug_kit_cooldown 1