execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.0 with iron_sword[item_name='{"text": "Stalker\'s Sword", "color": "aqua"}',unbreakable={show_in_tooltip:false},enchantments={sharpness:3}]
execute as @s[tag=!has_jug_kit] run tag @s add eclipse_stalker
tag @s add has_jug_kit