# Reset player stats
scoreboard players set @a lives 1
scoreboard players set @a lives_remaining 1
scoreboard players set @a game_deaths 0

# Turn off other games if they're running.
scoreboard players set #game_state var 0

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
execute if score #survival_teams var matches 0 run scoreboard players set #game_state var 20
execute if score #survival_teams var matches 1 run scoreboard players set #game_state var 25

# Teleport players into the game
tp @a 0 101 0

# Reset the chests
function survival:reset_chests

# Reset end game timer.
scoreboard players set #end_game_timer var 15

# Set the worldborder
worldborder set 270

# Remove any leftover items
kill @e[type=item]

# Set the replenish chest timer to 120s - 2 mins
scoreboard players set #replenish_chest_timer var 120

# Set the replenish chest count to 0
scoreboard players set #times_replenished var 0

# Start the game
execute if score #survival_teams var matches 0 run scoreboard players set #game_state var 21
execute if score #survival_teams var matches 1 run scoreboard players set #game_state var 26

# Reset - no longer needed.
scoreboard players set #survival_teams var 0

# Set the grace period to 40 seconds
scoreboard players set #grace_period var 40

spawnpoint @a 0 300 0