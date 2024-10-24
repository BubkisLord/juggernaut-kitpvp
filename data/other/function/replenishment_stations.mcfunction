#Sound and particles
execute if entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=0}] run execute as @e[tag=replenishment.station] at @s if entity @a[limit=1,sort=nearest,distance=0..16] run particle minecraft:totem_of_undying ~ ~2.5 ~ 0.2 1 0.2 0 2 force @a[distance=0..25]
execute if entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=0}] run execute as @e[tag=replenishment.station] at @s if entity @a[limit=1,sort=nearest,distance=0..16] run particle minecraft:portal ~ ~2 ~ 0 1 0 0 1 force @a[distance=0..25]
execute if entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=0}] run execute as @e[tag=replenishment.station] at @s if entity @a[limit=1,sort=nearest,distance=0..16] run scoreboard players add @s aura_sound 1
execute as @e[scores={aura_sound=20..},tag=replenishment.station] run function abilities:aura_sound
execute as @e[tag=replenishment.station] at @s if entity @a[limit=1,sort=nearest,distance=0..16] run scoreboard players add @s aura_sound 1


#For juggernaut game mode displaying stations
# COMMAND TO SPAWN REPLENISHMENT STATION
# summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,CustomNameVisible:false,NoGravity:true,Small:true,Tags:["replenishment.station","replenishment.station_emitter"]}

execute unless entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=0}] run execute as @e[tag=replenishment.station_emitter] at @s run particle minecraft:totem_of_undying ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a

execute unless entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=0}] run execute as @e[tag=replenishment.station] at @s if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..24] if entity @s[scores={replenish_timeout=1..}] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=juggernaut]

execute unless entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=0}] run execute as @e[tag=replenishment.station] at @s if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] if entity @s[scores={replenish_timeout=1..}] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a

# execute unless entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=0}] run execute as @e[tag=replenishment.station] at @s if entity @a[tag=runner,limit=1,sort=nearest,distance=..6] if entity @a[tag=juggernaut,distance=24..] run particle minecraft:composter ~ ~2 ~ 0.1 60 0.1 0 60 force @a[tag=juggernaut]

#If the game is juggernaut, allow the runners to progress them.
execute as @e[tag=replenishment.station] at @s if entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=1}] unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] as @a[tag=runner,distance=0..3] run scoreboard players add @e[type=armor_stand,tag=juggernaut_manager] replenish_progress 1
execute as @e[tag=replenishment.station] at @s if entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=1}] if entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] as @a[tag=runner,distance=0..3] at @s run particle flame ~ ~ ~ 0.5 1 0.5 0.00001 2 force
execute as @e[tag=replenishment.station] at @s if entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=1}] unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] as @a[tag=runner,distance=0..3] at @s run particle end_rod ~ ~ ~ 0.5 1 0.5 0.00001 2 force
execute as @e[tag=replenishment.station] at @s unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] if entity @a[tag=runner,distance=..6] run scoreboard players set @s replenish_timeout 6


#Scoreboard, title and replenishment
scoreboard players add @a[tag=!lobby.player,tag=!tutorial.player,scores={seconds=1..}] replenish_cd 1
execute as @a[scores={replenish_cd=20..}] run scoreboard players remove @s seconds 1
execute as @a[scores={replenish_cd=20..}] run scoreboard players set @s replenish_cd 0
execute at @e[tag=replenishment.station] as @a[distance=..1,scores={seconds=..0}] run function other:replenish
execute unless entity @n[type=armor_stand,tag=juggernaut_manager,scores={game_state=1}] run execute at @e[tag=replenishment.station,nbt={Small:1b}] as @a[distance=..8] run title @s[scores={seconds=1..}] actionbar [{"text":"Replenishment: ","color":"yellow","bold":false},{"score":{"name":"*","objective":"seconds"},"color":"red","bold":false}]
execute unless entity @n[type=armor_stand,tag=juggernaut_manager,scores={game_state=1}] run execute at @e[tag=replenishment.station,nbt={Small:1b}] as @a[distance=..8] run title @s[scores={seconds=..0}] actionbar [{"text":"Replenishment: ","color":"yellow","bold":false},{"text":"Ready","color":"green","bold":false}]

#Tutorial stations
execute unless entity @n[type=armor_stand,tag=juggernaut_manager,scores={game_state=1}] run execute at @e[tag=replenishment.station,nbt={Small:0b}] as @a[distance=..8] run title @s actionbar [{"text":"Replenishment: ","color":"yellow","bold":false},{"text":"Ready","color":"green","bold":false}]