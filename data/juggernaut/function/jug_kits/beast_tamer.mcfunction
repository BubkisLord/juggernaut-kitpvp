execute if entity @a[tag=beast_tamer] run return fail
execute if entity @s[tag=has_jug_kit] run return fail
tellraw @a[tag=juggernaut] [{"selector":"@s"},{"text":": ","color":"red"},{"text": "Selected ","color":"white"},{"text":"Beast Tamer","color":"#7F63D9"},{"text":" Kit.","color":"white"}]
# function juggernaut:descriptions/kits/juggernaut/beast_tamer
tag @s add beast_tamer
tag @s add has_jug_kit