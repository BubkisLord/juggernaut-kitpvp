scoreboard players add @s points 100
execute if entity @s[tag=medic] run scoreboard players operation @s ability_cooldown0 /= #2 var
execute if entity @s[tag=medic] run scoreboard players operation @s ability_cooldown1 /= #2 var