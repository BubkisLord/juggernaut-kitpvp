execute if score @s replenish_amount > #highest_station var run tag @e[type=armor_stand] remove highest_station
execute if score @s replenish_amount > #highest_station var run tag @s add highest_station
execute if score @s replenish_amount > #highest_station var run scoreboard players operation #highest_station var = @s replenish_amount