# Make Crates be able to be opened
execute as @e[type=armor_stand,tag=crate] at @s unless entity @a[distance=..3] run particle dust_color_transition{from_color:[0.3,0.2,0.2],to_color:[0.9,0.9,0.9],scale:1} ~ ~-0.25 ~ 0.3 0.3 0.3 0 300 force @a[distance=..16]
execute as @e[type=armor_stand,tag=crate] at @s if entity @a[distance=..3] run scoreboard players add @s var 1

# Decrease Grace Period
execute if score @n[type=armor_stand,tag=surv_game_manager] grace_period > #0 var run title @a actionbar [{"text": "Grace Period: ","bold": true},{"score":{"name":"@n[type=armor_stand,tag=surv_game_manager]","objective":"grace_period"},"bold": true},{"text": " seconds"}]
execute as @n[type=armor_stand,tag=surv_game_manager] if score @s grace_period > #0 var run scoreboard players remove @s grace_period 1

execute if score @n[type=armor_stand,tag=surv_game_manager] grace_period <= #0 var run worldborder add -0.33 1

# Progress seconds until end of game
scoreboard players set #15 var 15
execute if score #surv_players_alive var = #1 var if score #end_game_timer var >= #15 var run tellraw @a [{"text": "#==== GAME OVER ====#","color": "dark_red","bold": true}]
execute if score #surv_players_alive var = #1 var if score #end_game_timer var >= #15 var as @a[scores={lives_remaining=1..}] run tellraw @a [{"selector": "@s","bold": true,"color": "red"},{"text": " Has Won!","color": "white","bold": false}]
# execute if score #surv_players_alive var = #1 var run tellraw @a [{"text": "Game Ends In: "},{"score": {"name": "#end_game_timer","objective": "var"},"bold": true},{"text": " seconds","bold": false}]
execute if score #surv_players_alive var = #1 var run scoreboard players remove #end_game_timer var 1