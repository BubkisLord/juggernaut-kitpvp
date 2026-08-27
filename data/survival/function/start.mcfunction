execute unless score #game_state var matches 0 run return fail

# Reset player stats
scoreboard players set @a lives 1
scoreboard players set @a lives_remaining 1
scoreboard players set @a game_deaths 0

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
scoreboard players operation #max_crate_count var = #survival_customisation crate_count
scoreboard players set #crate_count var 0

# Allow players to drop items
gamerule keep_inventory false

execute if score #survival_customisation teams_mode matches 1 run function survival:start_with_teams

# Teleport players into the game
tp @a 0 101 0

execute as @a[team=blue] run tp @s @a[team=blue,limit=1,sort=furthest]
execute as @a[team=red] run tp @s @a[team=red,limit=1,sort=furthest]
execute as @a[team=green] run tp @s @a[team=green,limit=1,sort=furthest]
execute as @a[team=yellow] run tp @s @a[team=yellow,limit=1,sort=furthest]

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
execute if score #survival_customisation teams_mode matches 0 run scoreboard players set #game_state var 21
execute if score #survival_customisation teams_mode matches 1 run scoreboard players set #game_state var 26

# Set the grace period to 40 seconds
scoreboard players set #grace_period var 40

spawnpoint @a 0 300 0

tellraw @a [\
  {"text":"Survival ","color":"dark_aqua"},\
  {"text":"- Game Started!\n","color":"gray"},\
\
  {"text":"Loot chests are scattered across the map, and ","color":"gray"},\
  {"text":"particles","color":"aqua"},\
  {"text":" above them show rarity: ","color":"gray"},\
  {"text":"Uncommon","color":"#70d259"},\
  {"text":", ","color":"gray"},\
  {"text":"Rare","color":"aqua"},\
  {"text":", or ","color":"gray"},\
  {"text":"Legendary","color":"gold"},\
  {"text":".\n","color":"gray"},\
\
  {"text":"Survival Crates also spawn randomly, dropping consumables and bonus loot.\n","color":"gray"},\
\
  {"text":"(Teams, crate count & legendary chests can be toggled in game settings.)\n","color":"#7c7c7c"},\
\
  {"text":"Eliminate all other players to win!","color":"red"}\
]