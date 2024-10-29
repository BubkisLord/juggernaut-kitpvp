# Reset player stats
scoreboard players set @a lives 1
scoreboard players set @a lives_remaining 1
scoreboard players set @a game_deaths 0

# Turn off juggernaut if its running.
scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] game_state 0

# Reset player attributes
scoreboard players set @a max_health 20
scoreboard players set @a health 20

# Reset player inventory
clear @a

# Reset player tags
tag @a remove lobby.player

# Reset player effects
effect clear @a

# Reset the crate count
scoreboard players set #max_crate_count var 6
scoreboard players set #crate_count var 0

# Allow players to drop items
gamerule keepInventory false

# Set the game state to pregame - Possibly needed if game starting is later changed for some unforseen reason.
scoreboard players set @n[type=armor_stand,tag=surv_game_manager] game_state 2

# Teleport players into the game
tp @a 0 101 0

# Reset the chests
function survival:reset_chests

# Reset end game timer.
scoreboard players set #end_game_timer var 15

# Set the worldborder
worldborder set 200

# Remove any leftover items
kill @e[type=item]

# Start the game
scoreboard players set @n[type=armor_stand,tag=surv_game_manager] game_state 1

# Set the grace period to 40 seconds
scoreboard players set @n[type=armor_stand,tag=surv_game_manager] grace_period 40

spawnpoint @a 0 300 0