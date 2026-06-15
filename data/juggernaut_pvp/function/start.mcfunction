# Reset player stats
scoreboard players set @a lives 1
scoreboard players set @a lives_remaining 1
scoreboard players set @a game_deaths 0
scoreboard players set @a damage_absorbed 0

# Turn off other games if they're running.
scoreboard players set #game_state var 0

# Reset player attributes
execute as @a run attribute @s max_health base set 20

# Reset player inventory
clear @a

# Reset player tags
tag @a remove lobby.player

# Reset player effects
effect clear @a

# Reset the crate count
scoreboard players operation #max_crate_count var = #juggernaut_pvp_customisation crate_count
scoreboard players set #crate_count var 0

# Allow players to drop items
gamerule keep_inventory false

# Set the game state to pregame - Possibly needed if game starting is later changed for some unforseen reason.
scoreboard players operation #juggernaut_pvp_teams var = #juggernaut_pvp_customisation teams_mode
execute if score #juggernaut_pvp_teams var matches 0 run scoreboard players set #game_state var 40
execute if score #juggernaut_pvp_teams var matches 1 run scoreboard players set #game_state var 45
execute if score #juggernaut_pvp_teams var matches 1 run function survival:start_with_teams

# Make all players invulnerable until game starts and is off grace period
effect give @a resistance infinite 255 true
effect give @a weakness infinite 255 true

# Teleport players into the game
tp @a 2054.5 114 0.5 facing 2054.5 114 1.5

execute as @a[team=blue] run tp @s @a[team=blue,limit=1,sort=furthest]
execute as @a[team=red] run tp @s @a[team=red,limit=1,sort=furthest]
execute as @a[team=green] run tp @s @a[team=green,limit=1,sort=furthest]
execute as @a[team=yellow] run tp @s @a[team=yellow,limit=1,sort=furthest]

# Reset end game timer.
scoreboard players set #end_game_timer var 10
scoreboard players set #survival_game_ending var 0

# Reset worldborder set up flag
scoreboard players set #juggernaut_pvp_setup_worldborder var 0

# Remove any leftover items
kill @e[type=item]

# Reset - no longer needed.
scoreboard players set #juggernaut_pvp_teams var 0

# Set the grace period to 10 seconds (instead of 40 like regular survival gamemode)
scoreboard players set #grace_period var 10

spawnpoint @a 0 300 0