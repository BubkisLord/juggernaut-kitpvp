tellraw @a [{"text": "Juggernaut","color": "dark_red"},{"text": " is starting!","color": "gray"}]

# Sets the timer to be 25 seconds.
scoreboard players set @a[tag=juggernaut] juggernaut_release_timer 25

# Score for the juggernaut game time left is set to the max time (300 seconds) plus the release timer (25 seconds)
# This is for when the game time is capped. (Optional)
# scoreboard players set @a[tag=juggernaut] juggernaut_game_time 325

tp @a[tag=runner] @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]

execute store result score @a[tag=survivor] lives run scoreboard players get #juggernaut_count var
scoreboard players add @a[tag=survivor] lives 2

# Set all healing progress to 0
scoreboard players set @a healing_progress 0

scoreboard players set #game_state var 12
