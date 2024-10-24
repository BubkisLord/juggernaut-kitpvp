execute at @s run effect give @a[distance=0..4,tag=!yeti] slowness 3 100 false
execute at @s run effect give @a[distance=0..4,tag=!yeti] levitation 3 128 false
execute at @s if block ~ ~-2 ~ snow_block run effect give @a[distance=0..4,tag=!yeti] instant_damage 1 0 false
execute at @s run particle minecraft:cloud ~ ~-0.3 ~ 3 0 3 0 150 normal
execute at @s run playsound minecraft:block.sand.break master @a ~ ~ ~ 1.2 0
execute at @s run playsound minecraft:block.lava.extinguish master @a ~ ~ ~ 1.2 0
kill @s