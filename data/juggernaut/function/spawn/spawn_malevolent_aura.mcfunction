execute at @a[tag=warlock] run execute as @e[type=item,nbt={Item:{id:"minecraft:red_dye"}},distance=..3] run summon armor_stand ~ ~0.5 ~ {NoGravity:true,Invulnerable:true,Invisible:true,CustomName:'{"text": "Malevolent Aura","color": "dark_red","bold": true}',CustomNameVisible:true,Tags:["malevolent_aura","warlock_armor_stand"]}
execute at @a[tag=warlock] run scoreboard players set @n[type=armor_stand,tag=malevolent_aura] total_dispelling_needed 30
execute at @a[tag=warlock] run scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] malevolent_aura_cooldown 20
execute at @a[tag=warlock] run execute as @e[type=item,nbt={Item:{id:"minecraft:red_dye"}},distance=..3] run kill @s
execute as @a[tag=warlock] run clear @s red_dye