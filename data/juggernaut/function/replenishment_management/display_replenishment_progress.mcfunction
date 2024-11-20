scoreboard players operation @n[type=armor_stand,tag=juggernaut_manager] temp_progress = @n[type=armor_stand,tag=juggernaut_manager] replenish_progress
scoreboard players operation @n[type=armor_stand,tag=juggernaut_manager] temp_progress *= #100 var

scoreboard players operation @n[type=armor_stand,tag=juggernaut_manager] temp_max_progress = @n[type=armor_stand,tag=juggernaut_manager] total_replenishment_needed
scoreboard players operation @n[type=armor_stand,tag=juggernaut_manager] temp_max_progress *= #100 var

execute store result score @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal run scoreboard players operation @n[type=armor_stand,tag=juggernaut_manager] temp_progress /= @n[type=armor_stand,tag=juggernaut_manager] total_replenishment_needed

execute if score #juggernaut_customisation completable_stations matches 0 run function juggernaut:replenishment_management/display_actionbar_percentage
execute if score #juggernaut_customisation completable_stations matches 1 run function juggernaut:replenishment_management/display_actionbar_stations