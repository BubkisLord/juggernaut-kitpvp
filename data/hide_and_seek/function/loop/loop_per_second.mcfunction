execute if score @n[tag=seeker] hide_and_seek_game_time matches ..0 run function hide_and_seek:end_game
execute if score @n[tag=seeker] hide_and_seek_game_time matches 1.. run scoreboard players remove @a[tag=seeker] hide_and_seek_game_time 1

scoreboard players set #max_game_time var 300
execute store result bossbar hide_and_seek_timer max run scoreboard players get #max_game_time var
execute store result bossbar hide_and_seek_timer value run scoreboard players get @p[tag=seeker] hide_and_seek_game_time

# END GAME
scoreboard players set #hide_and_seek_players_alive var 0
execute as @a[scores={lives_remaining=1..}] run scoreboard players add #hide_and_seek_players_alive var 1
execute if score #hide_and_seek_players_alive var matches ..1 run scoreboard players set #hide_and_seek_game_ending var 1

scoreboard players set #teams_alive var 0
execute if score #game_state var matches 51 as @p[team=seeker,scores={lives_remaining=1..}] run scoreboard players add #teams_alive var 1
execute if score #game_state var matches 51 as @p[team=hider,scores={lives_remaining=1..}] run scoreboard players add #teams_alive var 1

execute if score #game_state var matches 51 if score #teams_alive var matches ..1 run scoreboard players set #hide_and_seek_game_ending var 1

execute if score #hide_and_seek_game_ending var matches 1 if score #end_game_timer var matches 10.. run tellraw @a [{"text": "#==== GAME OVER ====#","color": "dark_red","bold": true}]
execute if score #teams_alive var matches ..1 if score #game_state var matches 51 if score #hide_and_seek_game_ending var matches 1 if score #end_game_timer var matches 9.. as @p[team=seeker,scores={lives_remaining=1..}] run tellraw @a [{"text": "Team ","color": "white","bold": false},{"text":"Seekers","color":"red","bold": true},{"text": " Have Won!","color": "white","bold": false}]
execute if score #teams_alive var matches ..1 if score #game_state var matches 51 if score #hide_and_seek_game_ending var matches 1 if score #end_game_timer var matches 9.. as @p[team=hider,scores={lives_remaining=1..}] run tellraw @a [{"text": "Team ","color": "white","bold": false},{"text":"Hiders","color":"dark_aqua","bold": true},{"text": " Have Won!","color": "white","bold": false}]

execute if score #hide_and_seek_game_ending var matches 1 run scoreboard players remove #end_game_timer var 1
execute if score #game_state var matches 50..59 if score #end_game_timer var matches ..0 run function hide_and_seek:end_game

execute as @e[type=armor_stand,tag=juggernaut_manager] run scoreboard players add @s second_counter 1
execute as @e[type=armor_stand,tag=juggernaut_manager] if score @s second_counter matches 45.. run scoreboard players set @s second_counter 0
