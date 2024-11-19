# Juggernaut
# Display a blocked replenishment station to the juggernauts.
execute as @e[tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] run particle minecraft:totem_of_undying ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=!runner]
execute as @e[tag=replenishment.station] at @s if score #game_state var matches 11 if entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] run particle minecraft:white_smoke ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=!runner]

# Display replenishment stations to the runners.
execute as @e[tag=replenishment.station] at @s run particle minecraft:totem_of_undying ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=runner]

# display purple particles for jugs
execute as @e[tag=replenishment.station] at @s if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..24] if entity @s[scores={replenish_timeout=1..}] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=!runner]
# display purple particles for rogues (because they alone have a radius of 24 blocks)
execute as @e[tag=replenishment.station] at @s if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..24] unless entity @a[tag=predator,scores={is_sneaking=1}] if entity @s[scores={replenish_timeout=1..}] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=rogue]
# display purple particles for all other runners
execute as @e[tag=replenishment.station] at @s if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] unless entity @a[tag=predator,scores={is_sneaking=1}] if entity @s[scores={replenish_timeout=1..}] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=runner,tag=!rogue]

# execute as @e[tag=replenishment.station] at @s if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] if entity @s[scores={replenish_timeout=1..}] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=runner]

#If the game is juggernaut, allow the runners to progress them.
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3] run scoreboard players add @n[type=armor_stand,tag=juggernaut_manager] replenish_progress 1

execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3] run scoreboard players add @s ticks_spent_replenishing 1

execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3] run scoreboard players operation @s ticks_spent_buffing = @s ticks_spent_replenishing
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3] run scoreboard players operation @s ticks_spent_debuffing = @s ticks_spent_replenishing

execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3] run scoreboard players operation @s ticks_till_increment = #100 var
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3] run scoreboard players operation @s ticks_till_decrement = #100 var

execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,scores={replenish_debuff=1..}] run scoreboard players operation @s ticks_till_decrement /= @s replenish_debuff
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,scores={replenish_debuff=1..}] run scoreboard players operation @s ticks_spent_debuffing %= @s ticks_till_decrement

execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,scores={replenish_buff=1..}] run scoreboard players operation @s ticks_till_increment /= @s replenish_buff
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,scores={replenish_buff=1..}] run scoreboard players operation @s ticks_spent_buffing %= @s ticks_till_increment

execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,scores={replenish_debuff=1..,ticks_spent_debuffing=0}] run scoreboard players remove @n[type=armor_stand,tag=replenishment.station] replenish_amount 1
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,scores={replenish_debuff=1..,ticks_spent_debuffing=0}] run scoreboard players remove @n[type=armor_stand,tag=juggernaut_manager] replenish_progress 1

execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,scores={replenish_buff=1..,ticks_spent_buffing=0}] run scoreboard players add @n[type=armor_stand,tag=replenishment.station] replenish_amount 1
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,scores={replenish_buff=1..,ticks_spent_buffing=0}] run scoreboard players add @n[type=armor_stand,tag=juggernaut_manager] replenish_progress 1

execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3] run scoreboard players add @n[type=armor_stand,tag=replenishment.station] replenish_amount 1
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,tag=using_unwavering_strength] run scoreboard players add @n[type=armor_stand,tag=juggernaut_manager] replenish_progress 1
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,tag=using_unwavering_strength] run scoreboard players add @n[type=armor_stand,tag=replenishment.station] replenish_amount 1

execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,tag=has_respawn_time] run function juggernaut:clear_respawn_period
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3] if entity @s[tag=using_sentinel] run scoreboard players add @n[type=armor_stand,tag=replenishment.station] sentinel_progress 1
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 if score @s sentinel_progress matches 160.. run tag @e[tag=sentinel_tower] remove sentinel_tower
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 if score @s sentinel_progress matches 160.. run tag @s add sentinel_tower
execute as @e[type=armor_stand,tag=replenishment.station,tag=sentinel_tower,scores={sentinel_progress=1..}] run scoreboard players set @s sentinel_progress 0
execute as @e[type=armor_stand,tag=replenishment.station,tag=sentinel_tower] at @s as @a[tag=juggernaut,distance=..8] run effect give @s glowing 1 0 true

# Effects when a station is completed.
# execute as @e[type=armor_stand,tag=replenishment.station] at @s if score @s replenish_amount >= #total_replenishment_per_station var run tag @s add station_completed
# execute as @e[type=armor_stand,tag=replenishment.station] at @s if score @s replenish_amount >= #total_replenishment_per_station var run function juggernaut:hooks/station_completed
# execute as @e[type=armor_stand,tag=replenishment.station] at @s if score @s replenish_amount >= #total_replenishment_per_station var if entity @a[tag=using_shared_resolve,distance=..3] as @a[tag=runner,distance=..3] run function juggernaut:effects/apply_effect {effect:"undetectable",duration:20,color:"gray"}
# execute as @e[type=armor_stand,tag=replenishment.station] at @s if score @s replenish_amount >= #total_replenishment_per_station var if entity @a[tag=using_shared_resolve,distance=..3] as @a[tag=runner,distance=..3] run effect give @s resistance 4 1 true
# execute as @e[type=armor_stand,tag=replenishment.station] at @s if score @s replenish_amount >= #total_replenishment_per_station var if entity @a[tag=using_shared_resolve,distance=..3] as @a[tag=runner,distance=..3] run effect give @s speed 4 1 true
# execute as @e[type=armor_stand,tag=replenishment.station] at @s if score @s replenish_amount >= #total_replenishment_per_station var as @a[tag=runner] at @s run particle firework ~ ~ ~ 3 3 3 0 200 force @a[tag=runner]
# execute as @e[type=armor_stand,tag=replenishment.station] at @s if score @s replenish_amount >= #total_replenishment_per_station var as @a[tag=runner] at @s run particle firework ~ ~ ~ 0 100 0 0 300 force @a[tag=juggernaut]
# execute as @e[type=armor_stand,tag=replenishment.station] at @s if score @s replenish_amount >= #total_replenishment_per_station var as @a[tag=runner] at @s run playsound block.end_portal_frame.fill master @s ~ ~ ~ 3 0.4
# execute as @e[type=armor_stand,tag=replenishment.station] at @s if score @s replenish_amount >= #total_replenishment_per_station var as @a[tag=juggernaut] at @s run playsound entity.ender_dragon.growl master @s ~ ~ ~ 3 0.4
# execute as @e[type=armor_stand,tag=replenishment.station] at @s if score @s replenish_amount >= #total_replenishment_per_station var run tag @s add replenishment.station_deactivated
# execute as @e[type=armor_stand,tag=replenishment.station] at @s if score @s replenish_amount >= #total_replenishment_per_station var run tag @s remove replenishment.station

#Allow engineer towers to replenish.
# When the engineer is in range of another replenishment station it goes at half speed.
execute as @e[type=armor_stand,tag=replenishment_tower] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] if entity @a[tag=engineer,distance=..3] run scoreboard players add @s replenish_counter 1
execute as @e[type=armor_stand,tag=replenishment_tower] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] if entity @a[tag=engineer,distance=..3] if score @s replenish_counter matches 3.. run scoreboard players add @n[type=armor_stand,tag=juggernaut_manager] replenish_progress 1
execute as @e[type=armor_stand,tag=replenishment_tower] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] if entity @a[tag=engineer,distance=..3] if score @s replenish_counter matches 3.. run scoreboard players set @s replenish_counter 0
# When the engineer is away from a replenishment station it goes at 1 and a half speed.
execute as @e[type=armor_stand,tag=replenishment_tower] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] as @a[tag=engineer,distance=..3] at @s unless entity @e[type=armor_stand,tag=replenishment.station,distance=..3] run scoreboard players add @n[type=armor_stand,tag=juggernaut_manager] replenish_progress 1

# Engineer towers have a beacon to show that they are replenishing.
# execute as @e[type=armor_stand,tag=replenishment_tower] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] run particle minecraft:trial_omen ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a

#Display replenishment station particles.
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 if entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] as @a[tag=runner,distance=..3] at @s run particle flame ~ ~ ~ 0.5 1 0.5 0.00001 2 force

execute as @e[tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3] at @s run particle end_rod ~ ~ ~ 0.5 1 0.5 0.00001 1 force
execute as @e[tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3,tag=using_unwavering_strength] at @s run particle end_rod ~ ~ ~ 0.5 1 0.5 0.00001 2 force

#Set replenishment timeout
execute if score #game_state var matches 11 as @e[type=armor_stand,tag=replenishment.station] at @s unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] if entity @a[tag=runner,distance=..6] run scoreboard players set @s replenish_timeout 6

scoreboard players set #stations_completed var 0
# execute as @e[type=armor_stand,tag=station_completed] run scoreboard players add #stations_completed var 1
# execute if score #stations_completed var >= #stations_needed var run tellraw @a {"text": "Runners win! (Replenishment Complete)","bold": true}
# execute if score #stations_completed var >= #stations_needed var run scoreboard players add @a[tag=runner] points 100
# execute if score #stations_completed var >= #stations_needed var run function juggernaut:end_game