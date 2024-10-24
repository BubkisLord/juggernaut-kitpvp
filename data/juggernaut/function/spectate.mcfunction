execute as @p if entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=1}] run clear @s
execute as @p if entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=1}] run tag @s add spectator
execute as @p if entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=1}] run tag @s remove lobby.player
execute as @p if entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=1}] run tp @s @e[tag=arena.spawn,limit=1,sort=random]