scoreboard players set @s lives_remaining 0
scoreboard players operation @s lives_remaining = @s lives
scoreboard players operation @s lives_remaining -= @s game_deaths

execute if score @s lives_remaining matches 1.. run spawnpoint @s 0 101 0
execute if score @s lives_remaining matches 1.. if entity @s[tag=hider] run effect give @s invisibility 25 0 true

execute if score @s lives_remaining matches ..0 run tag @s remove hider
execute if score @s lives_remaining matches ..0 run tag @s remove seeker
execute if score @s lives_remaining matches ..0 run tag @s add spectator
execute if score @s lives_remaining matches ..0 run spawnpoint @s 0 101 0
execute if score @s lives_remaining matches ..0 run attribute @s max_health base set 20
execute if score @s lives_remaining matches ..0 run clear @s
