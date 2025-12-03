execute at @a[tag=warlock] run execute as @e[type=item,nbt={Item:{id:"minecraft:black_dye"}},distance=..3] run summon armor_stand ~ ~0.5 ~ {NoGravity:true,Invulnerable:true,Invisible:true,CustomName:{"text": "Withering Surge","color": "dark_gray","bold": true},CustomNameVisible:true,Tags:["withering_surge","warlock_armor_stand"]}
execute at @a[tag=warlock] run scoreboard players set @n[type=armor_stand,tag=withering_surge] total_dispelling_needed 5
bossbar add warlock:banishment_glyph "Withering Surge"
bossbar set warlock:banishment_glyph value 0
bossbar set warlock:banishment_glyph max 5
bossbar set warlock:banishment_glyph color green
bossbar set warlock:banishment_glyph players @a
bossbar set warlock:banishment_glyph style progress
bossbar set warlock:banishment_glyph visible true