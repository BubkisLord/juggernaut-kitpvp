execute if entity @a[tag=dragon] run return fail
execute if entity @s[tag=has_jug_kit] run return fail
give @s phantom_membrane[item_name={"text": "Flight"}]
attribute @s sneaking_speed base set 3
attribute @s safe_fall_distance base set 999
function juggernaut:descriptions/kits/juggernaut/dragon
tag @s add dragon
tag @s add has_jug_kit