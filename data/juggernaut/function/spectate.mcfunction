execute as @s if score #game_state var matches 10..39 run clear @s
execute as @s if score #game_state var matches 10..39 run tag @s add spectator
execute as @s if score #game_state var matches 10..39 run tag @s remove lobby.player
execute as @s if score #game_state var matches 10..39 run tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]