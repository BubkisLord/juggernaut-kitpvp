execute if entity @s[tag=has_jug_kit] run return fail
give @s spyglass[enchantments={knockback:1},enchantment_glint_override=false,tooltip_display={hidden_components:["enchantments"]}]
attribute @s jump_strength base set 0.55
attribute @s safe_fall_distance base set 5
function juggernaut:descriptions/kits/runner/scout
tag @s add scout
tag @s add has_jug_kit