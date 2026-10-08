# --- Runner ---
execute if entity @s[tag=runner] if score @s perks_enabled >= #juggernaut_customisation max_perks_equipped run tag @s add has_max_perks
execute if entity @s[tag=runner] if score @s perks_enabled < #juggernaut_customisation max_perks_equipped run tag @s remove has_max_perks

# If perks are turned off entirely, nobody needs to equip anything to be "ready"
execute if entity @s[tag=runner] if score #juggernaut_customisation max_perks_equipped matches 0 run tag @s add has_max_perks

# --- Juggernaut (fixed max of 1) ---
execute if entity @s[tag=juggernaut] if score @s perks_enabled >= #1 var run tag @s add has_max_perks
execute if entity @s[tag=juggernaut] if score @s perks_enabled < #1 var run tag @s remove has_max_perks