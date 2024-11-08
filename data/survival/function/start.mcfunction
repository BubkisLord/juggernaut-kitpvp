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
scoreboard players operation #max_crate_count var = #survival_customisation crate_count
scoreboard players set #crate_count var 0

# Allow players to drop items
gamerule keepInventory false

# Set the game state to pregame - Possibly needed if game starting is later changed for some unforseen reason.
scoreboard players operation #survival_teams var = #survival_customisation teams_mode
execute if score #survival_teams var matches 0 run scoreboard players set #game_state var 20
execute if score #survival_teams var matches 1 run scoreboard players set #game_state var 25
execute if score #survival_teams var matches 1 run function survival:start_with_teams

# Teleport players into the game
tp @a 0 101 0

# Reset the chests
function survival:reset_chests

# Reset end game timer.
scoreboard players set #end_game_timer var 10
scoreboard players set #survival_game_ending var 0

# Set the worldborder
worldborder set 270
execute as @e[type=armor_stand,tag=worldborder_center] run tag @s remove worldborder_center
execute as @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random] run tag @s add worldborder_center
execute at @n[type=armor_stand,tag=worldborder_center] run worldborder center ~ ~

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