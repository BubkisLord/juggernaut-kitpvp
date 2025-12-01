execute as @s[tag=!has_jug_kit] run give @s stick[enchantments={knockback:3},attribute_modifiers=[{id:"minecraft:attack_speed",type:"minecraft:attack_speed",amount:1.6,operation:"add_value"}],tooltip_display={hidden_components:["enchantments","attribute_modifiers"]},item_name={"text": "Medic's Staff","color": "aqua"},lore=[{"text": "A staff used by medics to defend themselves while healing.","color": "dark_gray"}],enchantment_glint_override=true]
execute as @s[tag=!has_jug_kit] run give @s golden_apple 3
execute as @s[tag=!has_jug_kit] run give @s enchanted_golden_apple 1
# execute as @s[tag=!has_jug_kit] run function juggernaut:descriptions/kits/runner/medic
execute as @s[tag=!has_jug_kit] run tag @s add medic
tag @s add has_jug_kit