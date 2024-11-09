# execute as @s[tag=!has_jug_kit] run item replace entity @s 
execute as @s[tag=!has_jug_kit] run give @s phantom_membrane[item_name='{"text": "Flight"}']
execute as @s[tag=!has_jug_kit] run give @s cooked_beef 32
# execute as @s[tag=!has_jug_kit] run effect give @s invisibility infinite 0 true
execute as @s[tag=!has_jug_kit] run tag @s add dragon
tag @s add has_jug_kit