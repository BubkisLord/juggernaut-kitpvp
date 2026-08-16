execute if entity @s[tag=has_jug_kit] run return fail
tellraw @a[tag=runner] [{"selector":"@s"},{"text":": ","color":"dark_aqua"},{"text": "Selected ","color":"white"},{"text":"Trickster","color":"#4f06d5"},{"text":" Kit.","color":"white"}]
function juggernaut:descriptions/kits/runner/trickster
tag @s add trickster
tag @s add has_jug_kit