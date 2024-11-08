tag @a remove lobby.player
execute if score #juggernaut_customisation juggernaut_count matches 1 run tag @a[limit=1,sort=random] add juggernaut
execute if score #juggernaut_customisation juggernaut_count matches 2 run tag @a[limit=2,sort=random] add juggernaut
execute if score #juggernaut_customisation juggernaut_count matches 3 run tag @a[limit=3,sort=random] add juggernaut
# tag cyberduck2 add juggernaut
tag @a[tag=!juggernaut] add runner
clear @a

function survival:remove_chests

tp @a[tag=juggernaut] 2054.5 114 0.5 facing 2054.5 114 1.5
tp @a[tag=runner] 2054.5 124 0.5 facing 2054.5 124 1.5
team join jug @a[tag=juggernaut]
team join runner @a[tag=runner]

stopsound @a
execute as @a[tag=juggernaut] run playsound music_disc.creator record @s ~ ~ ~ 3 0.75
execute as @a[tag=runner] run playsound music_disc.precipice record @s ~ ~ ~ 3 1.1
# execute as @a[tag=runner] run playsound music_disc.precipice record @s ~ ~ ~ 3 0.75

scoreboard players set @a juggernaut_game_time 0
scoreboard players set @a juggernaut_release_timer 0

scoreboard players set #juggernaut_count var 0
execute as @a[tag=juggernaut] run scoreboard players add #juggernaut_count var 1

scoreboard players set @a[tag=juggernaut] lives 1
execute store result score @a[tag=runner] lives run scoreboard players get #juggernaut_count var
scoreboard players add @a[tag=runner] lives 1

scoreboard players set @a game_deaths 0

scoreboard players set @a revealing_tower_cooldown 0
scoreboard players set @a replenishment_tower_cooldown 0

scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] scout_reveal_timer 0

# Calculate the total needed replenishing time for the runners to win.
scoreboard players set #playercount var 0
execute as @a[tag=runner] run scoreboard players add #playercount var 1
scoreboard players set #juggernaut_multiplier var 0
execute as @a[tag=juggernaut] run scoreboard players add #juggernaut_multiplier var 1
scoreboard players set #beginning_time var 3000
scoreboard players operation @n[type=armor_stand,tag=juggernaut_manager] total_replenishment_needed = #beginning_time var
scoreboard players operation @n[type=armor_stand,tag=juggernaut_manager] total_replenishment_needed *= #playercount var
scoreboard players operation @n[type=armor_stand,tag=juggernaut_manager] total_replenishment_needed += #beginning_time var
scoreboard players operation @n[type=armor_stand,tag=juggernaut_manager] total_replenishment_needed /= #juggernaut_multiplier var


# Set the game state to pregame
scoreboard players set #game_state var 10
scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] replenish_progress 0
scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal 0
scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] replenish_percentage 0