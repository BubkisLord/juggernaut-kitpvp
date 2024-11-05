tag @a remove lobby.player
execute if score #hide_and_seek_customisation seeker_count matches 1 run tag @a[limit=1,sort=random] add seeker
execute if score #hide_and_seek_customisation seeker_count matches 2 run tag @a[limit=2,sort=random] add seeker
execute if score #hide_and_seek_customisation seeker_count matches 3 run tag @a[limit=3,sort=random] add seeker

tag @a[tag=!seeker] add hider
clear @a

function survival:remove_chests

tp @a[tag=seeker] 2054.5 135 0.5 facing 2054.5 135 1.5
tp @a[tag=hider] 0 100 0
team join seeker @a[tag=seeker]
team join hider @a[tag=hider]

execute as @a[tag=seeker] run playsound music_disc.pigstep record @s ~ ~ ~ 3 0.75

scoreboard players set @a seeker_release_timer 0

scoreboard players set @a[tag=seeker] lives 1
execute store result score @a[tag=hider] lives run scoreboard players get #hide_and_seek_customisation lives_count

scoreboard players set @a game_deaths 0

# Set the game state to pregame
scoreboard players set #game_state var 50

function hide_and_seek:start_game