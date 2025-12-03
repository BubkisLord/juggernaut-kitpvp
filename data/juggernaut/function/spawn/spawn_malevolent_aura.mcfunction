execute at @a[tag=warlock] run execute as @e[type=item,nbt={Item:{id:"minecraft:red_dye"}},distance=..3] run summon armor_stand ~ ~0.5 ~ {NoGravity:true,Invulnerable:true,Invisible:true,CustomName:{"text": "Malevolent Aura","color": "dark_red","bold": true},CustomNameVisible:true,Tags:["malevolent_aura","warlock_armor_stand"]}
execute at @a[tag=warlock] run scoreboard players set @n[type=armor_stand,tag=malevolent_aura] total_dispelling_needed 30
bossbar add warlock:malevolent_aura "Malevolent Aura"
bossbar set warlock:malevolent_aura value 0
bossbar set warlock:malevolent_aura max 30
bossbar set warlock:malevolent_aura color red
bossbar set warlock:malevolent_aura players @a
bossbar set warlock:malevolent_aura style notched_10
bossbar set warlock:malevolent_aura visible true