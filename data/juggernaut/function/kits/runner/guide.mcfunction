execute if entity @s[tag=has_jug_kit] run return fail
tellraw @a[tag=runner] [{"selector":"@s"},{"text":": ","color":"dark_aqua"},{"text": "Selected ","color":"white"},{"text":"Guide","color":"#f7d336"},{"text":" Kit.","color":"white"}]
function juggernaut:descriptions/kits/runner/guide
tag @s add guide
tag @s add has_jug_kit