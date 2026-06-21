execute if score #game_state var matches 0 run return fail

clear @s
tag @s add spectator
tag @s remove lobby.player
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]