execute as @s[tag=!has_jug_kit] run attribute @s sneaking_speed base set 0.6
# execute as @s[tag=!has_jug_kit] run function juggernaut:descriptions/kits/runner/rogue
execute as @s[tag=!has_jug_kit] run tag @s add rogue
tag @s add has_jug_kit