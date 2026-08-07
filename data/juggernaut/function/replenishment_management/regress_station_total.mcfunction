# Regress a station by a percentage of a station's TOTAL capacity (not its current value).
# ONE PERCENT = TOTAL / 100
# X PERCENT = ONE PERCENT * X
scoreboard players set #regress_amount var 0
scoreboard players operation #regress_amount var = #total_replenishment_per_station var
scoreboard players operation #regress_amount var /= #100 var
$scoreboard players operation #regress_amount var *= #$(percentage) var

# Never remove more than the station currently holds, so it can't drop below empty.
execute if score #regress_amount var > @s replenish_amount run scoreboard players operation #regress_amount var = @s replenish_amount

scoreboard players operation #juggernaut_manager replenish_progress -= #regress_amount var
scoreboard players operation @s replenish_amount -= #regress_amount var
