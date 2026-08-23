kill @e[type=armor_stand,tag=warlock_revealing_tower]
summon armor_stand ~ ~1 ~ {Invisible:true,Invulnerable:true,CustomName:{"text": "Revealing Tower","bold": true,"color": "gold"},Marker:false,CustomNameVisible:false,Small:true,NoGravity:false,Tags:["warlock_revealing_tower","warlock_armor_stand","kill_on_end_game"]}
summon armor_stand ~ ~0.5 ~ {NoGravity:true,Marker:true,Invulnerable:true,Invisible:true,Tags:["warlock_revealing_tower_emitter","kill_on_end_game"]}
# Duration
scoreboard players set @n[type=armor_stand,tag=warlock_revealing_tower] var 60
scoreboard players set @n[type=armor_stand,tag=warlock_revealing_tower] dispel_progress 0
scoreboard players set @n[type=armor_stand,tag=warlock_revealing_tower] total_dispelling_needed 200
bossbar add warlock:revealing_tower "Revealing Tower"
bossbar set warlock:revealing_tower value 0
bossbar set warlock:revealing_tower max 200
bossbar set warlock:revealing_tower color yellow
bossbar set warlock:revealing_tower players @a
bossbar set warlock:revealing_tower style notched_12
bossbar set warlock:revealing_tower visible true