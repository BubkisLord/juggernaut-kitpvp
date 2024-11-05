# Make Crates be able to be opened
execute as @e[type=armor_stand,tag=crate] at @s unless entity @a[distance=..3] run particle dust_color_transition{from_color:[0.3,0.2,0.2],to_color:[0.9,0.9,0.9],scale:1} ~ ~-0.25 ~ 0.3 0.3 0.3 0 300 force @a[distance=..16]
execute as @e[type=armor_stand,tag=crate] at @s if entity @a[distance=..3] run scoreboard players add @s var 1

# Decrease Grace Period
execute if score #grace_period var > #0 var run title @a actionbar [{"text": "Grace Period: ","bold": true},{"score":{"name":"#grace_period","objective":"var"},"bold": true},{"text": " seconds"}]
execute if score #grace_period var > #0 var run scoreboard players remove #grace_period var 1

# Make the worldborder close faster the more replenishments have occurred. Additionally, limit the minimum space to 5 block radius.
execute store result score #worldborder_size var run worldborder get

execute if score #worldborder_size var matches 11.. if score #times_replenished var = #0 var if score #grace_period var <= #0 var run worldborder add -0.25 1
execute if score #worldborder_size var matches 11.. if score #times_replenished var = #1 var if score #grace_period var <= #0 var run worldborder add -0.5 1
execute if score #worldborder_size var matches 11.. if score #times_replenished var = #2 var if score #grace_period var <= #0 var run worldborder add -0.75 1
execute if score #worldborder_size var matches 11.. if score #times_replenished var >= #3 var if score #grace_period var <= #0 var run worldborder add -2 1


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
scoreboard players set #surv_players_alive var 0
execute as @a[scores={lives_remaining=1..}] run scoreboard players add #surv_players_alive var 1
execute if score #surv_players_alive var matches ..1 run scoreboard players set #survival_game_ending var 1

scoreboard players set #teams_alive var 0
execute if score #game_state var matches 26 as @p[team=blue,scores={lives_remaining=1..}] run scoreboard players add #teams_alive var 1
execute if score #game_state var matches 26 as @p[team=red,scores={lives_remaining=1..}] run scoreboard players add #teams_alive var 1
execute if score #game_state var matches 26 as @p[team=green,scores={lives_remaining=1..}] run scoreboard players add #teams_alive var 1

execute if score #game_state var matches 26 if score #teams_alive var matches ..1 run scoreboard players set #survival_game_ending var 1

execute if score #survival_game_ending var matches 1 if score #end_game_timer var matches 10.. run tellraw @a [{"text": "#==== GAME OVER ====#","color": "dark_red","bold": true}]
execute if score #teams_alive var matches ..1 if score #game_state var matches 26 if score #survival_game_ending var matches 1 if score #end_game_timer var matches 10.. as @p[team=blue,scores={lives_remaining=1..}] run tellraw @a [{"text": "Team ","color": "white","bold": false},{"text":"Blue","color":"blue","bold": true},{"text": " Has Won!","color": "white","bold": false}]
execute if score #teams_alive var matches ..1 if score #game_state var matches 26 if score #survival_game_ending var matches 1 if score #end_game_timer var matches 10.. as @p[team=red,scores={lives_remaining=1..}] run tellraw @a [{"text": "Team ","color": "white","bold": false},{"text":"Red","color":"red","bold": true},{"text": " Has Won!","color": "white","bold": false}]
execute if score #teams_alive var matches ..1 if score #game_state var matches 26 if score #survival_game_ending var matches 1 if score #end_game_timer var matches 10.. as @p[team=green,scores={lives_remaining=1..}] run tellraw @a [{"text": "Team ","color": "white","bold": false},{"text":"Green","color":"green","bold": true},{"text": " Has Won!","color": "white","bold": false}]

execute if score #surv_players_alive var matches ..1 if score #game_state var matches 31 if score #survival_game_ending var matches 1 if score #end_game_timer var matches 10.. as @a[scores={lives_remaining=1..}] run tellraw @a [{"selector":"@s","color":"dark_aqua","bold": true},{"text": " Has Won!","color": "white","bold": false}]

# execute if score #survival_teams var matches 1.. if score #survival_game_ending var matches 1 if score #end_game_timer var matches 10.. as @a[scores={lives_remaining=1..}] run tellraw @a [{"text": "Team ","color": "white","bold": false},{"nbt":"team", "entity": "@s","bold": true},{"text": " Has Won!","color": "white","bold": false}]
# execute if score #survival_game_ending var matches 1 run tellraw @a [{"text": "Game Ends In: "},{"score": {"name": "#end_game_timer","objective": "var"},"bold": true},{"text": " seconds","bold": false}]
execute if score #survival_game_ending var matches 1 run scoreboard players remove #end_game_timer var 1