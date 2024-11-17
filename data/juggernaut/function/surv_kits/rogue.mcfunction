execute as @s[tag=!has_jug_kit] run tag @s add rogue
execute as @s[tag=!has_jug_kit] run attribute @s player.sneaking_speed base set 0.7
tag @s add has_jug_kit