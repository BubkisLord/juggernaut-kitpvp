scoreboard players operation #station_overflow var = @s replenish_amount
scoreboard players operation #station_overflow var -= #total_replenishment_per_station var
execute if score #station_overflow var matches 1.. run scoreboard players operation @s replenish_amount -= #station_overflow var
execute if score #station_overflow var matches 1.. run scoreboard players operation #juggernaut_manager replenish_progress -= #station_overflow var