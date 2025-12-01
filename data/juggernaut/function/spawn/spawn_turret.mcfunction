kill @e[tag=turret]
summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,NoGravity:true,Tags:["turret","engineer_tower","kill_on_end_game"],Small:true}
summon skeleton ~ ~ ~ {Team:"runner",active_effects:[{id:"resistance",duration:9999999,amplifier:0,show_particles:false}],DeathLootTable:"",attributes:[{id:"max_health",base:30}],Tags:["kill_on_end_game","skeleton_turret"],Invulnerable:true}
scoreboard players set @n[type=armor_stand,tag=turret] var 60
scoreboard players set @n[type=armor_stand,tag=turret] dispel_progress 0
scoreboard players set @n[type=armor_stand,tag=turret] total_dispelling_needed 5
clear @s bone