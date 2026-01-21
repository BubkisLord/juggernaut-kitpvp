# ONE PERCENT = TOTAL / 100
# X PERCENT = ONE PERCENT * X
scoreboard players set #added_amount var 0
execute if score #juggernaut_customisation completable_stations matches 0 run scoreboard players operation #added_amount var = #juggernaut_manager total_replenishment_needed
execute if score #juggernaut_customisation completable_stations matches 1 run scoreboard players operation #added_amount var = #total_replenishment_per_station var
scoreboard players operation #added_amount var /= #100 var
$scoreboard players operation #added_amount var *= #$(percentage) var

scoreboard players operation #juggernaut_manager replenish_progress += #added_amount var
execute if score #juggernaut_customisation completable_stations matches 1 run scoreboard players operation @n[type=armor_stand,tag=replenishment.station] replenish_amount += #added_amount var