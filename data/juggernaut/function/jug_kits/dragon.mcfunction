execute if entity @a[tag=dragon] run return fail
execute if entity @s[tag=has_jug_kit] run return fail
tag @s add is_floating
attribute @s safe_fall_distance base set 999
attribute @s air_drag_modifier base set 0.8
tellraw @a[tag=juggernaut] [{"selector":"@s"},{"text":": ","color":"red"},{"text": "Selected ","color":"white"},{"text":"Dragon","color":"#7F63D9"},{"text":" Kit.","color":"white"}]
function juggernaut:descriptions/kits/juggernaut/dragon
tag @s add dragon
tag @s add has_jug_kit