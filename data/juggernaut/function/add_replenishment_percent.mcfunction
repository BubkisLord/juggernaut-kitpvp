# TOTAL = ( 3000 * (PLAYERS + 1) ) / JUGGERNAUTS
# ONE PERCENT = TOTAL / 100
# X PERCENT = ONE PERCENT * X
scoreboard players set #added_amount var 0
scoreboard players operation #added_amount var = #beginning_time var
scoreboard players operation #added_amount var *= #playercount var
scoreboard players operation #added_amount var += #beginning_time var
scoreboard players operation #added_amount var /= #juggernaut_multiplier var
scoreboard players operation #added_amount var /= #100 var
$scoreboard players operation #added_amount var *= $(percentage)

scoreboard players operation @n[type=armor_stand,tag=juggernaut_manager] replenish_progress += #added_amount var
scoreboard players operation @n[type=armor_stand,tag=replenishment.station] replenish_amount += #added_amount var