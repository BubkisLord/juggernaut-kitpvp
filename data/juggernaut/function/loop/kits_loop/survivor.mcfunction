# Survivor effects
execute as @a[tag=survivor] run effect give @s resistance 1 0 true
execute as @a[tag=survivor] run attribute @s max_health base set 40


execute as @a[tag=survivor] at @s as @e[type=snowball,distance=..3] run tag @s add ice_bomb
execute as @e[type=snowball,tag=ice_bomb] at @s run particle electric_spark ~ ~ ~ 1 1 1 0.00001 60 force
execute as @e[type=snowball,tag=ice_bomb] at @s run effect give @a[tag=juggernaut,distance=..2] slowness 8 255 true