#Sound and particles



# KitPVP
execute if score #game_state var matches 0 run execute as @e[tag=replenishment.station] at @s if entity @a[limit=1,sort=nearest,distance=0..16] run particle minecraft:totem_of_undying ~ ~2.5 ~ 0.2 1 0.2 0 2 force @a[distance=0..25]
execute if score #game_state var matches 0 run execute as @e[tag=replenishment.station] at @s if entity @a[limit=1,sort=nearest,distance=0..16] run particle minecraft:portal ~ ~2 ~ 0 1 0 0 1 force @a[distance=0..25]
execute if score #game_state var matches 0 run execute as @e[tag=replenishment.station] at @s if entity @a[limit=1,sort=nearest,distance=0..16] run scoreboard players add @s aura_sound 1
execute if score #game_state var matches 0 as @e[scores={aura_sound=20..},tag=replenishment.station] run function abilities:aura_sound

execute if score #game_state var matches 10..11 run function juggernaut:replenishment_management/replenishment_stations

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