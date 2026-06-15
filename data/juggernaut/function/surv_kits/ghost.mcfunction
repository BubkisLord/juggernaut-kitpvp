execute if entity @s[tag=has_jug_kit] run return fail
attribute @s sneaking_speed base set 0
function juggernaut:descriptions/kits/runner/ghost
tag @s add ghost
tag @s add has_jug_kit