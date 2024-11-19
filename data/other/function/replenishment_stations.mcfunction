#Sound and particles



# KitPVP
execute if score #game_state var matches 0 run execute as @e[tag=replenishment.station] at @s if entity @a[limit=1,sort=nearest,distance=0..16] run particle minecraft:totem_of_undying ~ ~2.5 ~ 0.2 1 0.2 0 2 force @a[distance=0..25]
execute if score #game_state var matches 0 run execute as @e[tag=replenishment.station] at @s if entity @a[limit=1,sort=nearest,distance=0..16] run particle minecraft:portal ~ ~2 ~ 0 1 0 0 1 force @a[distance=0..25]
execute if score #game_state var matches 0 run execute as @e[tag=replenishment.station] at @s if entity @a[limit=1,sort=nearest,distance=0..16] run scoreboard players add @s aura_sound 1
execute if score #game_state var matches 0 as @e[scores={aura_sound=20..},tag=replenishment.station] run function abilities:aura_sound



# Juggernaut
# Display a blocked replenishment station to the juggernauts.
execute as @e[tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] run particle minecraft:totem_of_undying ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=!runner]
execute as @e[tag=replenishment.station] at @s if score #game_state var matches 11 if entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] run particle minecraft:white_smoke ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=!runner]

# Display replenishment stations to the runners.
execute if score #game_state var matches 11 run execute as @e[tag=replenishment.station] at @s run particle minecraft:totem_of_undying ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=runner]

# display purple particles for jugs
execute if score #game_state var matches 11 run execute as @e[tag=replenishment.station] at @s if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..24] if entity @s[scores={replenish_timeout=1..}] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=!runner]
# display purple particles for rogues (because they alone have a radius of 24 blocks)
execute if score #game_state var matches 11 run execute as @e[tag=replenishment.station] at @s if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..24] unless entity @a[tag=predator,scores={is_sneaking=1}] if entity @s[scores={replenish_timeout=1..}] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=rogue]
# display purple particles for all other runners
execute if score #game_state var matches 11 run execute as @e[tag=replenishment.station] at @s if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] unless entity @a[tag=predator,scores={is_sneaking=1}] if entity @s[scores={replenish_timeout=1..}] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=runner,tag=!rogue]

# execute if score #game_state var matches 11 run execute as @e[tag=replenishment.station] at @s if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] if entity @s[scores={replenish_timeout=1..}] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=runner]

#If the game is juggernaut, allow the runners to progress them.
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3] run scoreboard players add @n[type=armor_stand,tag=juggernaut_manager] replenish_progress 1
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

# King of the Hill (Solo & Teams)
execute if score #game_state var matches 30..39 run execute as @e[tag=koth_hill] at @s run particle minecraft:totem_of_undying ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a
execute if score #game_state var matches 30..39 run execute as @e[tag=koth_hill] at @s if entity @a[limit=1,sort=nearest,distance=0..16] run scoreboard players add @s aura_sound 1
execute if score #game_state var matches 30..39 as @e[scores={aura_sound=20..},tag=koth_hill] run function abilities:aura_sound
execute as @e[tag=koth_hill] at @s if score #game_state var matches 30..39 as @a[tag=!spectator,distance=..3] run scoreboard players add @s king_of_the_hill_points 1



# COMMAND TO SPAWN REPLENISHMENT STATION
# summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,CustomNameVisible:false,NoGravity:true,Small:true,Tags:["replenishment.station","replenishment.station_emitter"]}


#Scoreboard, title and replenishment
scoreboard players add @a[tag=!lobby.player,tag=!tutorial.player,scores={seconds=1..}] replenish_cd 1
execute as @a[scores={replenish_cd=20..}] run scoreboard players remove @s seconds 1
execute as @a[scores={replenish_cd=20..}] run scoreboard players set @s replenish_cd 0
execute if score #game_state var matches 0..19 at @e[tag=replenishment.station] as @a[distance=..1,scores={seconds=..0}] run function other:replenish
execute if score #game_state var matches 0 run execute at @e[tag=replenishment.station,nbt={Small:1b}] as @a[distance=..8] run title @s[scores={seconds=1..}] actionbar [{"text":"Replenishment: ","color":"yellow","bold":false},{"score":{"name":"*","objective":"seconds"},"color":"red","bold":false}]
execute if score #game_state var matches 0 run execute at @e[tag=replenishment.station,nbt={Small:1b}] as @a[distance=..8] run title @s[scores={seconds=..0}] actionbar [{"text":"Replenishment: ","color":"yellow","bold":false},{"text":"Ready","color":"green","bold":false}]

#Tutorial stations
execute if score #game_state var matches 0 run execute at @e[tag=replenishment.station,nbt={Small:0b}] as @a[distance=..8] run title @s actionbar [{"text":"Replenishment: ","color":"yellow","bold":false},{"text":"Ready","color":"green","bold":false}]