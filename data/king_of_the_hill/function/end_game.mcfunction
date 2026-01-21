scoreboard players set #game_state var 0
scoreboard players set #grace_period var 0
scoreboard players set @n[type=armor_stand,tag=surv_game_manager] tick_counter 0
scoreboard players set #surv_players_alive var 0
scoreboard players set #max_crate_count var 0
scoreboard players set #end_game_timer var 15
scoreboard players set #crate_count var 0
scoreboard players set #king_of_the_hill_teams var 0
scoreboard players set #max_game_time var 0
scoreboard players set #current_game_time var 0

execute as @e[type=armor_stand,tag=koth_hill] run tag @s remove koth_hill
scoreboard players reset @a king_of_the_hill_points
scoreboard objectives setdisplay below_name health

team leave @a
bossbar remove king_of_the_hill_timer

worldborder set 9999

spawnpoint @a 2000 100 0
gamerule show_death_messages false
clear @a
gamemode adventure @a
tag @a remove spectator
kill @e[type=item]
kill @a
gamerule keep_inventory true
gamerule show_death_messages true
function king_of_the_hill:remove_chests
kill @e[tag=kill_on_end_game]
attribute @s max_health base set 20
scoreboard players set @a lives 0
scoreboard players set @a game_deaths 0
gamemode adventure @a
kill @e[type=item]