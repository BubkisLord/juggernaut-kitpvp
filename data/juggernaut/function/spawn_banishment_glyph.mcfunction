execute at @a[tag=warlock] run execute as @e[type=item,nbt={Item:{id:"minecraft:cyan_dye"}},distance=..3] run summon armor_stand ~ ~0.5 ~ {NoGravity:true,Invulnerable:true,Invisible:true,CustomName:'{"text": "Banishment Glyph","color": "blue","bold": true}',CustomNameVisible:true,Tags:["banishment_glyph","warlock_armor_stand"]}
execute at @a[tag=warlock] run scoreboard players set @n[type=armor_stand,tag=banishment_glyph] total_dispelling_needed 40
execute at @a[tag=warlock] run scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] banishment_glyph_cooldown 30
execute at @a[tag=warlock] run execute as @e[type=item,nbt={Item:{id:"minecraft:cyan_dye"}},distance=..3] run kill @s
execute as @a[tag=warlock] run clear @s cyan_dye