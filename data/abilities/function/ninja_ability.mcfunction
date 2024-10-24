execute at @s run effect give @a[distance=0..2,tag=ninja] speed 4 5 false
execute at @s run effect give @a[distance=0..2,tag=ninja] jump_boost 4 3 false
execute at @s run particle campfire_signal_smoke ~ ~-0.3 ~ 1 1 1 0.01 500 normal
execute at @s run playsound minecraft:block.metal.break master @a ~ ~ ~ 1.2 0
execute at @s run playsound minecraft:entity.armor_stand.hit master @a ~ ~ ~ 1.2 0
execute at @s run playsound minecraft:entity.firework_rocket.blast master @a ~ ~ ~ 1.2 0
execute at @s run playsound minecraft:block.scaffolding.break master @a ~ ~ ~ 1 0
kill @s