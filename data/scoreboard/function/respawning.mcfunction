execute if entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=1}] run function juggernaut:respawning
execute if entity @e[type=armor_stand,tag=surv_game_manager,scores={game_state=1}] run function survival:respawning
execute if entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=0}] if entity @e[type=armor_stand,tag=surv_game_manager,scores={game_state=0}] run function scoreboard:kitpvp_respawn