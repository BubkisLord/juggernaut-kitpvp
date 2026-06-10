execute if entity @s[tag=has_jug_kit] run return fail
item replace entity @s hotbar.1 with golden_apple 2
function juggernaut:descriptions/kits/runner/guide
tag @s add guide
tag @s add has_jug_kit