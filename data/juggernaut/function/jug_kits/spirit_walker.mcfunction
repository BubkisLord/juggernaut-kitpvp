execute as @s[tag=!has_jug_kit] run item replace entity @s armor.head with diamond_helmet[unbreakable={}]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.chest with diamond_chestplate[unbreakable={}]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.legs with diamond_leggings[unbreakable={}]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.feet with diamond_boots[unbreakable={}]
execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.0 with diamond_sword[unbreakable={},enchantments={sharpness:4}]
execute as @s[tag=!has_jug_kit] run tag @s add spirit_walker
tag @s add has_jug_kit