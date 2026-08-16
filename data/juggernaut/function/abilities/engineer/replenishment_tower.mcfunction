scoreboard players set #engineer_count var 0
execute as @a[tag=engineer] run scoreboard players add #engineer_count var 1
scoreboard players set #replenishment_tower_count var 0
execute as @e[type=armor_stand,tag=replenishment_tower] run scoreboard players add #replenishment_tower_count var 1
execute if score #replenishment_tower_count var >= #engineer_count var run kill @e[type=armor_stand,tag=replenishment_tower,sort=furthest,limit=1]
kill @e[type=armor_stand,tag=replenishment_tower_particle_emitter]
summon armor_stand ~ ~1 ~ {Invisible:true,Invulnerable:true,NoGravity:true,Small:true,Tags:["replenishment_tower","engineer_tower","kill_on_end_game"]}
summon armor_stand ~ ~0.5 ~ {Invisible:true,Invulnerable:true,Tags:["replenishment_tower_particle_emitter","kill_on_end_game"]}
# Duration
scoreboard players set @n[type=armor_stand,tag=replenishment_tower] var 60
scoreboard players set @n[type=armor_stand,tag=replenishment_tower] dispel_progress 0
scoreboard players set @n[type=armor_stand,tag=replenishment_tower] total_dispelling_needed 5
clear @s minecraft:iron_nugget[custom_data={kit:"engineer",ability_id:"replenishment_tower"}]