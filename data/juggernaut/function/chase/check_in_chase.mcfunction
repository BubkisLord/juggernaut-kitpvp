execute as @a[tag=juggernaut,tag=in_chase,scores={chase_timeout=..0}] run function juggernaut:hooks/jug_left_chase
execute as @a[tag=runner,tag=in_chase,scores={chase_timeout=..0}] run function juggernaut:hooks/runner_left_chase
execute as @a[tag=in_chase] run tag @s remove in_chase

execute as @a[tag=juggernaut,scores={is_sneaking=0}] at @s if entity @a[tag=runner,distance=..5,scores={is_sneaking=1}] run scoreboard players set @s chase_timeout 60
execute as @a[tag=juggernaut,scores={is_sneaking=0}] at @s as @a[tag=runner,distance=..5,scores={is_sneaking=1}] run scoreboard players set @s chase_timeout 60

execute as @a[tag=juggernaut,scores={is_sprinting=0}] at @s if entity @a[tag=runner,distance=..8,scores={is_sneaking=0}] run scoreboard players set @s chase_timeout 60
execute as @a[tag=juggernaut,scores={is_sprinting=0}] at @s as @a[tag=runner,distance=..8,scores={is_sneaking=0}] run scoreboard players set @s chase_timeout 60

execute as @a[tag=juggernaut,scores={is_sprinting=1}] at @s if entity @a[tag=runner,distance=..12,scores={is_sneaking=0}] run scoreboard players set @s chase_timeout 60
execute as @a[tag=juggernaut,scores={is_sprinting=1}] at @s as @a[tag=runner,distance=..12,scores={is_sneaking=0}] run scoreboard players set @s chase_timeout 60

execute as @a[tag=juggernaut,scores={is_sprinting=1}] at @s if entity @a[tag=runner,distance=..26,scores={is_sprinting=1}] run scoreboard players set @s chase_timeout 60
execute as @a[tag=juggernaut,scores={is_sprinting=1}] at @s as @a[tag=runner,distance=..26,scores={is_sprinting=1}] run scoreboard players set @s chase_timeout 60

execute as @a[tag=juggernaut,tag=!in_chase] if score @s chase_timeout matches 1.. run function juggernaut:hooks/jug_entered_chase
execute as @a[tag=juggernaut] if score @s chase_timeout matches 1.. run tag @s add in_chase
execute as @a[tag=juggernaut] if score @s chase_timeout matches 1.. run scoreboard players remove @s chase_timeout 1
execute as @a[tag=runner,tag=!in_chase] if score @s chase_timeout matches 1.. run function juggernaut:hooks/runner_entered_chase
execute as @a[tag=runner] if score @s chase_timeout matches 1.. run tag @s add in_chase
execute as @a[tag=runner] if score @s chase_timeout matches 1.. run scoreboard players remove @s chase_timeout 1

execute as @a[tag=in_chase] at @s run particle soul_fire_flame ~ ~0.2 ~ 0.2 0.07 0.2 0 3 force @s

execute as @a[tag=runner,tag=in_chase] run scoreboard players add @n[type=armor_stand,tag=juggernaut_manager] replenish_progress 1

# scoreboard players set #highest_station var 0
# execute as @e[type=armor_stand,tag=replenishment.station] run function juggernaut:update_highest_station
# execute as @a[tag=runner,tag=in_chase] at @s run execute as @e[type=armor_stand,tag=replenishment.station] if score @s replenish_amount = #highest_station var run function juggernaut:progress_highest_replenishment_station