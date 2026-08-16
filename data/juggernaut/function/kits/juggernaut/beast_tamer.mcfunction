execute if entity @a[tag=beast_tamer] run return fail
execute if entity @s[tag=has_jug_kit] run return fail
tellraw @a[tag=juggernaut] [{"selector":"@s"},{"text":": ","color":"red"},{"text": "Selected ","color":"white"},{"text":"Beast Tamer","color":"#05856b"},{"text":" Kit.","color":"white"}]
effect give @s resistance infinite 0 true
attribute @s safe_fall_distance modifier add juggernaut:beast_tamer 999 add_value
# function juggernaut:descriptions/kits/juggernaut/beast_tamer
tag @s add beast_tamer
tag @s add has_jug_kit