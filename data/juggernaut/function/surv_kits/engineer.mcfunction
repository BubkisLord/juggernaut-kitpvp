execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.5 with golden_apple 3
execute as @s[tag=!has_jug_kit] run function juggernaut:descriptions/kits/runner/engineer
execute as @s[tag=!has_jug_kit] run tag @s add engineer
tag @s add has_jug_kit