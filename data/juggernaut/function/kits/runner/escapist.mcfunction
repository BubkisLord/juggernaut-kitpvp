execute if entity @s[tag=has_jug_kit] run return fail
tellraw @a[tag=runner] [{"selector":"@s"},{"text":": ","color":"dark_aqua"},{"text": "Selected ","color":"white"},{"text":"Escapist","color":"blue"},{"text":" Kit.","color":"white"}]
function juggernaut:descriptions/kits/runner/escapist
tag @s add escapist
tag @s add has_jug_kit