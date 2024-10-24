execute at @s run particle minecraft:end_rod ~ 150 ~ 0.01 150 0.01 0 1000 force @a
execute at @s run particle minecraft:explosion ~ ~ ~ 1 1 1 1 15 force @a
execute at @s run playsound minecraft:entity.phantom.flap master @a ~ ~ ~ 3 2
execute at @s run playsound minecraft:entity.arrow.shoot master @a ~ ~ ~ 3 0
execute at @s run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 0.5 2
effect give @s levitation 10 255 false
execute at @s run tp @s ~ 150 ~
execute at @s run particle minecraft:explosion ~ ~ ~ 1 1 1 1 15 force @a
execute at @s run playsound minecraft:entity.phantom.flap master @a ~ ~ ~ 3 2
execute at @s run playsound minecraft:entity.arrow.shoot master @a ~ ~ ~ 3 0
execute at @s run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 0.5 2
execute at @s run kill @n[type=item,nbt={Item:{id:"minecraft:feather"}},distance=..3]