scoreboard players set #runner_death_count var 0
execute as @a[tag=runner] run scoreboard players operation #runner_death_count var += @s game_deaths
scoreboard players operation @s domination_movement_speed = #runner_death_count var
scoreboard players operation @s domination_movement_speed *= #2 var
execute store result storage juggernaut:attribute_management/apply_domination value double 0.01 run scoreboard players get @s domination_movement_speed
function juggernaut:attribute_management/apply_domination with storage juggernaut:attribute_management/apply_domination