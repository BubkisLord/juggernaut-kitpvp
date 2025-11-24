execute as @s[tag=!has_jug_kit] run item replace entity @s armor.head with iron_helmet
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.chest with iron_chestplate
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.legs with iron_leggings
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.feet with iron_boots[enchantments={feather_falling:10}]
execute as @s[tag=!has_jug_kit] run give @s diamond_sword[enchantments={sharpness:4},tooltip_display={hidden_components:["enchantments"]},unbreakable={}]
execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.1 with red_dye[item_name='[{"text": "Spawn Malevolent Aura","color": "dark_red"},{"text": " | "},{"text": "READY","color": "green"}]'] 1
execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.2 with cyan_dye[item_name='[{"text": "Spawn Banishment Glyph","color": "dark_aqua"},{"text": " | "},{"text": "READY","color": "green"}]'] 1
execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.3 with black_dye[item_name='[{"text": "Spawn Withering Surge","color": "dark_gray"},{"text": " | "},{"text": "READY","color": "green"}]'] 1
execute as @s[tag=!has_jug_kit] run tag @s add warlock
tag @s add has_jug_kit