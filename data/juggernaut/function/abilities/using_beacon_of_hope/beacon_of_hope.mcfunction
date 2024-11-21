tag @s remove using_beacon_of_hope

# Add a death
scoreboard players add @s game_deaths 1

# Recalculate lives
scoreboard players set @s lives_remaining 0
scoreboard players operation @s lives_remaining = @s lives
scoreboard players operation @s lives_remaining -= @s game_deaths

# If should be dead, die
execute if entity @s[scores={lives_remaining=..0}] run kill @s

# For all alive players add beacon of hope effect.
tag @a[tag=runner,scores={lives_remaining=1..}] add beacon_of_hope_active
scoreboard players set @s beacon_of_hope_duration 10