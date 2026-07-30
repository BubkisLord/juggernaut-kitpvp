execute at @s rotated ~ 0 positioned ^ ^ ^1 unless block ~ ~ ~ #juggernaut:raycast_permeable run return 0
execute at @s rotated ~ 0 positioned ^ ^ ^1 unless block ~ ~1 ~ #juggernaut:raycast_permeable run return 0

execute as @s at @s run tp @n[type=marker,tag=time_skip_marker] ^ ^ ^1
execute at @s run particle gust_emitter_small ~ ~ ~ 1 1 1 0 30

scoreboard players add @s ts_step 1
execute if score @s ts_step matches ..15 run function juggernaut:abilities/timekeeper/time_skip_step