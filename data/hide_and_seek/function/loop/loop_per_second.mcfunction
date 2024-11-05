execute if score @n[tag=seeker] hide_and_seek_game_time matches ..0 run function hide_and_seek:end_game
execute if score @n[tag=seeker] hide_and_seek_game_time matches 1.. run scoreboard players remove @a[tag=seeker] hide_and_seek_game_time 1


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

schedule function hide_and_seek:loop/loop_per_second 1s append