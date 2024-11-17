execute as @s store result storage juggernaut:damage_player damage float 0.2 run scoreboard players get @s damage_taken
execute as @s run function juggernaut:deal_damage with storage juggernaut:damage_player
scoreboard players set @s damage_taken 0