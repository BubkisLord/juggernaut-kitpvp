execute as @s[tag=!has_jug_kit] run attribute @s sneaking_speed base set 0
execute as @s[tag=!has_jug_kit] run function juggernaut:descriptions/kits/runner/ghost
execute as @s[tag=!has_jug_kit] run tag @s add jug_ghost
tag @s add has_jug_kit