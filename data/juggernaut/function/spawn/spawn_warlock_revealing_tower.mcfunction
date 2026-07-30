execute at @a[tag=warlock] run summon armor_stand ~ ~0.5 ~ {NoGravity:true,Invulnerable:true,Invisible:true,CustomName:{"text": "Revealing Tower","color": "dark_red","bold": true},CustomNameVisible:false,Tags:["warlock_revealing_tower","warlock_armor_stand","kill_on_end_game"]}
execute at @a[tag=warlock] run scoreboard players set @n[type=armor_stand,tag=warlock_revealing_tower] total_dispelling_needed 60
bossbar add warlock:revealing_tower "Revealing Tower"
bossbar set warlock:revealing_tower value 0
bossbar set warlock:revealing_tower max 60
bossbar set warlock:revealing_tower color yellow
bossbar set warlock:revealing_tower players @a
bossbar set warlock:revealing_tower style notched_20
bossbar set warlock:revealing_tower visible true