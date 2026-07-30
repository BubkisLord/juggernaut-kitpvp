kill @e[tag=temporal_marker]
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["temporal_marker","kill_on_end_game"]}
playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1 1.5
particle minecraft:end_rod ~ ~1 ~ 0.3 0.5 0.3 0.01 30