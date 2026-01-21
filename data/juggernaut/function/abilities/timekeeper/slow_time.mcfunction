# 2x slower tick rate
tick rate 10

# Remove movement speed modifiers from fast-forward.
attribute @s movement_speed modifier remove juggernaut:abilities/timekeeper/tick_speed

# 10x faster movement speed
attribute @s movement_speed modifier add juggernaut:abilities/timekeeper/tick_speed 1.01 add_multiplied_base

# 60s goes to 30s seconds as 2 ticks is now 1 second.
schedule function juggernaut:abilities/timekeeper/reset_timescale 30s append