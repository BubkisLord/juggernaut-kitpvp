# Give more replenishment when a runner has been in chase for a long time.
scoreboard players set #600 var 600
scoreboard players set #20 var 20

scoreboard players set #chase_time_multiplier var 0
execute as @a[tag=runner,scores={chase_time=600..}] run scoreboard players operation #chase_time_multiplier var += @s chase_time
execute as @a[tag=runner,scores={chase_time=600..}] run scoreboard players operation #chase_time_multiplier var -= #600 var
scoreboard players operation #chase_time_multiplier var /= #20 var

execute as @e[tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12] as @a[tag=runner,distance=..3] run scoreboard players operation @n[type=armor_stand,tag=juggernaut_manager] replenish_progress += #chase_time_multiplier var

# EXAMPLE VALUES:
# Duration of chase = 1m = 600t
# (600 - 600) = 0
# 0 / 20 = 0
# 0 / 100 = 0
# 0.0 times faster replenishment. (00% faster replenishment)

# Duration of chase = 1m 10s = 1200t + 200t
# (1400 - 1200) = 200
# 200 / 20 = 10
# 10 / 100 = 0.1
# 0.1 times faster replenishment. (10% faster replenishment)

# Duration of chase = 1m 20s = 1200t + 400t
# (1600 - 1200) = 400
# 400 / 20 = 20
# 20 / 100 = 0.2
# 0.2 times faster replenishment. (20% faster replenishment)

# Duration of chase = 1m 30s = 1200t + 600t
# (1800 - 1200) = 600
# 600 / 20 = 30
# 30 / 100 = 0.3
# 0.3 times faster replenishment. (30% faster replenishment)

# As this is a linear progression, essentially every 10 seconds the replenishment will be 10% faster.
