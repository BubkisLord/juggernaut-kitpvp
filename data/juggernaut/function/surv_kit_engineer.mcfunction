# execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.0 with red_concrete[item_name='{"text": "Remove Tower","color": "red","bold": true}']
execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.1 with raw_gold_block[item_name='[{"text": "Spawn Revealing Tower","color": "gold","bold": true},{"text": " | "},{"text": "READY","color": "green"}]']
execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.2 with lime_dye[item_name='[{"text": "Spawn Replenishment Tower","color": "green","bold": true},{"text": " | "},{"text": "READY","color": "green"}]']
execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.3 with clock[item_name='{"text": "Borrowed Time Ability"}',lore=['{"text": "Taking damage for the next 10 seconds is nullified","color":"dark_gray"}','{"text":"but then later applied periodically in stacks of 2.","color": "dark_gray"}']]
execute as @s[tag=!has_jug_kit] run give @s golden_apple 3
execute as @s[tag=!has_jug_kit] run give @s cooked_beef 16
execute as @s[tag=!has_jug_kit] run tag @s add engineer
tag @s add has_jug_kit