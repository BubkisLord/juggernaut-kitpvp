execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.0 with packed_ice[item_name='{"text": "Ice Bomb","color": "#A4D1EA"}',lore=['{"text": "Freezes those close by!","color": "dark_gray"}']] 2
execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.1 with stone[item_name='{"text": "Resistance Stone","color": "gray"}',lore=['{"text": "Protects the user for a second from all incoming damage."}']] 1
execute as @s[tag=!has_jug_kit] run give @s cooked_beef 32
execute as @s[tag=!has_jug_kit] run tag @s add survivor
tag @s add has_jug_kit