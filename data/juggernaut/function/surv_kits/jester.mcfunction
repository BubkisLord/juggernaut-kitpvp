execute if entity @s[tag=has_jug_kit] run return fail
tellraw @a[tag=runner] [{"selector":"@s"},{"text":": ","color":"dark_aqua"},{"text": "Selected ","color":"white"},{"text":"Jester","color":"#f528d3"},{"text":" Kit.","color":"white"}]
function juggernaut:descriptions/kits/runner/jester
tag @s add jester
tag @s add has_jug_kit