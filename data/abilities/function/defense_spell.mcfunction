execute at @s run effect give @p[tag=defender] resistance 4 2 false
execute at @s run particle minecraft:totem_of_undying ~ ~-0.3 ~ 0.5 1 0.5 0.1 200 normal
execute at @s run playsound minecraft:block.beacon.activate master @a ~ ~ ~ 1.2 0
kill @s