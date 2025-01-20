scoreboard players operation #juggernaut_manager temp_progress = #juggernaut_manager replenish_progress
scoreboard players operation #juggernaut_manager temp_progress *= #100 var

execute store result score #juggernaut_manager replenish_decimal run scoreboard players operation #juggernaut_manager temp_progress /= #juggernaut_manager total_replenishment_needed

execute if score #game_state var matches 11 as @e[type=armor_stand,tag=replenishment.station] run scoreboard players operation @s temp_progress = @s replenish_amount
execute if score #game_state var matches 11 as @e[type=armor_stand,tag=replenishment.station] run scoreboard players operation @s temp_progress *= #100 var

execute if score #game_state var matches 11 as @e[type=armor_stand,tag=replenishment.station] run execute store result score @s replenish_decimal run scoreboard players operation @s temp_progress /= #total_replenishment_per_station var

execute if score #juggernaut_customisation completable_stations matches 0 run function juggernaut:replenishment_management/display_actionbar_percentage
execute if score #juggernaut_customisation completable_stations matches 1 run function juggernaut:replenishment_management/display_actionbar_stations