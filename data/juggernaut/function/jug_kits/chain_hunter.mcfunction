execute as @s[tag=!has_jug_kit] run item replace entity @s armor.head with iron_helmet[unbreakable={},trim={material:"netherite",pattern:"bolt"}]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.chest with iron_chestplate[unbreakable={},trim={material:"netherite",pattern:"bolt"}]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.legs with iron_leggings[unbreakable={},trim={material:"netherite",pattern:"bolt"}]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.feet with iron_boots[unbreakable={},trim={material:"netherite",pattern:"bolt"}]
execute as @s[tag=!has_jug_kit] run give @s iron_sword[unbreakable={},enchantments={sharpness:3,fire_aspect:1}]
execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.3 with bow[unbreakable={},enchantments={power:2,infinity:1}]
execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.4 with arrow[item_name={"text": "Chain Arrows!!!"},lore=[{"text": "I am a chain arrow!","color": "dark_gray"},{"text": "Yayy what fun!","color": "dark_gray"}],max_stack_size=1] 1
execute as @s[tag=!has_jug_kit] run tag @s add chain_hunter
tag @s add has_jug_kit