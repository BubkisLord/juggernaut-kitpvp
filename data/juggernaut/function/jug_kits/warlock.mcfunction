execute if entity @a[tag=warlock] run return fail
execute if entity @s[tag=has_jug_kit] run return fail
item replace entity @s armor.head with iron_helmet
item replace entity @s armor.chest with iron_chestplate
item replace entity @s armor.legs with iron_leggings
item replace entity @s armor.feet with iron_boots[enchantments={feather_falling:10}]
give @s diamond_sword[enchantments={sharpness:4},tooltip_display={hidden_components:["enchantments"]},unbreakable={}]
item replace entity @s hotbar.1 with red_dye[item_name=[{"text": "Spawn Malevolent Aura","color": "dark_red"},{"text": " | "},{"text": "READY","color": "green"}]] 1
item replace entity @s hotbar.2 with cyan_dye[item_name=[{"text": "Spawn Banishment Glyph","color": "dark_aqua"},{"text": " | "},{"text": "READY","color": "green"}]] 1
item replace entity @s hotbar.3 with black_dye[item_name=[{"text": "Spawn Withering Surge","color": "dark_gray"},{"text": " | "},{"text": "READY","color": "green"}]] 1
function juggernaut:descriptions/kits/juggernaut/warlock
tag @s add warlock
tag @s add has_jug_kit