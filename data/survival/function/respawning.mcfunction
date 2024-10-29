scoreboard players set @s lives_remaining 0
scoreboard players operation @s lives_remaining = @s lives
scoreboard players operation @s lives_remaining -= @s game_deaths
scoreboard players set #1 var 1

execute if score @s lives_remaining >= #1 var run spawnpoint @s 0 101 0
execute if score @s lives_remaining >= #1 var run effect give @s invisibility 20 0 true
execute if score @s lives_remaining >= #1 var run clear @s

# Omitted - removing tags. If this is needed when a player is killed from the game, then uncomment this line.
# execute if score @s lives_remaining < #1 var run tag @s remove ...

execute if score @s lives_remaining < #1 var run attribute @s generic.max_health base set 20
execute if score @s lives_remaining < #1 var run tag @s add lobby.player
execute if score @s lives_remaining < #1 var run clear @s
