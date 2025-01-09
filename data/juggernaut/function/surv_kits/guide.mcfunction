execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.2 with golden_apple 2
execute as @s[tag=!has_jug_kit] run function juggernaut:descriptions/kits/runner/guide
execute as @s[tag=!has_jug_kit] run tag @s add guide
tag @s add has_jug_kit