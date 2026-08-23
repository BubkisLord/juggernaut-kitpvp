kill @e[type=armor_stand,tag=banishment_glyph]
execute at @p[tag=warlock] run summon armor_stand ~ ~1 ~ {NoGravity:false,Invulnerable:true,Invisible:true,CustomName:{"text": "Banishment Glyph","color": "blue","bold": true},Marker:false,CustomNameVisible:true,Tags:["banishment_glyph","warlock_armor_stand"]}
execute at @p[tag=warlock] run summon armor_stand ~ ~0.5 ~ {NoGravity:true,Marker:true,Invulnerable:true,Invisible:true,Tags:["banishment_glyph_emitter","kill_on_end_game"]}
execute at @p[tag=warlock] run scoreboard players set @n[type=armor_stand,tag=banishment_glyph] total_dispelling_needed 40
bossbar add warlock:banishment_glyph "Banishment Glyph"
bossbar set warlock:banishment_glyph value 0
bossbar set warlock:banishment_glyph max 40
bossbar set warlock:banishment_glyph color blue
bossbar set warlock:banishment_glyph players @a
bossbar set warlock:banishment_glyph style notched_10
bossbar set warlock:banishment_glyph visible true