kill @e[tag=turret]
summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,NoGravity:true,Tags:["turret","engineer_tower","kill_on_end_game"],Small:true}
summon skeleton ~ ~ ~ {Team:"runner",HandItems:[{"id":"bow",components:{enchantments:{power:8,flame:2}}},{}],HandDropChances:[0,0],ActiveEffects:[{Id:12,Duration:9999999,Amplifier:0,ShowParticles:false}],DeathLootTable:"empty",Attributes:[{id:"max_health",base:30}],Tags:["kill_on_end_game","skeleton_turret"],Invulnerable:true}
scoreboard players set @n[type=armor_stand,tag=turret] var 60
scoreboard players set @n[type=armor_stand,tag=turret] dispel_progress 0
scoreboard players set @n[type=armor_stand,tag=turret] total_dispelling_needed 5
clear @s bone