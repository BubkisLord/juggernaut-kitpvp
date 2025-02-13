execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.0 with snowball[item_name='{"text": "Ice Bomb","color": "#A4D1EA"}',lore=['{"text": "Freezes those close by!","color": "dark_gray"}']] 2
# execute as @s[tag=!has_jug_kit] run attribute @s scale base set 1.2
# execute as @s[tag=!has_jug_kit] run attribute @s entity_interaction_range base set 3.2
# execute as @s[tag=!has_jug_kit] run attribute @s movement_speed base set 0.09
# execute as @s[tag=!has_jug_kit] run attribute @s jump_strength base set 0.6
# execute as @s[tag=!has_jug_kit] run attribute @s step_height base set 1
# execute as @s[tag=!has_jug_kit] run attribute @s safe_fall_distance base set 4.5
# execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.1 with stone[item_name='{"text": "Resistance Stone","color": "gray"}',lore=['{"text": "Protects the user for a second from all incoming damage."}']] 1
execute as @s[tag=!has_jug_kit] run give @s golden_apple 4
# execute as @s[tag=!has_jug_kit] run function juggernaut:descriptions/kits/runner/survivor
execute as @s[tag=!has_jug_kit] run tag @s add survivor
tag @s add has_jug_kit