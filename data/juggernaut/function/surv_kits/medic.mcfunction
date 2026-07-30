execute if entity @s[tag=has_jug_kit] run return fail
give @s golden_apple 2
tag @s add medic
tellraw @a[tag=runner] [{"selector":"@s"},{"text":": ","color":"dark_aqua"},{"text": "Selected ","color":"white"},{"text":"Medic","color":"green"},{"text":" Kit.","color":"white"}]
function juggernaut:descriptions/kits/runner/medic
tag @s add has_jug_kit