# Eclipse Stalker
execute as @e[type=armor_stand,tag=camera] at @s run particle white_smoke ~ ~ ~ 0.25 0.25 0.25 0 10 force @a

execute as @a[tag=using_camera] at @s as @n[type=armor_stand,tag=used_camera] at @s run tp @p[tag=using_camera] ~ ~ ~
execute as @a[tag=shadow_marked] at @s run particle flame ~ ~0.5 ~ 1.5 1.5 1.5 0 1 force @a[tag=juggernaut]