# Perks:
# Predatory Instincts - Raiser
# While stationary or walking, this perk activates. While active, any runner sprinting within a 15 block radius is revealed. Players with undetectable cannot be revealed in this way.

# Rapid Brutality - Vex
# Gain an 10% speed boost after hitting a runner, lasting for 4 seconds

# Brutal Efficiency - Wild
# Replenishment station progress regresses by 10% if a runner is hit within 5 blocks of a station. This ability has a cooldown of 30 seconds.

# Unyielding Wrath - Coast
# When in chase, this perk activates. While active, every 15 seconds, gain a stacking speed boost of 3%. When the chase ends, this perk deactivates and you lose all stacks of speed.

# Domination - Snout
# Each runner death increases your movement speed by 4%.

# Floods of Rage - Ward
# When a station is completed, this perk activates for 5 seconds. While active, all runners are revealed. Players with undetectable cannot be revealed in this way.

# Pressure Point - Wayfinder
# After killing a runner, this perk activates. When active, the nearest player is revealed for 5 seconds. Players with undetectable cannot be revealed in this way.

# Overwhelming Presence - Rib
# This perk is constantly active. While active, runners within a 15 block radius suffer from 15% slower replenishing and healing.

# Bane of Solidarity - Silence
# This perk is constantly active. While active, replenishment stations progress 10% slower when there is only one runner progressing it.

execute as @s[nbt={Inventory:[{components:{"minecraft:item_name":{"text":"Unyielding Wrath"}}}]}] run tag @s add using_unyielding_wrath
execute as @s[nbt={Inventory:[{components:{"minecraft:item_name":{"text":"Unyielding Wrath"}}}]}] run clear @s #minecraft:trim_materials
execute as @s[nbt={Inventory:[{components:{"minecraft:item_name":{"text":"Domination"}}}]}] run tag @s add using_domination
execute as @s[nbt={Inventory:[{components:{"minecraft:item_name":{"text":"Domination"}}}]}] run clear @s #minecraft:trim_materials
execute as @s[nbt={Inventory:[{components:{"minecraft:item_name":{"text":"Floods of Rage"}}}]}] run tag @s add using_floods_of_rage
execute as @s[nbt={Inventory:[{components:{"minecraft:item_name":{"text":"Floods of Rage"}}}]}] run clear @s #minecraft:trim_materials
execute as @s[nbt={Inventory:[{components:{"minecraft:item_name":{"text":"Pressure Point"}}}]}] run tag @s add using_pressure_point
execute as @s[nbt={Inventory:[{components:{"minecraft:item_name":{"text":"Pressure Point"}}}]}] run clear @s #minecraft:trim_materials
execute as @s[nbt={Inventory:[{components:{"minecraft:item_name":{"text":"Overwhelming Presence"}}}]}] run tag @s add using_overwhelming_presence
execute as @s[nbt={Inventory:[{components:{"minecraft:item_name":{"text":"Overwhelming Presence"}}}]}] run clear @s #minecraft:trim_materials
execute as @s[nbt={Inventory:[{components:{"minecraft:item_name":{"text":"Bane of Solidarity"}}}]}] run tag @s add using_bane_of_solidarity
execute as @s[nbt={Inventory:[{components:{"minecraft:item_name":{"text":"Bane of Solidarity"}}}]}] run clear @s #minecraft:trim_materials
execute as @s[nbt={Inventory:[{components:{"minecraft:item_name":{"text":"Crippling Defeat"}}}]}] run tag @s add using_crippling_defeat
execute as @s[nbt={Inventory:[{components:{"minecraft:item_name":{"text":"Crippling Defeat"}}}]}] run clear @s #minecraft:trim_materials
execute as @s[nbt={Inventory:[{components:{"minecraft:item_name":{"text":"Waiting Game"}}}]}] run tag @s add using_waiting_game
execute as @s[nbt={Inventory:[{components:{"minecraft:item_name":{"text":"Waiting Game"}}}]}] run clear @s #minecraft:trim_materials
execute as @s[nbt={Inventory:[{components:{"minecraft:item_name":{"text":"Quickened Stealth"}}}]}] run tag @s add using_quickened_stealth
execute as @s[nbt={Inventory:[{components:{"minecraft:item_name":{"text":"Quickened Stealth"}}}]}] run clear @s #minecraft:trim_materials
execute as @s[nbt={Inventory:[{components:{"minecraft:item_name":{"text":"Insidious"}}}]}] run tag @s add using_insidious
execute as @s[nbt={Inventory:[{components:{"minecraft:item_name":{"text":"Insidious"}}}]}] run clear @s #minecraft:trim_materials
function juggernaut:descriptions/mechanics/juggernaut_perks {container_slot:"container.9"}