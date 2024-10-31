# Make Crates be able to be opened
execute as @e[type=armor_stand,tag=crate] at @s unless entity @a[distance=..3] run particle dust_color_transition{from_color:[0.3,0.2,0.2],to_color:[0.9,0.9,0.9],scale:1} ~ ~-0.25 ~ 0.3 0.3 0.3 0 300 force @a[distance=..16]
execute as @e[type=armor_stand,tag=crate] at @s if entity @a[distance=..3] run scoreboard players add @s var 1

# Decrease Grace Period
execute if score #grace_period var > #0 var run title @a actionbar [{"text": "Grace Period: ","bold": true},{"score":{"name":"#grace_period","objective":"var"},"bold": true},{"text": " seconds"}]
execute if score #grace_period var > #0 var run scoreboard players remove #grace_period var 1

# Make the worldborder close faster the more replenishments have occurred. Additionally, limit the minimum space to 5 block radius.
execute store result score #worldborder_size var run worldborder get

execute if score #worldborder_size var > #5 var if score #times_replenished var = #0 var if score #grace_period var <= #0 var run worldborder add -0.25 1
execute if score #worldborder_size var > #5 var if score #times_replenished var = #1 var if score #grace_period var <= #0 var run worldborder add -0.5 1
execute if score #worldborder_size var > #5 var if score #times_replenished var = #2 var if score #grace_period var <= #0 var run worldborder add -0.75 1
execute if score #worldborder_size var > #5 var if score #times_replenished var >= #3 var if score #grace_period var <= #0 var run worldborder add -2 1


# Progress replenish chest timer
execute if score #replenish_chest_timer var > #0 var run scoreboard players remove #replenish_chest_timer var 1

execute if score #grace_period var <= #0 var if score #replenish_chest_timer var matches ..60 run title @a actionbar [{"text": "Chest Replenishment In: ","bold": true,"color": "dark_aqua"},{"score": {"name": "#replenish_chest_timer","objective": "var"},"bold": true,"color": "aqua"},{"text": "s"}]

execute store result score #replenish_chest_mins var run scoreboard players get #replenish_chest_timer var
scoreboard players operation #replenish_chest_mins var /= #60 var
scoreboard players set #negative_mins var 60
scoreboard players operation #negative_mins var *= #replenish_chest_mins var
execute store result score #replenish_chest_seconds var run scoreboard players get #replenish_chest_timer var
scoreboard players operation #replenish_chest_seconds var -= #negative_mins var

execute if score #grace_period var <= #0 var if score #replenish_chest_timer var matches 61.. if score #replenish_chest_mins var matches 2.. run title @a actionbar [{"text": "Chest Replenishment In: ","bold": true,"color": "dark_aqua"},{"score": {"name": "#replenish_chest_mins","objective": "var"},"bold": true,"color": "aqua"},{"text": "mins, "},{"score": {"name": "#replenish_chest_seconds","objective": "var"},"bold": true,"color": "aqua"},{"text": "s"}]
execute if score #grace_period var <= #0 var if score #replenish_chest_timer var matches 61.. if score #replenish_chest_mins var matches ..1 run title @a actionbar [{"text": "Chest Replenishment In: ","bold": true,"color": "dark_aqua"},{"score": {"name": "#replenish_chest_mins","objective": "var"},"bold": true,"color": "aqua"},{"text": "min "},{"score": {"name": "#replenish_chest_seconds","objective": "var"},"bold": true,"color": "aqua"},{"text": "s"}]

execute if score #replenish_chest_timer var = #0 var run function survival:reset_chests
execute if score #replenish_chest_timer var = #0 var run scoreboard players add #times_replenished var 1
execute if score #replenish_chest_timer var = #0 var run scoreboard players set #replenish_chest_timer var 120

# Progress seconds until end of game
scoreboard players set #15 var 15
execute if score #surv_players_alive var = #1 var if score #end_game_timer var >= #15 var run tellraw @a [{"text": "#==== GAME OVER ====#","color": "dark_red","bold": true}]
execute if score #survival_teams var matches ..0 if score #surv_players_alive var = #1 var if score #end_game_timer var >= #15 var as @a[scores={lives_remaining=1..}] run tellraw @a [{"selector": "@s","bold": true,"color": "red"},{"text": " Has Won!","color": "white","bold": false}]
execute if score #survival_teams var matches 1.. if score #surv_players_alive var = #1 var if score #end_game_timer var >= #15 var as @a[scores={lives_remaining=1..}] run tellraw @a [{"text": "Team ","color": "white","bold": false},{"nbt":"team", "entity": "@s","bold": true},{"text": " Has Won!","color": "white","bold": false}]
# execute if score #surv_players_alive var = #1 var run tellraw @a [{"text": "Game Ends In: "},{"score": {"name": "#end_game_timer","objective": "var"},"bold": true},{"text": " seconds","bold": false}]
execute if score #surv_players_alive var = #1 var run scoreboard players remove #end_game_timer var 1