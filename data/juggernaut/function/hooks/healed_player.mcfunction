scoreboard players add @s points 100
execute if entity @s[tag=medic] run scoreboard players operation @s jug_kit_cooldown /= #2 var
execute if entity @s[tag=medic] run scoreboard players operation @s jug_kit_cooldown_2 /= #2 var