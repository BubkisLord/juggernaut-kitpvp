execute as @n[type=armor_stand,tag=camera] at @s run particle explosion_emitter ~ ~ ~ 0.3 0.3 0.3 0 1 force @a[tag=eclipse_stalker]
execute as @n[type=armor_stand,tag=camera] at @s run playsound minecraft:entity.generic.explode master @a[tag=eclipse_stalker] ~ ~ ~ 1 1
execute as @n[type=armor_stand,tag=camera] at @s run kill @s