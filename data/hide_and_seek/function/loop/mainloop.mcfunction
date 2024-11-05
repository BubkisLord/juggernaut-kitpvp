# Main Loop
execute at @e[tag=respawn_point] as @a[distance=..10] run tp @s @e[tag=arena.spawn,limit=1,sort=random]

# Enforce Grace Period
effect give @a[tag=hider] weakness 1 255 true
effect give @a[tag=seeker] strength 1 9 true


# If only one player is alive, wait 15 seconds and then end the game
# Calculate players left.
scoreboard players set #surv_players_alive var 0
execute as @a[scores={lives_remaining=1..}] run scoreboard players add #surv_players_alive var 1
execute if score #surv_players_alive var matches ..1 if score #end_game_timer var matches 10 as @a[scores={lives_remaining=1..}] run tellraw @a [{"selector": "@s","bold": true,"color": "dark_purple","clickEvent": {"action": "open_url","value": "https://www.youtube.com/watch?v=dQw4w9WgXcQ"}},{"text": " Wins!","italic": true,"color":"white"}]
execute if score #surv_players_alive var matches ..1 run scoreboard players remove #end_game_timer var 1
# If only one player is alive, and time is up then end game.
execute if score #end_game_timer var matches ..0 run function hide_and_seek:end_game