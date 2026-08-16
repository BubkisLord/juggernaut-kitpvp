kill @e[type=armor_stand,tag=withering_surge]
execute at @p[tag=warlock] run summon armor_stand ~ ~1.5 ~ {NoGravity:true,Invulnerable:true,Invisible:true,CustomName:{"text": "Withering Surge","color": "dark_gray","bold": true},Marker:true,CustomNameVisible:true,Tags:["withering_surge","warlock_armor_stand"]}
execute at @p[tag=warlock] run summon armor_stand ~ ~0.5 ~ {NoGravity:true,Marker:true,Invulnerable:true,Invisible:true,Tags:["withering_surge_emitter","kill_on_end_game"]}

execute at @p[tag=warlock] run scoreboard players set @n[type=armor_stand,tag=withering_surge] total_dispelling_needed 5
bossbar add warlock:withering_surge "Withering Surge"
bossbar set warlock:withering_surge value 0
bossbar set warlock:withering_surge max 5
bossbar set warlock:withering_surge color green
bossbar set warlock:withering_surge players @a
bossbar set warlock:withering_surge style progress
bossbar set warlock:withering_surge visible true