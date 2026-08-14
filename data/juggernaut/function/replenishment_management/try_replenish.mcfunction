execute unless score #game_state var matches 11 run return fail
execute if entity @e[type=armor_stand,tag=banishment_glyph,distance=..24] run particle flame ~ ~2.5 ~ 0.3 1 0.3 0 30 force
execute if entity @s[tag=rogue] if entity @a[tag=juggernaut,distance=18..24,tag=!undetectable] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @s
execute if entity @a[tag=juggernaut,distance=..18,tag=!undetectable] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @s
execute if entity @a[tag=juggernaut,distance=..18,tag=!shapeshifting] if entity @s[tag=!using_unwavering_strength] if entity @s[tag=!in_chase] run return fail
execute if entity @a[tag=juggernaut,distance=..18,tag=!shapeshifting] if entity @s[tag=using_unwavering_strength] at @s unless entity @a[tag=juggernaut,distance=..18,tag=!shapeshifting] run return fail
execute if entity @s[tag=spectral_cloak_active] run return fail

execute if entity @s[tag=in_chase] at @s run function juggernaut:replenishment_management/calculate_replenishment_modifier
execute if entity @s[tag=!in_chase] run function juggernaut:replenishment_management/calculate_replenishment_modifier

scoreboard players operation @s replenishment_per_tick = @s replenishment_base
scoreboard players operation @s replenishment_per_tick *= @s replenishment_modifier

scoreboard players operation @s replenishment_display_speed = @s replenishment_modifier
scoreboard players operation @s replenishment_display_speed -= #100 var

scoreboard players operation #juggernaut_manager replenish_progress += @s replenishment_per_tick
scoreboard players operation @n[type=armor_stand,tag=replenishment.station] replenish_amount += @s replenishment_per_tick
scoreboard players set @n[type=armor_stand,tag=replenishment.station] replenish_timeout 6

scoreboard players operation #juggernaut_manager temp_progress = #juggernaut_manager replenish_progress
scoreboard players operation #juggernaut_manager temp_progress *= #100 var

execute store result score #juggernaut_manager replenish_decimal run scoreboard players operation #juggernaut_manager temp_progress /= #juggernaut_manager total_replenishment_needed

execute if score #game_state var matches 11 as @e[type=armor_stand,tag=replenishment.station] run scoreboard players operation @s temp_progress = @s replenish_amount
execute if score #game_state var matches 11 as @e[type=armor_stand,tag=replenishment.station] run scoreboard players operation @s temp_progress *= #100 var

execute if score #game_state var matches 11 as @e[type=armor_stand,tag=replenishment.station] run execute store result score @s replenish_decimal run scoreboard players operation @s temp_progress /= #total_replenishment_per_station var

execute if score #juggernaut_customisation completable_stations matches 0 run function juggernaut:replenishment_management/display_actionbar_percentage
execute if score #juggernaut_customisation completable_stations matches 1 run function juggernaut:replenishment_management/display_actionbar_stations

execute if entity @s[tag=has_respawn_protection,tag=!in_chase] run function juggernaut:clear_respawn_period
execute if entity @s[tag=using_sentinel] run scoreboard players add @n[type=armor_stand,tag=replenishment.station] sentinel_progress 1
execute if entity @s[tag=using_sentinel] as @n[type=armor_stand,tag=replenishment.station] if score @s sentinel_progress matches 160.. run tag @s add sentinel_tower

execute if entity @s[tag=!in_chase] at @s run particle end_rod ~ ~ ~ 0.5 1 0.5 0.00001 1 force