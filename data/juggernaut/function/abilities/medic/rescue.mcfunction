execute if entity @a[tag=juggernaut,distance=..20] run scoreboard players set @s jug_kit_cooldown 4
execute if entity @a[tag=juggernaut,distance=..20] run particle angry_villager ~ ~0.5 ~ 1 1 1 0 80 force
execute if entity @s[tag=in_chase] run scoreboard players set @s jug_kit_cooldown 4
execute if entity @s[tag=in_chase] run particle angry_villager ~ ~0.5 ~ 1 1 1 0 80 force

execute unless entity @a[tag=juggernaut,distance=..20] unless entity @s[tag=in_chase] run tag @s add teleporting
execute as @a[tag=medic,tag=teleporting] if entity @a[tag=runner,tag=!teleporting] run tp @s @r[tag=runner,tag=!teleporting]
execute as @a[tag=medic,tag=teleporting] at @s unless entity @a[tag=runner,tag=!teleporting] run tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random,distance=40..]

execute as @a[tag=medic,tag=teleporting] run tag @s remove teleporting