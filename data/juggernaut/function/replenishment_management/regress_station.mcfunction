# TOTAL = CURRENT_REPLENISH_AMOUNT
# ONE PERCENT = TOTAL / 100
# X PERCENT = ONE PERCENT * X
scoreboard players set #regress_amount var 0
execute if score #game_state var matches 11 run scoreboard players operation #regress_amount var = @n[type=armor_stand,tag=replenishment.station] replenish_amount
execute if score #game_state var matches 10 run scoreboard players operation #regress_amount var = #juggernaut_manager replenish_progress
scoreboard players operation #regress_amount var /= #100 var
$scoreboard players operation #regress_amount var *= #$(percentage) var

scoreboard players operation #juggernaut_manager replenish_progress -= #regress_amount var
execute if score #game_state var matches 11 run scoreboard players operation @s replenish_amount -= #regress_amount var