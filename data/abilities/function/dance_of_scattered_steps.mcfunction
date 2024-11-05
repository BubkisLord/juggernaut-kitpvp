kill @e[type=item,nbt={Item:{id:"minecraft:gunpowder"}},distance=..3]
execute as @r[distance=2..,sort=random,limit=1] at @s run execute if block ~ ~ ~ air run tp @p ^ ^ ^-2
execute unless block ~ ~ ~ air unless block ~ ~ ~ short_grass unless block ~ ~ ~ tall_grass unless block ~ ~ ~ water run tp @s ~ ~1 ~
execute unless block ~ ~ ~ air unless block ~ ~ ~ short_grass unless block ~ ~ ~ tall_grass unless block ~ ~ ~ water run tp @s ~ ~1 ~
execute unless block ~ ~ ~ air unless block ~ ~ ~ short_grass unless block ~ ~ ~ tall_grass unless block ~ ~ ~ water run tp @s ~ ~1 ~
execute unless block ~ ~ ~ air unless block ~ ~ ~ short_grass unless block ~ ~ ~ tall_grass unless block ~ ~ ~ water run tp @s ~ ~1 ~
execute unless block ~ ~ ~ air unless block ~ ~ ~ short_grass unless block ~ ~ ~ tall_grass unless block ~ ~ ~ water run tp @s ~ ~1 ~

# Disappear in an all-engulfing smoke
particle campfire_cosy_smoke ~ ~0.5 ~ 0.3 0.5 0.3 0.000001 300 force
particle campfire_cosy_smoke ~ ~0.5 ~ 1 0.75 1 0.00001 300 force

# 6 Seconds of scattered steps
scoreboard players set @s scattered_steps_duration 200
playsound minecraft:block.conduit.activate master @a[distance=..5] ~ ~ ~ 3 0.2 1
playsound ambient.underwater.loop.additions.ultra_rare master @s ~ ~ ~ 3 2 1