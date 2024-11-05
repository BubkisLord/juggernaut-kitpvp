execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.0 with gunpowder[item_name='[{"text": "Floo","strikethrough": true},{"text": " Flee Powder","strikethrough": false}]'] 1
execute as @s[tag=!has_jug_kit] run give @s cooked_beef 16
execute as @s[tag=!has_jug_kit] run tag @s add escapist
tag @s add has_jug_kit