execute as @s[tag=!has_jug_kit] run item replace entity @s armor.head with iron_helmet[unbreakable={},trim={show_in_tooltip:false,material:"netherite",pattern:"bolt"}]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.chest with iron_chestplate[unbreakable={},trim={show_in_tooltip:false,material:"netherite",pattern:"bolt"}]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.legs with iron_leggings[unbreakable={},trim={show_in_tooltip:false,material:"netherite",pattern:"bolt"}]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.feet with iron_boots[unbreakable={},trim={show_in_tooltip:false,material:"netherite",pattern:"bolt"}]
execute as @s[tag=!has_jug_kit] run give @s iron_sword[unbreakable={},enchantments={sharpness:4}]
execute as @s[tag=!has_jug_kit] run give @s bow[unbreakable={},enchantments={power:1}]
execute as @s[tag=!has_jug_kit] run give @s tipped_arrow[item_name='{"text": "Chain Arrows!!!"}',lore=['{"text": "I am a chain arrow!","color": "dark_gray"}','{"text": "Yayy what fun!","color": "dark_gray"}']] 128
execute as @s[tag=!has_jug_kit] run give @s cooked_beef 64
execute as @s[tag=!has_jug_kit] run tag @s add chain_hunter
tag @s add has_jug_kit