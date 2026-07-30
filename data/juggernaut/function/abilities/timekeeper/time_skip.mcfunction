scoreboard players set @s ts_step 0
summon marker ~ ~ ~ {Tags:["time_skip_marker","kill_on_end_game"]}
tp @n[type=marker,tag=time_skip_marker] ~ ~ ~ facing ^ ^ ^9999
data modify entity @n[type=marker,tag=time_skip_marker] Rotation[1] set value 0
execute as @n[type=marker,tag=time_skip_marker] at @s run function juggernaut:abilities/timekeeper/time_skip_step
tp @s @n[type=marker,tag=time_skip_marker]
kill @n[type=marker,tag=time_skip_marker]
playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 1.2