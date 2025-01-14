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



execute as @s[nbt={Inventory:[{id:"minecraft:raiser_armor_trim_smithing_template"}]}] run tag @s add using_predatory_instincts

execute as @s[nbt={Inventory:[{id:"minecraft:raiser_armor_trim_smithing_template"}]}] run clear @s raiser_armor_trim_smithing_template
execute as @s[nbt={Inventory:[{id:"minecraft:vex_armor_trim_smithing_template"}]}] run tag @s add using_rapid_brutality
execute as @s[nbt={Inventory:[{id:"minecraft:vex_armor_trim_smithing_template"}]}] run clear @s vex_armor_trim_smithing_template
execute as @s[nbt={Inventory:[{id:"minecraft:wild_armor_trim_smithing_template"}]}] run tag @s add using_brutal_efficiency
execute as @s[nbt={Inventory:[{id:"minecraft:wild_armor_trim_smithing_template"}]}] run clear @s wild_armor_trim_smithing_template
execute as @s[nbt={Inventory:[{id:"minecraft:coast_armor_trim_smithing_template"}]}] run tag @s add using_unyielding_wrath
execute as @s[nbt={Inventory:[{id:"minecraft:coast_armor_trim_smithing_template"}]}] run clear @s coast_armor_trim_smithing_template
execute as @s[nbt={Inventory:[{id:"minecraft:snout_armor_trim_smithing_template"}]}] run tag @s add using_domination
execute as @s[nbt={Inventory:[{id:"minecraft:snout_armor_trim_smithing_template"}]}] run clear @s snout_armor_trim_smithing_template
execute as @s[nbt={Inventory:[{id:"minecraft:ward_armor_trim_smithing_template"}]}] run tag @s add using_floods_of_rage
execute as @s[nbt={Inventory:[{id:"minecraft:ward_armor_trim_smithing_template"}]}] run clear @s ward_armor_trim_smithing_template
execute as @s[nbt={Inventory:[{id:"minecraft:wayfinder_armor_trim_smithing_template"}]}] run tag @s add using_pressure_point
execute as @s[nbt={Inventory:[{id:"minecraft:wayfinder_armor_trim_smithing_template"}]}] run clear @s wayfinder_armor_trim_smithing_template
execute as @s[nbt={Inventory:[{id:"minecraft:rib_armor_trim_smithing_template"}]}] run tag @s add using_overwhelming_presence
execute as @s[nbt={Inventory:[{id:"minecraft:rib_armor_trim_smithing_template"}]}] run clear @s rib_armor_trim_smithing_template
execute as @s[nbt={Inventory:[{id:"minecraft:silence_armor_trim_smithing_template"}]}] run tag @s add using_bane_of_solidarity
execute as @s[nbt={Inventory:[{id:"minecraft:silence_armor_trim_smithing_template"}]}] run clear @s silence_armor_trim_smithing_template
execute as @s[nbt={Inventory:[{id:"minecraft:spire_armor_trim_smithing_template"}]}] run tag @s add using_crippling_defeat
execute as @s[nbt={Inventory:[{id:"minecraft:spire_armor_trim_smithing_template"}]}] run clear @s spire_armor_trim_smithing_template
execute as @s[nbt={Inventory:[{id:"minecraft:dune_armor_trim_smithing_template"}]}] run tag @s add using_waiting_game
execute as @s[nbt={Inventory:[{id:"minecraft:dune_armor_trim_smithing_template"}]}] run clear @s dune_armor_trim_smithing_template
execute as @s[nbt={Inventory:[{id:"minecraft:tide_armor_trim_smithing_template"}]}] run tag @s add using_quickened_stealth
execute as @s[nbt={Inventory:[{id:"minecraft:tide_armor_trim_smithing_template"}]}] run clear @s tide_armor_trim_smithing_template
function juggernaut:descriptions/mechanics/juggernaut_perks {container_slot:"container.9"}