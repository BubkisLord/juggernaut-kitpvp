execute as @s[tag=!has_jug_kit] run give @s stick[enchantments={knockback:3},attribute_modifiers={show_in_tooltip:false,modifiers:[{id:"minecraft:generic.attack_speed",type:"minecraft:generic.attack_speed",amount:1.6,operation:"add_value"}]}]
execute as @s[tag=!has_jug_kit] run give @s golden_apple 3
execute as @s[tag=!has_jug_kit] run give @s enchanted_golden_apple 1
execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.4 with minecraft:cooked_beef 32
execute as @s[tag=!has_jug_kit] run tag @s add medic
tag @s add has_jug_kit