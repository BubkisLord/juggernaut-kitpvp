# Run as the puppetteer, positioned at their mannequin (which sits within 3 blocks of a station).
# Mirrors the economy in replenishment_management/try_replenish, using the puppetteer's own
# replenishment rate (60% base from the passive, further scaled by their replenishment perks).
function juggernaut:replenishment_management/calculate_replenishment_modifier

scoreboard players operation @s replenishment_per_tick = @s replenishment_base
scoreboard players operation @s replenishment_per_tick *= @s replenishment_modifier

scoreboard players operation #juggernaut_manager replenish_progress += @s replenishment_per_tick
scoreboard players operation @n[type=armor_stand,tag=replenishment.station] replenish_amount += @s replenishment_per_tick
scoreboard players set @n[type=armor_stand,tag=replenishment.station] replenish_timeout 6

# Recompute the total replenishment percentage shown on the actionbar.
scoreboard players operation #juggernaut_manager temp_progress = #juggernaut_manager replenish_progress
scoreboard players operation #juggernaut_manager temp_progress *= #100 var
execute store result score #juggernaut_manager replenish_decimal run scoreboard players operation #juggernaut_manager temp_progress /= #juggernaut_manager total_replenishment_needed

# Recompute the per-station percentage (used when stations must be individually completed).
execute if score #game_state var matches 11 as @n[type=armor_stand,tag=replenishment.station] run scoreboard players operation @s temp_progress = @s replenish_amount
execute if score #game_state var matches 11 as @n[type=armor_stand,tag=replenishment.station] run scoreboard players operation @s temp_progress *= #100 var
execute if score #game_state var matches 11 as @n[type=armor_stand,tag=replenishment.station] run execute store result score @s replenish_decimal run scoreboard players operation @s temp_progress /= #total_replenishment_per_station var

# Flavour: strings of replenishment particles above the mannequin.
particle minecraft:end_rod ~ ~2.4 ~ 0.2 0.4 0.2 0.001 4 force
