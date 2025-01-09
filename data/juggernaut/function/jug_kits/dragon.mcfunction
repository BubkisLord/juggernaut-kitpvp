execute as @s[tag=!has_jug_kit] run give @s phantom_membrane[item_name='{"text": "Flight"}']
execute as @s[tag=!has_jug_kit] run attribute @s sneaking_speed base set 3
execute as @s[tag=!has_jug_kit] run attribute @s safe_fall_distance base set 999
execute as @s[tag=!has_jug_kit] run function juggernaut:descriptions/kits/juggernaut/dragon
execute as @s[tag=!has_jug_kit] run tag @s add dragon
tag @s add has_jug_kit