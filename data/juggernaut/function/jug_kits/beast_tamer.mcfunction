execute if entity @a[tag=beast_tamer] run return fail
execute if entity @s[tag=has_jug_kit] run return fail
effect give @s resistance infinite 0 true
# function juggernaut:descriptions/kits/juggernaut/beast_tamer
tag @s add beast_tamer
tag @s add has_jug_kit