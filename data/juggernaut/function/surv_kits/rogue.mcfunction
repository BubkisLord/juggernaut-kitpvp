execute if entity @s[tag=has_jug_kit] run return fail
attribute @s sneaking_speed base set 0.6
tellraw @a[tag=runner] [{"selector":"@s"},{"text":": ","color":"dark_aqua"},{"text": "Selected ","color":"white"},{"text":"Rogue","color":"#340b4b"},{"text":" Kit.","color":"white"}]
function juggernaut:descriptions/kits/runner/rogue
tag @s add rogue
tag @s add has_jug_kit