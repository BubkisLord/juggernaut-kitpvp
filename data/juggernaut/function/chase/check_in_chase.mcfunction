execute as @a[tag=juggernaut,tag=in_chase,scores={chase_timeout=..0}] run function juggernaut:hooks/jug_left_chase
execute as @a[tag=runner,tag=in_chase,scores={chase_timeout=..0}] run function juggernaut:hooks/runner_left_chase
execute as @a[tag=in_chase,scores={chase_timeout=..0}] run tag @s remove in_chase

execute as @a[tag=juggernaut,scores={is_sneaking=0},tag=!shapeshifting] at @s positioned ^ ^ ^3 if entity @a[tag=runner,distance=..10,scores={is_sneaking=1}] run tag @s add continue_chase
execute as @a[tag=juggernaut,scores={is_sneaking=0},tag=!shapeshifting] at @s positioned ^ ^ ^3 as @a[tag=runner,distance=..10,scores={is_sneaking=1}] run tag @s add continue_chase

execute as @a[tag=juggernaut,scores={is_sneaking=0},tag=!shapeshifting] at @s positioned ^ ^ ^4 if entity @a[tag=runner,distance=..20,scores={is_sneaking=0}] run tag @s add continue_chase
execute as @a[tag=juggernaut,scores={is_sneaking=0},tag=!shapeshifting] at @s positioned ^ ^ ^4 as @a[tag=runner,distance=..20,scores={is_sneaking=0}] run tag @s add continue_chase

execute as @a[tag=juggernaut,scores={is_sneaking=0},tag=!shapeshifting] at @s positioned ^ ^ ^5 if entity @a[tag=runner,distance=..30,scores={is_sprinting=1}] run tag @s add continue_chase
execute as @a[tag=juggernaut,scores={is_sneaking=0},tag=!shapeshifting] at @s positioned ^ ^ ^5 as @a[tag=runner,distance=..30,scores={is_sprinting=1}] run tag @s add continue_chase

execute as @a[tag=continue_chase,tag=!using_unyielding_wrath] run scoreboard players set @s chase_timeout 60
execute as @a[tag=continue_chase,tag=using_unyielding_wrath] run scoreboard players set @s chase_timeout 120
execute as @a[tag=continue_chase] run tag @s remove continue_chase

execute as @a[tag=juggernaut,tag=!in_chase] if score @s chase_timeout matches 1.. run function juggernaut:hooks/jug_entered_chase
execute as @a[tag=juggernaut] if score @s chase_timeout matches 1.. run tag @s add in_chase
execute as @a[tag=juggernaut] if score @s chase_timeout matches 1.. run scoreboard players remove @s chase_timeout 1

execute as @a[tag=runner,tag=!in_chase] if score @s chase_timeout matches 1.. run function juggernaut:hooks/runner_entered_chase
execute as @a[tag=runner] if score @s chase_timeout matches 1.. run tag @s add in_chase
execute as @a[tag=runner] if score @s chase_timeout matches 1.. run scoreboard players remove @s chase_timeout 1

execute if score #juggernaut_customisation debug_mode matches 1 as @a[tag=in_chase] at @s run particle soul_fire_flame ~ ~0.2 ~ 0.2 0.07 0.2 0 3 force @s

execute as @a[tag=runner,tag=in_chase] run scoreboard players add #juggernaut_manager replenish_progress 1

execute if score #juggernaut_customisation completable_stations matches 1 as @a[tag=runner,tag=in_chase] at @s as @n[type=armor_stand,tag=replenishment.station,tag=highest_station] run scoreboard players add @s replenish_amount 1