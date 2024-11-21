execute as @s[tag=!has_jug_kit] run item replace entity @s armor.head with leather_helmet[enchantment_glint_override=false,enchantments={protection:2},unbreakable={}]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.chest with leather_chestplate[enchantment_glint_override=false,enchantments={protection:2},unbreakable={}]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.legs with leather_leggings[enchantment_glint_override=false,enchantments={protection:2},unbreakable={}]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.feet with leather_boots[enchantment_glint_override=false,enchantments={protection:2},unbreakable={}]
execute as @s[tag=!has_jug_kit] run give @s blackstone[attribute_modifiers={modifiers:[{type:"minecraft:generic.attack_damage",id:"minecraft:generic.attack_damage",amount:6.5,operation:"add_value"}]}]
execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.1 with splash_potion[potion_contents={potion:"healing"},max_stack_size=32] 32
execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.5 with splash_potion[potion_contents={potion:"strong_harming"},max_stack_size=3] 3
execute as @s[tag=!has_jug_kit] run tag @s add witchdoctor
tag @s add has_jug_kit