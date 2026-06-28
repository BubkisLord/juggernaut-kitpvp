execute as @a[tag=runner,distance=..8] run tag @s add enlarged
execute as @a[tag=enlarged] run attribute @s scale modifier add juggernaut:enlarged 0.6 add_value
execute as @a[tag=enlarged] run attribute @s step_height modifier add juggernaut:enlarged 0.6 add_value
execute as @a[tag=enlarged] run attribute @s movement_speed modifier add juggernaut:enlarged -0.3 add_multiplied_base
execute as @a[tag=enlarged] run attribute @s jump_strength modifier add juggernaut:enlarged 0.12 add_value
execute as @a[tag=enlarged] run attribute @s safe_fall_distance modifier add juggernaut:enlarged 1 add_value
schedule function reset_enlargement 10s append