#Sound and particles



# KitPVP
execute if score #game_state var matches 0 run execute as @e[tag=replenishment.station] at @s if entity @a[limit=1,sort=nearest,distance=0..16] run particle minecraft:totem_of_undying ~ ~2.5 ~ 0.2 1 0.2 0 2 force @a[distance=0..25]
execute if score #game_state var matches 0 run execute as @e[tag=replenishment.station] at @s if entity @a[limit=1,sort=nearest,distance=0..16] run particle minecraft:portal ~ ~2 ~ 0 1 0 0 1 force @a[distance=0..25]
execute if score #game_state var matches 0 run execute as @e[tag=replenishment.station] at @s if entity @a[limit=1,sort=nearest,distance=0..16] run scoreboard players add @s aura_sound 1
execute if score #game_state var matches 0 as @e[scores={aura_sound=20..},tag=replenishment.station] run function abilities:aura_sound



# Juggernaut
# Display a blocked replenishment station to the juggernauts.
execute as @e[tag=replenishment.station_emitter] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] run particle minecraft:totem_of_undying ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=!runner]
execute as @e[tag=replenishment.station_emitter] at @s if score #game_state var matches 11 if entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] run particle minecraft:white_smoke ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=!runner]

# Display replenishment stations to the runners.
execute if score #game_state var matches 11 run execute as @e[tag=replenishment.station_emitter] at @s run particle minecraft:totem_of_undying ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=runner]

execute if score #game_state var matches 11 run execute as @e[tag=replenishment.station] at @s if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..24] if entity @s[scores={replenish_timeout=1..}] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=!runner]
execute if score #game_state var matches 11 run execute as @e[tag=replenishment.station] at @s if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] unless entity @a[tag=predator,scores={sneak_time=1}] if entity @s[scores={replenish_timeout=1..}] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=runner]
# execute if score #game_state var matches 11 run execute as @e[tag=replenishment.station] at @s if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] if entity @s[scores={replenish_timeout=1..}] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=runner]

#If the game is juggernaut, allow the runners to progress them.
execute as @e[tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] as @a[tag=runner,distance=..3] run scoreboard players add @n[type=armor_stand,tag=juggernaut_manager] replenish_progress 1
#Allow engineer towers to replenish.
# When the engineer is in range of another replenishment station it goes at half speed.
execute as @e[type=armor_stand,tag=replenishment_tower] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] if entity @a[tag=engineer,distance=..3] run scoreboard players add @s replenish_counter 1
execute as @e[type=armor_stand,tag=replenishment_tower] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] if entity @a[tag=engineer,distance=..3] if score @s replenish_counter matches 3.. run scoreboard players add @n[type=armor_stand,tag=juggernaut_manager] replenish_progress 1
execute as @e[type=armor_stand,tag=replenishment_tower] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] if entity @a[tag=engineer,distance=..3] if score @s replenish_counter matches 3.. run scoreboard players set @s replenish_counter 0
# When the engineer is away from a replenishment station it goes at 1 and a half speed.
execute as @e[type=armor_stand,tag=replenishment_tower] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] as @a[tag=engineer,distance=..3] at @s unless entity @e[type=armor_stand,tag=replenishment.station,distance=..3] run scoreboard players add @n[type=armor_stand,tag=juggernaut_manager] replenish_progress 1

# Engineer towers have a beacon to show that they are replenishing.
execute as @e[tag=replenishment_tower] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] run particle minecraft:trial_omen ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a

#Display replenishment station particles.
execute as @e[tag=replenishment.station] at @s if score #game_state var matches 11 if entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] as @a[tag=runner,distance=..3] at @s run particle flame ~ ~ ~ 0.5 1 0.5 0.00001 2 force

execute as @e[tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] as @a[tag=runner,distance=..3] at @s run particle end_rod ~ ~ ~ 0.5 1 0.5 0.00001 1 force

#Set replenishment timeout
execute if score #game_state var matches 11 as @e[type=armor_stand,tag=replenishment.station] at @s unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] if entity @a[tag=runner,distance=..6] run scoreboard players set @s replenish_timeout 6



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