scoreboard players set @n[type=armor_stand,tag=surv_game_manager] game_state 0
scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] game_state 0
scoreboard players set @n[type=armor_stand,tag=surv_game_manager] grace_period 0
scoreboard players set @n[type=armor_stand,tag=surv_game_manager] tick_counter 0
scoreboard players set #surv_players_alive var 0
scoreboard players set #max_crate_count var 0
scoreboard players set #end_game_timer var 15
scoreboard players set #crate_count var 0
scoreboard players set #survival_teams var 0

worldborder set 9999

spawnpoint @a 2000 100 0
gamerule showDeathMessages false
clear @a
gamemode adventure @a
tag @a remove spectator
kill @e[type=item]
kill @a
gamerule keepInventory true
gamerule showDeathMessages true
function survival:remove_chests
kill @e[tag=kill_on_end_game]
attribute @s generic.max_health base set 20
scoreboard players set @a lives 0
scoreboard players set @a game_deaths 0
gamemode adventure @a
kill @e[type=item]