execute if entity @s[tag=has_jug_kit] run return fail
item replace entity @s hotbar.5 with golden_apple 3
tellraw @a[tag=runner] [{"selector":"@s"},{"text":": ","color":"dark_aqua"},{"text": "Selected ","color":"white"},{"text":"Engineer","color":"dark_purple"},{"text":" Kit.","color":"white"}]
function juggernaut:descriptions/kits/runner/engineer
tag @s add engineer
tag @s add has_jug_kit