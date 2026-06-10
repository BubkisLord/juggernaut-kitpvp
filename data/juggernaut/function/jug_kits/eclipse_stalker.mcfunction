execute if entity @a[tag=eclipse_stalker] run return fail
execute if entity @s[tag=has_jug_kit] run return fail
item replace entity @s hotbar.0 with iron_sword[item_name={"text": "Stalker's Sword", "color": "aqua"},unbreakable={},enchantments={sharpness:3}]
effect give @s resistance infinite 1 true
tag @s add eclipse_stalker
time set midnight
tag @s add has_jug_kit