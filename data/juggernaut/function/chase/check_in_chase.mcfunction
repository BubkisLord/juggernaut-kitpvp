execute as @a[tag=in_chase] run tag @s remove in_chase

execute as @a[tag=juggernaut,scores={is_sneaking=0}] at @s anchored eyes positioned ^ ^ ^2 if entity @a[tag=runner,distance=..3,scores={is_sneaking=1}] run tag @s add in_chase
execute as @a[tag=juggernaut,scores={is_sneaking=0}] at @s anchored eyes positioned ^ ^ ^2 as @a[tag=runner,distance=..3,scores={is_sneaking=1}] run tag @s add in_chase

execute as @a[tag=juggernaut,scores={is_sprinting=0}] at @s anchored eyes positioned ^ ^ ^3 if entity @a[tag=runner,distance=..5,scores={is_sneaking=0}] run tag @s add in_chase
execute as @a[tag=juggernaut,scores={is_sprinting=0}] at @s anchored eyes positioned ^ ^ ^3 as @a[tag=runner,distance=..5,scores={is_sneaking=0}] run tag @s add in_chase

execute as @a[tag=juggernaut,scores={is_sprinting=1}] at @s anchored eyes positioned ^ ^ ^4 if entity @a[tag=runner,distance=..10,scores={is_sneaking=0}] run tag @s add in_chase
execute as @a[tag=juggernaut,scores={is_sprinting=1}] at @s anchored eyes positioned ^ ^ ^4 as @a[tag=runner,distance=..10,scores={is_sneaking=0}] run tag @s add in_chase

execute as @a[tag=juggernaut,scores={is_sprinting=1}] at @s anchored eyes positioned ^ ^ ^4 if entity @a[tag=runner,distance=..20,scores={is_sprinting=1}] run tag @s add in_chase
execute as @a[tag=juggernaut,scores={is_sprinting=1}] at @s anchored eyes positioned ^ ^ ^4 as @a[tag=runner,distance=..20,scores={is_sprinting=1}] run tag @s add in_chase

execute as @a[tag=in_chase] at @s run particle soul_fire_flame ~ ~0.2 ~ 0.2 0.07 0.2 0 3 force

execute as @a[tag=runner,tag=in_chase] run scoreboard players add @n[type=armor_stand,tag=juggernaut_manager] replenish_progress 2
execute as @a[tag=runner,tag=in_chase] run scoreboard players add @e[type=armor_stand,tag=replenishment.station,limit=1,sort=random] replenish_amount 2