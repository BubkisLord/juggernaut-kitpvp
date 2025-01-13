execute as @s[tag=!has_jug_kit] run give @s stick[enchantments={knockback:3},attribute_modifiers={show_in_tooltip:false,modifiers:[{id:"minecraft:attack_speed",type:"minecraft:attack_speed",amount:1.6,operation:"add_value"}]}]
execute as @s[tag=!has_jug_kit] run give @s golden_apple 3
execute as @s[tag=!has_jug_kit] run give @s enchanted_golden_apple 1
# execute as @s[tag=!has_jug_kit] run function juggernaut:descriptions/kits/runner/medic
execute as @s[tag=!has_jug_kit] run tag @s add medic
tag @s add has_jug_kit