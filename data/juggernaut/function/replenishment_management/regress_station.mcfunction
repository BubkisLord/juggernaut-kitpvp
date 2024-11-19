# TOTAL = CURRENT_REPLENISH_AMOUNT
# ONE PERCENT = TOTAL / 100
# X PERCENT = ONE PERCENT * X
scoreboard players set #regress_amount var 0
scoreboard players operation #regress_amount var = @s replenish_amount
scoreboard players operation #regress_amount var /= #100 var
$scoreboard players operation @s replenish_amount *= $(percentage)

scoreboard players operation @n[type=armor_stand,tag=juggernaut_manager] replenish_progress -= #regress_amount var
scoreboard players operation @s replenish_amount -= #regress_amount var