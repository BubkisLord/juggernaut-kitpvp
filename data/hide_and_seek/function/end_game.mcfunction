scoreboard players set #game_state var 0
scoreboard players set #hide_and_seek_game_ending var 0
scoreboard players set @a hide_and_seek_game_time 0
scoreboard players set @a seeker_release_timer 0
spawnpoint @a 2000 100 0
gamerule showDeathMessages false
tag @a remove hider
tag @a remove seeker
clear @a
kill @a
gamerule showDeathMessages true
kill @e[tag=kill_on_end_game]
attribute @s generic.max_health base set 20
scoreboard players set @a lives 0
scoreboard players set @a game_deaths 0
team leave @a
gamemode adventure @a
stopsound @a
schedule clear hide_and_seek:loop/loop_per_second