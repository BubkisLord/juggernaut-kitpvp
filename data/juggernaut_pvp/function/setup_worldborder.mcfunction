# TP Players in game
tp @a 0 100 0

# Set the worldborder
worldborder set 270
execute as @e[type=armor_stand,tag=worldborder_center] run tag @s remove worldborder_center
execute as @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random] run tag @s add worldborder_center
execute at @n[type=armor_stand,tag=worldborder_center] run worldborder center ~ ~
scoreboard players set #juggernaut_pvp_setup_worldborder var 1