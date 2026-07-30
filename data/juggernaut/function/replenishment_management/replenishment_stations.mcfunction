# COMMAND TO SPAWN REPLENISHMENT STATION
# summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,CustomNameVisible:false,NoGravity:true,Small:true,Marker:true,Tags:["replenishment.station"]}

# COMMAND TO SPAWN ARENA SPAWN POINT
# summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,CustomNameVisible:false,NoGravity:true,Small:true,Marker:true,Tags:["arena.spawn"]}

execute as @e[type=armor_stand,tag=replenishment.station] run function juggernaut:replenishment_management/clamp_station_replenishment

# Display a blocked replenishment station to the juggernauts.
execute as @e[type=armor_stand,tag=replenishment.station,tag=!haunted_station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..24] run particle minecraft:totem_of_undying ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=!runner]
execute as @e[type=armor_stand,tag=replenishment.station,tag=!haunted_station] at @s if entity @e[type=armor_stand,tag=banishment_glyph,distance=..24] run particle minecraft:white_smoke ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=!runner]
execute as @e[type=armor_stand,tag=replenishment.station,tag=haunted_station] at @s run particle minecraft:raid_omen ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=!runner]

execute as @a[tag=!runner] at @s run title @s actionbar [{"text":"Total Replenishment: ","color": "dark_aqua","bold": true},{"score":{"name":"#juggernaut_manager","objective":"replenish_decimal"},"bold": true,"color": "dark_aqua"},{"text": "%"},{"text": " [","color": "dark_aqua","bold":true},{"score":{"name":"#stations_completed","objective":"var"},"color": "dark_aqua","bold":true},{"text": "/","color": "dark_aqua","bold":true},{"score":{"name":"#stations_needed","objective":"var"},"color": "dark_aqua","bold":true},{"text": "]","color": "dark_aqua","bold":true}]
execute as @a[tag=runner,tag=!in_chase] at @s run title @s actionbar [{"text":"Total Replenishment: ","color": "dark_aqua","bold": true},{"score":{"name":"#juggernaut_manager","objective":"replenish_decimal"},"bold": true,"color": "dark_aqua"},{"text": "%"},{"text": " [","color": "dark_aqua","bold":true},{"score":{"name":"#stations_completed","objective":"var"},"color": "dark_aqua","bold":true},{"text": "/","color": "dark_aqua","bold":true},{"score":{"name":"#stations_needed","objective":"var"},"color": "dark_aqua","bold":true},{"text": "]","color": "dark_aqua","bold":true}]

# Display replenishment stations to the runners.
execute as @e[type=armor_stand,tag=replenishment.station] at @s run particle minecraft:totem_of_undying ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=runner]
execute if entity @a[tag=phantom] as @e[type=armor_stand,tag=haunted_station] at @s run particle large_smoke ~ ~0.5 ~ 2 2 2 0 20 force @a[tag=runner]

# Display purple particles for jugs
execute as @e[type=armor_stand,tag=replenishment.station] at @s if entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..24] if entity @s[scores={replenish_timeout=1..}] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=!runner]

# Allow runners to progress stations.
execute as @e[type=armor_stand,tag=replenishment.station] at @s as @a[tag=runner,distance=..3] run function juggernaut:replenishment_management/try_replenish

# If the replenishment station has sentinel activated on it, reveal the juggernaut with an 8 second timeout.
execute as @e[type=armor_stand,tag=replenishment.station,tag=sentinel_tower] at @s as @a[tag=juggernaut,distance=..8,tag=!undetectable] run effect give @s glowing 8 0 true

# Effects when a station is completed.
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score @s replenish_amount >= #total_replenishment_per_station var if score #juggernaut_customisation completable_stations matches 1 run function juggernaut:hooks/station_completed

# Allow engineer towers to replenish.
execute as @e[type=armor_stand,tag=replenishment_tower] at @s as @a[tag=runner,distance=..3] at @s unless entity @n[type=armor_stand,tag=replenishment.station,distance=..3] at @n[type=armor_stand,tag=replenishment.station,tag=highest_station] run function juggernaut:replenishment_management/try_replenish
execute as @e[type=armor_stand,tag=replenishment_tower] at @s run particle minecraft:totem_of_undying ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=juggernaut]

# Display shapeshifter's fake replenishment particles to runners
execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..12] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12,tag=!shapeshifting] as @a[tag=shapeshifting,distance=..3] at @s run particle end_rod ~ ~ ~ 0.5 1 0.5 0.00001 1 force

# Check for end game
execute if score #juggernaut_customisation debug_mode matches 0 if score #juggernaut_customisation completable_stations matches 1 run function juggernaut:replenishment_management/check_needed_stations_completed