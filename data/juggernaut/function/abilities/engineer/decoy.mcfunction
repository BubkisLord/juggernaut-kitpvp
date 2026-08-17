kill @e[type=armor_stand,tag=decoy_tower]
summon armor_stand ~ ~0.5 ~ {Invisible:true,Invulnerable:true,NoGravity:true,Small:true,Tags:["decoy_tower","engineer_tower","kill_on_end_game"]}
scoreboard players set @n[type=armor_stand,tag=decoy_tower] var 60
scoreboard players set @n[type=armor_stand,tag=decoy_tower] dispel_progress 0
scoreboard players set @n[type=armor_stand,tag=decoy_tower] total_dispelling_needed 5