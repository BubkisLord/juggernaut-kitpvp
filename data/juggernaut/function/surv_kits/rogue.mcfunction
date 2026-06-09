execute if entity @s[tag=has_jug_kit] run return fail
attribute @s sneaking_speed base set 0.6
function juggernaut:descriptions/kits/runner/rogue
tag @s add rogue
tag @s add has_jug_kit