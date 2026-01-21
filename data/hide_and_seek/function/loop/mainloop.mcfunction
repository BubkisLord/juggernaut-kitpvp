# Main Loop
execute at @e[type=armor_stand,tag=respawn_point] as @a[distance=..10] at @r[tag=seeker] run tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random,distance=30..]

# Enforce Grace Period
effect give @a[tag=hider] weakness 1 255 true
effect give @a[tag=seeker] strength 1 9 true

execute as @a[tag=seeker] at @s unless entity @e[type=armor_stand,tag=seeker_radar] run summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,CustomNameVisible:false,NoGravity:true,Small:true,Tags:["seeker_radar","kill_on_end_game"]}

execute if score #juggernaut_manager second_counter matches 20.. run execute as @a[tag=seeker] at @s run execute as @a[tag=hider] run function hide_and_seek:loop/seeker_radar

# If only one player is alive, wait 15 seconds and then end the game
# Calculate players left.
scoreboard players set #surv_players_alive var 0
execute as @a[scores={lives_remaining=1..}] run scoreboard players add #surv_players_alive var 1
execute if score #surv_players_alive var matches ..1 run scoreboard players remove #end_game_timer var 1
# If only one player is alive, and time is up then end game.
execute if score #end_game_timer var matches ..0 run function hide_and_seek:end_game

scoreboard players add #juggernaut_manager tick_counter 1
scoreboard players set #20 var 20
execute if score #juggernaut_manager tick_counter >= #20 var run function hide_and_seek:loop/loop_per_second
execute if score #juggernaut_manager tick_counter >= #20 var run scoreboard players set #juggernaut_manager tick_counter 0