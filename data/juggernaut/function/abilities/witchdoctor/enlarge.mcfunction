execute as @a[tag=runner,distance=..8] run tag @s add enlarged
execute as @a[tag=enlarged] run attribute @s scale base set 1.6
execute as @a[tag=enlarged] run attribute @s step_height base set 1.6
execute as @a[tag=enlarged] run attribute @s movement_speed base set 0.07
execute as @a[tag=enlarged] run attribute @s jump_strength base set 0.55
execute as @a[tag=enlarged] run attribute @s safe_fall_distance base set 4
schedule function reset_enlargement 10s append