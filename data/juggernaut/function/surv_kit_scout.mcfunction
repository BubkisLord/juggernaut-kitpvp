execute as @s[tag=!has_jug_kit] run give @s spyglass[enchantments={knockback:2},enchantment_glint_override=false,hide_additional_tooltip={},hide_tooltip={}]
execute as @s[tag=!has_jug_kit] run give @s glowstone_dust[item_name='{"text": "Powder of Revealing","color": "gold"}',lore=['{"text": "Reveals enemies far away","color": "dark_gray"}']] 2
execute as @s[tag=!has_jug_kit] run give @s cooked_beef 16
execute as @s[tag=!has_jug_kit] run tag @s add scout
tag @s add has_jug_kit