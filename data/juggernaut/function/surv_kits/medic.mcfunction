execute if entity @s[tag=has_jug_kit] run return fail
give @s golden_apple 2
tag @s add medic
function juggernaut:descriptions/kits/runner/medic
tag @s add has_jug_kit