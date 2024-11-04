scoreboard players operation @s lives_remaining = @s lives
execute if score #king_of_the_hill_customisation infinite_lives matches 0 run scoreboard players operation @s lives_remaining -= @s game_deaths


execute if score @s lives_remaining matches 1.. run spawnpoint @s 0 101 0
execute if score @s lives_remaining matches 1.. run effect give @s invisibility 20 0 true
execute if score @s lives_remaining matches 1.. run clear @s

execute if score @s lives_remaining matches ..0 run clear @s
execute if score @s lives_remaining matches ..0 run tag @s add spectator
execute if score @s lives_remaining matches ..0 run tag @s remove lobby.player
execute if score @s lives_remaining matches ..0 run spawnpoint @s 0 101 0
execute if score @s lives_remaining matches ..0 run attribute @s generic.max_health base set 20
execute if score @s lives_remaining matches ..0 run clear @s