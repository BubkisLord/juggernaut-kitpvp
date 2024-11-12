execute as @s[tag=!has_jug_kit] run item replace entity @s armor.head with iron_helmet[unbreakable={}]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.chest with iron_chestplate[unbreakable={}]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.legs with iron_leggings[unbreakable={}]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.feet with iron_boots[unbreakable={}]
execute as @s[tag=!has_jug_kit] run give @s iron_sword[custom_model_data=2,item_name='{"text": "Iron Spear"}',enchantments={sharpness:3}]
execute as @s[tag=!has_jug_kit] run give @s bow[enchantments={flame:1,infinity:1},hide_additional_tooltip={},item_name='{"text": "Hunter\'s Bow","color": "dark_red"}',enchantment_glint_override=true,lore=['{"text": "Weapon crafted from the bones of the hunter\'s victims.","color": "dark_gray"}'],unbreakable={},custom_model_data=1]
execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.5 with cooked_beef 64
execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.6 with arrow
execute as @s[tag=!has_jug_kit] run tag @s add jug_hunter
tag @s add has_jug_kit