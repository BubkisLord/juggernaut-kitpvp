execute if score #game_state var matches 10..11 run function juggernaut:replenishment_management/replenishment_stations

# King of the Hill (Solo & Teams)
execute if score #game_state var matches 30..39 run execute as @e[type=armor_stand,tag=koth_hill] at @s run particle minecraft:totem_of_undying ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a
execute if score #game_state var matches 30..39 run execute as @e[type=armor_stand,tag=koth_hill] at @s if entity @a[limit=1,sort=nearest,distance=0..16] run scoreboard players add @s aura_sound 1
execute as @e[tag=koth_hill] at @s if score #game_state var matches 30..39 as @a[tag=!spectator,distance=..3] run scoreboard players add @s king_of_the_hill_points 1

# COMMAND TO SPAWN REPLENISHMENT STATION
# summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,CustomNameVisible:false,NoGravity:true,Small:true,Tags:["replenishment.station","replenishment.station_emitter"]}