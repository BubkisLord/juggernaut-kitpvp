execute at @a[tag=warlock] run execute as @e[type=item,nbt={Item:{id:"minecraft:black_dye"}},distance=..3] run summon armor_stand ~ ~0.5 ~ {NoGravity:true,Invulnerable:true,Invisible:true,CustomName:'{"text": "Withering Surge","color": "dark_gray","bold": true}',CustomNameVisible:true,Tags:["withering_surge","warlock_armor_stand"]}
execute at @a[tag=warlock] run scoreboard players set @n[type=armor_stand,tag=withering_surge] total_dispelling_needed 5
execute at @a[tag=warlock] run scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] withering_surge_cooldown 40
execute at @a[tag=warlock] run execute as @e[type=item,nbt={Item:{id:"minecraft:black_dye"}},distance=..3] run kill @s
execute as @a[tag=warlock] run clear @s black_dye