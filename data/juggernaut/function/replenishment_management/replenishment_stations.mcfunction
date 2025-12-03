# Juggernaut
# Display a blocked replenishment station to the juggernauts.
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] run particle minecraft:totem_of_undying ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=!runner]
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 if entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] run particle minecraft:white_smoke ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=!runner]

# Display replenishment stations to the runners.
execute as @e[type=armor_stand,tag=replenishment.station] at @s run particle minecraft:totem_of_undying ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=runner]

execute as @a[tag=is_undetectable] at @s run tag @e[type=armor_stand,tag=replenishment.station,distance=..6] add apply_undetectable

# display purple particles for jugs
execute as @e[type=armor_stand,tag=replenishment.station,tag=!apply_undetectable] at @s if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..24] if entity @s[scores={replenish_timeout=1..}] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=!runner]
execute as @e[type=armor_stand,tag=replenishment.station,tag=apply_undetectable] at @s if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..6] if entity @s[scores={replenish_timeout=1..}] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=!runner]
# display purple particles for rogues (because they alone have a radius of 24 blocks)
execute as @e[type=armor_stand,tag=replenishment.station] at @s if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=..24] unless entity @a[tag=predator,scores={is_sneaking=1},distance=..24] if entity @s[scores={replenish_timeout=1..}] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=runner,tag=rogue]
# display purple particles for all other runners
execute as @e[type=armor_stand,tag=replenishment.station] at @s if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=..12] unless entity @a[tag=predator,scores={is_sneaking=1},distance=..12] if entity @s[scores={replenish_timeout=1..}] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=runner,tag=!rogue]

#If the game is juggernaut, allow the runners to progress them.
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,tag=!is_not_replenishing] run scoreboard players add #juggernaut_manager replenish_progress 1

execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,tag=!is_not_replenishing] run scoreboard players add @s ticks_spent_replenishing 1

execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,tag=!is_not_replenishing] run scoreboard players operation @s ticks_spent_buffing = @s ticks_spent_replenishing
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,tag=!is_not_replenishing] run scoreboard players operation @s ticks_spent_debuffing = @s ticks_spent_replenishing

execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,tag=!is_not_replenishing] run scoreboard players operation @s ticks_till_increment = #100 var
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,tag=!is_not_replenishing] run scoreboard players operation @s ticks_till_decrement = #100 var

execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,scores={replenish_debuff=1..},tag=!is_not_replenishing] run scoreboard players operation @s ticks_till_decrement /= @s replenish_debuff
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,scores={replenish_debuff=1..},tag=!is_not_replenishing] run scoreboard players operation @s ticks_spent_debuffing %= @s ticks_till_decrement

execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,scores={replenish_buff=1..},tag=!is_not_replenishing] run scoreboard players operation @s ticks_till_increment /= @s replenish_buff
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,scores={replenish_buff=1..},tag=!is_not_replenishing] run scoreboard players operation @s ticks_spent_buffing %= @s ticks_till_increment

execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,scores={replenish_debuff=1..,ticks_spent_debuffing=0},tag=!is_not_replenishing] run scoreboard players remove @n[type=armor_stand,tag=replenishment.station] replenish_amount 1
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,scores={replenish_debuff=1..,ticks_spent_debuffing=0},tag=!is_not_replenishing] run scoreboard players remove #juggernaut_manager replenish_progress 1

execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,scores={replenish_buff=1..,ticks_spent_buffing=0},tag=!is_not_replenishing] run scoreboard players add @n[type=armor_stand,tag=replenishment.station] replenish_amount 1
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,scores={replenish_buff=1..,ticks_spent_buffing=0},tag=!is_not_replenishing] run scoreboard players add #juggernaut_manager replenish_progress 1

execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,tag=!is_not_replenishing] run scoreboard players add @n[type=armor_stand,tag=replenishment.station] replenish_amount 1
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,tag=using_unwavering_strength,tag=!is_not_replenishing] run scoreboard players add #juggernaut_manager replenish_progress 2
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,tag=using_unwavering_strength,tag=!is_not_replenishing] run scoreboard players add @n[type=armor_stand,tag=replenishment.station] replenish_amount 2

execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,tag=has_respawn_time,tag=!is_not_replenishing] run function juggernaut:clear_respawn_period
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,tag=!is_not_replenishing] if entity @s[tag=using_sentinel] run scoreboard players add @n[type=armor_stand,tag=replenishment.station] sentinel_progress 1
# execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 if score @s sentinel_progress matches 160.. run tag @e[type=armor_stand,tag=sentinel_tower] remove sentinel_tower
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 if score @s sentinel_progress matches 160.. run tag @s add sentinel_tower
execute as @e[type=armor_stand,tag=replenishment.station,tag=sentinel_tower,scores={sentinel_progress=1..}] run scoreboard players set @s sentinel_progress 0
execute as @e[type=armor_stand,tag=replenishment.station,tag=sentinel_tower] at @s as @a[tag=juggernaut,distance=..8,tag=!is_undetectable] run effect give @s glowing 1 0 true

# Effects when a station is completed.
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score @s replenish_amount >= #total_replenishment_per_station var if score #juggernaut_customisation completable_stations matches 1 run function juggernaut:replenishment_management/check_station_completed

#Allow engineer towers to replenish.
# When the engineer is in range of another replenishment station it goes at half speed.
execute as @e[type=armor_stand,tag=replenishment_tower] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] if entity @a[tag=engineer,distance=..3] run scoreboard players add @s replenish_counter 1
execute as @e[type=armor_stand,tag=replenishment_tower] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] if entity @a[tag=engineer,distance=..3] if score @s replenish_counter matches 3.. run scoreboard players add #juggernaut_manager replenish_progress 1
execute as @e[type=armor_stand,tag=replenishment_tower] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] if entity @a[tag=engineer,distance=..3] if score @s replenish_counter matches 3.. run scoreboard players set @s replenish_counter 0
# When the engineer is away from a replenishment station it goes at 1 and a half speed.
execute as @e[type=armor_stand,tag=replenishment_tower] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] as @a[tag=engineer,distance=..3] at @s unless entity @e[type=armor_stand,tag=replenishment.station,distance=..3] run scoreboard players add #juggernaut_manager replenish_progress 1

# Engineer towers have a beacon to show that they are replenishing.
# execute as @e[type=armor_stand,tag=replenishment_tower] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] run particle minecraft:trial_omen ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a

#Display replenishment station particles.
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 if entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] as @a[tag=runner,distance=..3,tag=!is_not_replenishing] at @s run particle flame ~ ~ ~ 0.5 1 0.5 0.00001 2 force

execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,tag=!is_not_replenishing] at @s run particle end_rod ~ ~ ~ 0.5 1 0.5 0.00001 1 force
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,tag=using_unwavering_strength,tag=!is_not_replenishing] at @s run particle end_rod ~ ~ ~ 0.5 1 0.5 0.00001 2 force

#Set replenishment timeout
execute if score #game_state var matches 11 as @e[type=armor_stand,tag=replenishment.station] at @s unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] if entity @a[tag=runner,distance=..6] unless entity @s[tag=jug_ghost,tag=is_not_replenishing] run scoreboard players set @s replenish_timeout 6

scoreboard players set #stations_completed var 0
execute if score #juggernaut_customisation completable_stations matches 1 run function juggernaut:replenishment_management/check_needed_stations_completed