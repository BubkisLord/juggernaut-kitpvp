execute if entity @s[tag=has_jug_kit] run return fail
attribute @s sneaking_speed base set 0
tellraw @a[tag=runner] [{"selector":"@s"},{"text":": ","color":"dark_aqua"},{"text": "Selected ","color":"white"},{"text":"Ghost","color":"dark_gray"},{"text":" Kit.","color":"white"}]
function juggernaut:descriptions/kits/runner/ghost
tag @s add ghost
tag @s add has_jug_kit