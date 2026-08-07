execute at @s as @a[distance=..8,tag=runner] run effect give @s regeneration 1 255 true
execute if entity @a[distance=..8,tag=runner] run scoreboard players operation @s ability_cooldown0 /= #2 var
execute if entity @a[distance=..8,tag=runner] run scoreboard players operation @s ability_cooldown1 /= #2 var
execute if entity @a[distance=..8,tag=runner] run scoreboard players operation @s ability_cooldown2 /= #2 var
execute if entity @a[distance=..8,tag=runner] run scoreboard players operation @s ability_cooldown3 /= #2 var
execute if entity @a[distance=..8,tag=runner] run scoreboard players operation @s ability_cooldown4 /= #2 var
execute if entity @a[distance=..8,tag=runner] run scoreboard players operation @s ability_cooldown5 /= #2 var