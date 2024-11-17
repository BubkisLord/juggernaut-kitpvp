execute as @s[tag=!has_jug_kit] run give @s spyglass[enchantments={knockback:2},enchantment_glint_override=false,hide_additional_tooltip={}]
execute as @s[tag=!has_jug_kit] run attribute @s generic.jump_strength base set 0.55
execute as @s[tag=!has_jug_kit] run attribute @s generic.safe_fall_distance base set 5
execute as @s[tag=!has_jug_kit] run tag @s add scout
tag @s add has_jug_kit