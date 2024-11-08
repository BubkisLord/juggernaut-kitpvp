# Progress replenish chest timer
execute if score #replenish_chest_timer var > #0 var run scoreboard players remove #replenish_chest_timer var 1

# Allow point gaining from kills & replenishing.\
Each alive player passively gets 50 points per chest replenishment.\
Each alive player gets 150 points per kill.\
Each alive player gets 100 points per game ending.\
Each alive player gets 2 points per second if they are on the hill.\
The winner(s) get 200 points for winning.

execute as @a[scores={lives_remaining=1..}] if score @s point_kills matches 1.. run scoreboard players add @s points 150
execute as @a[scores={lives_remaining=1..}] if score @s point_kills matches 1.. run tellraw @s [{"text": "+","italic": true,"bold": true},{"text": "150","color": "gold","italic": true,"bold": true},{"text": " Points! (Killed Player)","color": "white","italic": true,"bold": false}]
execute as @a[scores={lives_remaining=1..}] if score @s point_kills matches 1.. run scoreboard players remove @s point_kills 1

execute if score #replenish_chest_timer var matches 60 run scoreboard players add @a[scores={lives_remaining=1..}] points 50
execute as @a[scores={lives_remaining=1..}] if score #replenish_chest_timer var matches 60 run tellraw @s [{"text": "+","italic": true,"bold": true},{"text": "50","color": "gold","italic": true,"bold": true},{"text": " Points! (Passive Gain)","color": "white","italic": true,"bold": false}]

execute if score #king_of_the_hill_game_ending var matches 1 if score #end_game_timer var matches 10.. as @a[scores={lives_remaining=1..}] run scoreboard players add @s points 100
execute if score #king_of_the_hill_game_ending var matches 1 if score #end_game_timer var matches 10.. as @a[scores={lives_remaining=1..}] run tellraw @s [{"text": "+","italic": true,"bold": true},{"text": "100","color": "gold","italic": true,"bold": true},{"text": " Points! (Alive at Game End)","color": "white","italic": true,"bold": false}]

execute at @n[type=armor_stand,tag=koth_hill] as @a[distance=..3,scores={lives_remaining=1..}] run scoreboard players add @s points 2


# Set King of the Hill Bossbar
scoreboard players set #max_game_time var 0
scoreboard players operation #max_game_time var = #chest_cooldown var
scoreboard players operation #max_game_time var *= #koth_max_chest_resets var

scoreboard players add #current_game_time var 1

execute store result bossbar king_of_the_hill_timer max run scoreboard players get #max_game_time var
execute store result bossbar king_of_the_hill_timer value run scoreboard players get #current_game_time var

# Make Crates be able to be opened
execute as @e[type=armor_stand,tag=crate] at @s unless entity @a[distance=..3] run particle dust_color_transition{from_color:[0.3,0.2,0.2],to_color:[0.9,0.9,0.9],scale:1} ~ ~-0.25 ~ 0.3 0.3 0.3 0 300 force @a[distance=..16]
execute as @e[type=armor_stand,tag=crate] at @s if entity @a[distance=..3] run scoreboard players add @s var 1

# Decrease Grace Period
execute if score #grace_period var > #0 var run title @a actionbar [{"text": "Grace Period: ","bold": true},{"score":{"name":"#grace_period","objective":"var"},"bold": true},{"text": " seconds"}]
execute if score #grace_period var > #0 var run scoreboard players remove #grace_period var 1

execute if score #times_replenished var matches ..2 if score #grace_period var <= #0 var if score #replenish_chest_timer var matches ..60 run title @a actionbar [{"text": "Chest Replenishment In: ","bold": true,"color": "dark_aqua"},{"score": {"name": "#replenish_chest_timer","objective": "var"},"bold": true,"color": "aqua"},{"text": "s"}]
execute if score #times_replenished var matches 3.. if score #grace_period var <= #0 var if score #replenish_chest_timer var matches ..60 run title @a actionbar [{"text": "Game Ends In: ","bold": true,"color": "dark_aqua"},{"score": {"name": "#replenish_chest_timer","objective": "var"},"bold": true,"color": "aqua"},{"text": "s"}]

execute store result score #replenish_chest_mins var run scoreboard players get #replenish_chest_timer var
scoreboard players operation #replenish_chest_mins var /= #60 var
scoreboard players set #negative_mins var 60
scoreboard players operation #negative_mins var *= #replenish_chest_mins var
execute store result score #replenish_chest_seconds var run scoreboard players get #replenish_chest_timer var
scoreboard players operation #replenish_chest_seconds var -= #negative_mins var

execute if score #times_replenished var matches ..2 if score #grace_period var <= #0 var if score #replenish_chest_timer var matches 61.. if score #replenish_chest_mins var matches 2.. run title @a actionbar [{"text": "Chest Replenishment In: ","bold": true,"color": "dark_aqua"},{"score": {"name": "#replenish_chest_mins","objective": "var"},"bold": true,"color": "aqua"},{"text": "mins, "},{"score": {"name": "#replenish_chest_seconds","objective": "var"},"bold": true,"color": "aqua"},{"text": "s"}]
execute if score #times_replenished var matches ..2 if score #grace_period var <= #0 var if score #replenish_chest_timer var matches 61.. if score #replenish_chest_mins var matches ..1 run title @a actionbar [{"text": "Chest Replenishment In: ","bold": true,"color": "dark_aqua"},{"score": {"name": "#replenish_chest_mins","objective": "var"},"bold": true,"color": "aqua"},{"text": "min "},{"score": {"name": "#replenish_chest_seconds","objective": "var"},"bold": true,"color": "aqua"},{"text": "s"}]

execute if score #times_replenished var matches 3.. if score #grace_period var <= #0 var if score #replenish_chest_timer var matches 61.. if score #replenish_chest_mins var matches 2.. run title @a actionbar [{"text": "Game Ends In: ","bold": true,"color": "dark_aqua"},{"score": {"name": "#replenish_chest_mins","objective": "var"},"bold": true,"color": "aqua"},{"text": "mins, "},{"score": {"name": "#replenish_chest_seconds","objective": "var"},"bold": true,"color": "aqua"},{"text": "s"}]
execute if score #times_replenished var matches 3.. if score #grace_period var <= #0 var if score #replenish_chest_timer var matches 61.. if score #replenish_chest_mins var matches ..1 run title @a actionbar [{"text": "Game Ends In: ","bold": true,"color": "dark_aqua"},{"score": {"name": "#replenish_chest_mins","objective": "var"},"bold": true,"color": "aqua"},{"text": "min "},{"score": {"name": "#replenish_chest_seconds","objective": "var"},"bold": true,"color": "aqua"},{"text": "s"}]


execute if score #replenish_chest_timer var = #0 var run function king_of_the_hill:reset_chests
execute if score #replenish_chest_timer var matches 0 run tellraw @a {"text":" "}
execute if score #replenish_chest_timer var matches 0 run tellraw @a [{"text":"[","color":"dark_gray","bold":true},{"text":"King of the Hill","color":"#40a429","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text": "Chests Replenished","color": "#1ba090","bold": false}]
execute if score #replenish_chest_timer var matches 0 run tellraw @a {"text":" "}
execute if score #replenish_chest_timer var = #0 var run execute as @e[type=armor_stand,tag=replenishment.station] run tag @s remove koth_hill
execute if score #replenish_chest_timer var = #0 var run execute as @e[type=armor_stand,tag=replenishment.station,limit=1,sort=random] run tag @s add koth_hill
execute if score #replenish_chest_timer var = #0 var run scoreboard players add #times_replenished var 1
execute if score #replenish_chest_timer var = #0 var run scoreboard players operation #replenish_chest_timer var = #chest_cooldown var


# END GAME SEQUENCE
scoreboard players set #surv_players_alive var 0
execute as @a[scores={lives_remaining=1..}] run scoreboard players add #surv_players_alive var 1
execute if score #surv_players_alive var matches ..1 run scoreboard players set #king_of_the_hill_game_ending var 1

scoreboard players set #teams_alive var 0
execute if score #game_state var matches 36 as @p[team=blue,scores={lives_remaining=1..}] run scoreboard players add #teams_alive var 1
execute if score #game_state var matches 36 as @p[team=red,scores={lives_remaining=1..}] run scoreboard players add #teams_alive var 1
execute if score #game_state var matches 36 as @p[team=green,scores={lives_remaining=1..}] run scoreboard players add #teams_alive var 1

execute if score #game_state var matches 36 if score #teams_alive var matches ..1 run scoreboard players set #king_of_the_hill_game_ending var 1
execute if score #times_replenished var >= #koth_max_chest_resets var run scoreboard players set #king_of_the_hill_game_ending var 1

execute if score #king_of_the_hill_game_ending var matches 1 if score #end_game_timer var matches 10.. run tellraw @a [{"text": "#==== GAME OVER ====#","color": "dark_red","bold": true}]
execute if score #king_of_the_hill_game_ending var matches 1 if score #end_game_timer var matches 10.. run scoreboard players set #hill_progress_blue var 0
execute if score #king_of_the_hill_game_ending var matches 1 if score #end_game_timer var matches 10.. run scoreboard players set #hill_progress_red var 0
execute if score #king_of_the_hill_game_ending var matches 1 if score #end_game_timer var matches 10.. run scoreboard players set #hill_progress_green var 0
execute if score #king_of_the_hill_game_ending var matches 1 if score #end_game_timer var matches 10.. as @a[team=blue] run scoreboard players operation #hill_progress_blue var += @s king_of_the_hill_points
execute if score #king_of_the_hill_game_ending var matches 1 if score #end_game_timer var matches 10.. as @a[team=red] run scoreboard players operation #hill_progress_red var += @s king_of_the_hill_points
execute if score #king_of_the_hill_game_ending var matches 1 if score #end_game_timer var matches 10.. as @a[team=green] run scoreboard players operation #hill_progress_green var += @s king_of_the_hill_points

execute if score #teams_alive var matches 2.. if score #game_state var matches 36 if score #king_of_the_hill_game_ending var matches 1 if score #end_game_timer var matches 10.. if score #hill_progress_blue var >= #hill_progress_red var if score #hill_progress_blue var >= #hill_progress_green var run tellraw @a [{"text": "Team ","color": "white","bold": false},{"text":"Blue","color":"dark_aqua","bold": true},{"text": " Has Won!","color": "white","bold": false}]
execute if score #teams_alive var matches 2.. if score #game_state var matches 36 if score #king_of_the_hill_game_ending var matches 1 if score #end_game_timer var matches 10.. if score #hill_progress_red var >= #hill_progress_blue var if score #hill_progress_red var >= #hill_progress_green var run tellraw @a [{"text": "Team ","color": "white","bold": false},{"text":"Red","color":"dark_red","bold": true},{"text": " Has Won!","color": "white","bold": false}]
execute if score #teams_alive var matches 2.. if score #game_state var matches 36 if score #king_of_the_hill_game_ending var matches 1 if score #end_game_timer var matches 10.. if score #hill_progress_green var >= #hill_progress_red var if score #hill_progress_green var >= #hill_progress_blue var run tellraw @a [{"text": "Team ","color": "white","bold": false},{"text":"Green","color":"green","bold": true},{"text": " Has Won!","color": "white","bold": false}]

execute if score #teams_alive var matches ..1 if score #game_state var matches 36 if score #king_of_the_hill_game_ending var matches 1 if score #end_game_timer var matches 10.. as @p[team=blue,scores={lives_remaining=1..}] run tellraw @a [{"text": "Team ","color": "white","bold": false},{"text":"Blue","color":"blue","bold": true},{"text": " Has Won!","color": "white","bold": false}]
execute if score #teams_alive var matches ..1 if score #game_state var matches 36 if score #king_of_the_hill_game_ending var matches 1 if score #end_game_timer var matches 10.. as @p[team=red,scores={lives_remaining=1..}] run tellraw @a [{"text": "Team ","color": "white","bold": false},{"text":"Red","color":"red","bold": true},{"text": " Has Won!","color": "white","bold": false}]
execute if score #teams_alive var matches ..1 if score #game_state var matches 36 if score #king_of_the_hill_game_ending var matches 1 if score #end_game_timer var matches 10.. as @p[team=green,scores={lives_remaining=1..}] run tellraw @a [{"text": "Team ","color": "white","bold": false},{"text":"Green","color":"green","bold": true},{"text": " Has Won!","color": "white","bold": false}]

execute if score #surv_players_alive var matches ..1 if score #game_state var matches 31 if score #king_of_the_hill_game_ending var matches 1 if score #end_game_timer var matches 10.. as @a[scores={lives_remaining=1..}] run tellraw @a [{"selector":"@s","color":"dark_aqua","bold": true},{"text": " Has Won!","color": "white","bold": false}]

scoreboard players set #highest_hill_points var 0
execute if score #surv_players_alive var matches 2.. if score #game_state var matches 31 as @a[scores={lives_remaining=1..}] run function king_of_the_hill:loop/update_high_score
execute if score #surv_players_alive var matches 2.. if score #game_state var matches 31 if score #king_of_the_hill_game_ending var matches 1 if score #end_game_timer var matches 10.. as @a run execute as @s if score @s king_of_the_hill_points = #highest_hill_points var run tellraw @a [{"selector":"@s","color":"dark_aqua","bold": true},{"text": " Has Won!","color": "white","bold": false}]

execute if score #king_of_the_hill_game_ending var matches 1 run scoreboard players remove #end_game_timer var 1