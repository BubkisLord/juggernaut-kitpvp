execute at @s run effect give @p[tag=tutorial.player] jump_boost 2 3 false
execute at @s run particle minecraft:happy_villager ~ ~ ~ 0.5 1 0.5 1 50 force
execute at @s run playsound minecraft:block.end_portal_frame.fill master @a ~ ~ ~ 1 0
kill @s