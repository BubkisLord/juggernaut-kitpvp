kill @e[tag=replenishment_tower]
kill @e[tag=replenishment_tower_particle_emitter]
summon armor_stand ~ ~1 ~ {Invisible:true,Invulnerable:true,CustomName:'{"text": "Replenishment Tower","bold": true,"color": "green"}',CustomNameVisible:true,NoGravity:true,Small:true,Tags:["replenishment_tower","engineer_tower","kill_on_end_game"]}
summon armor_stand ~ ~0.5 ~ {Invisible:true,Invulnerable:true,CustomNameVisible:false,NoGravity:true,Small:true,Tags:["replenishment_tower_particle_emitter","kill_on_end_game"]}
# Duration
scoreboard players set @n[type=armor_stand,tag=replenishment_tower] var 60
scoreboard players set @n[type=armor_stand,tag=replenishment_tower] dispel_progress 0
scoreboard players set @n[type=armor_stand,tag=replenishment_tower] total_dispelling_needed 5
scoreboard players set #engineer_count var 0
execute as @a[tag=engineer] run scoreboard players add #engineer_count var 1

scoreboard players set @s replenishment_tower_cooldown 60
scoreboard players operation @s replenishment_tower_cooldown /= #engineer_count var
clear @s lime_dye