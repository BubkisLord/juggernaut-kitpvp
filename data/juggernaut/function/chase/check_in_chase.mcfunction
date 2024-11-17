execute as @a[tag=in_chase] at @s run particle soul_fire_flame ~ ~0.3 ~ 0.2 0.1 0.2 0 3 force

execute as @a[tag=juggernaut,tag=in_chase] at @s positioned ^ ^ ^7 if entity @a[tag=runner,tag=in_chase,distance=..4] run tag @s add continue_chase
execute as @a[tag=juggernaut,tag=in_chase] at @s positioned ^ ^ ^7 as @a[tag=runner,tag=in_chase,distance=..4] run tag @s add continue_chase
execute as @a[tag=juggernaut,tag=in_chase] at @s if entity @a[tag=runner,tag=in_chase,distance=..5] run tag @s add continue_chase
execute as @a[tag=juggernaut,tag=in_chase] at @s as @a[tag=runner,tag=in_chase,distance=..5] run tag @s add continue_chase

execute as @a[tag=juggernaut,tag=in_chase,tag=!continue_chase] run tag @s remove in_chase
execute as @a[tag=runner,tag=in_chase,tag=!continue_chase] run tag @s remove in_chase
execute as @a[tag=juggernaut,tag=continue_chase] run tag @s remove continue_chase
execute as @a[tag=runner,tag=continue_chase] run tag @s remove continue_chase

execute as @a[tag=juggernaut,tag=!in_chase] at @s positioned ^ ^ ^7 as @a[tag=runner,distance=..4,scores={is_sprinting=1}] run tag @s add in_chase
execute as @a[tag=juggernaut,tag=!in_chase] at @s positioned ^ ^ ^7 if entity @a[tag=runner,distance=..4,scores={is_sprinting=1}] run tag @s add in_chase
execute as @a[tag=juggernaut,tag=!in_chase] at @s as @a[tag=runner,distance=..5,scores={is_sprinting=1}] run tag @s add in_chase
execute as @a[tag=juggernaut,tag=!in_chase] at @s if entity @a[tag=runner,distance=..5,scores={is_sprinting=1}] run tag @s add in_chase

execute as @a[tag=runner,tag=in_chase] run scoreboard players add @s chase_time 1
execute as @a[tag=runner,tag=!in_chase] run scoreboard players set @s chase_time 0