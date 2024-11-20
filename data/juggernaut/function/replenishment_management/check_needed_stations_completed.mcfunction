scoreboard players set #stations_completed var 0
execute as @e[type=armor_stand,tag=station_completed] run scoreboard players add #stations_completed var 1

execute if score #stations_completed var >= #stations_needed var run tellraw @a {"text": "Runners win! (Replenishment Complete)","bold": true}
execute if score #stations_completed var >= #stations_needed var run scoreboard players add @a[tag=runner] points 100
execute if score #stations_completed var >= #stations_needed var run function juggernaut:end_game