#------------------------------------- RUNNER COUNT MAXIMUM -------------------------------------------------
scoreboard players set #juggernaut_manager runner_count 0
execute as @a[scores={health=1..}] run scoreboard players add #juggernaut_manager runner_count 1
scoreboard players operation #juggernaut_manager runner_count -= #juggernaut_customisation juggernaut_count
execute if score #juggernaut_manager runner_count matches 7.. run tellraw @a [{"text": "[","bold": true,"color": "dark_gray"},{"text": "ERROR","bold": true,"color": "red"},{"text": "]","bold": true,"color": "dark_gray"},{"text": " There can only be a max of 6 runners. Allocate more juggernauts or play seperate games in seperate worlds.","color": "red"},{"text": " Click here to increase the juggernaut count to 4. (Experimental)","color": "aqua","click_event": {"action": "run_command","command": "/scoreboard players set #juggernaut_customisation juggernaut_count 3"}}]
execute if score #juggernaut_manager runner_count matches 7.. run return fail
#------------------------------------------------------------------------------------------------------------

tag @a remove lobby.player
execute if score #juggernaut_customisation juggernaut_count matches 0 run tag @a[limit=1,sort=random,scores={health=1..}] add juggernaut
execute if score #juggernaut_customisation juggernaut_count matches 1 run tag @a[limit=2,sort=random,scores={health=1..}] add juggernaut
execute if score #juggernaut_customisation juggernaut_count matches 2 run tag @a[limit=3,sort=random,scores={health=1..}] add juggernaut
tag @a[tag=!juggernaut,scores={health=1..}] add runner
execute as @a[scores={health=..0}] run function juggernaut:spectate
clear @a

function survival:remove_chests

# Teleport everyone to kit selection rooms.
tp @a[tag=juggernaut] 2054.5 114 0.5 facing 2054.5 114 1.5
tp @a[tag=runner] 2054.5 124 0.5 facing 2054.5 124 1.5
team join jug @a[tag=juggernaut]
team join runner @a[tag=runner]

# Give everyone infinite saturation so they never lose hunger.
effect give @a saturation infinite 255 true
effect give @a[tag=juggernaut] regeneration infinite 0 true

stopsound @a
execute as @a[tag=juggernaut] run playsound music_disc.creator record @s ~ ~ ~ 3 0.75
execute as @a[tag=runner] run playsound music_disc.precipice record @s ~ ~ ~ 3 1.1
# execute as @a[tag=runner] run playsound music_disc.precipice record @s ~ ~ ~ 3 0.75

scoreboard players set @a juggernaut_game_time 0
scoreboard players set @a juggernaut_release_timer 0

scoreboard players set #juggernaut_count var 0
execute as @a[tag=juggernaut] run scoreboard players add #juggernaut_count var 1

# runner lives = total juggernauts + 1
scoreboard players set @a[tag=juggernaut] lives 1
execute store result score @a[tag=runner] lives run scoreboard players get #juggernaut_count var
scoreboard players add @a[tag=runner] lives 1
scoreboard players operation @a[tag=runner] lives_remaining = @a[tag=runner] lives
scoreboard players set @a[tag=juggernaut] lives_remaining 1

scoreboard players set @a game_deaths 0

scoreboard players set @a revealing_tower_cooldown 0
scoreboard players set @a replenishment_tower_cooldown 0

scoreboard players set @a point_kills 0
scoreboard players set @a damage_absorbed 0

scoreboard players set #juggernaut_manager scout_reveal_timer 0

tag @a remove in_chase


# Pick the replenishment stations & set the number of stations needed.
execute if score #juggernaut_customisation completable_stations matches 1 run data modify storage juggernaut:replenishment_management/pick_replenishment_stations total_stations set value 8

execute if score #juggernaut_customisation completable_stations matches 1 run execute store result score #total_stations var run data get storage juggernaut:replenishment_management/pick_replenishment_stations total_stations
execute if score #juggernaut_customisation completable_stations matches 1 run scoreboard players operation #stations_needed var = #total_stations var
execute if score #juggernaut_customisation completable_stations matches 1 run scoreboard players operation #stations_needed var -= #3 var
execute if score #juggernaut_customisation completable_stations matches 1 run function juggernaut:replenishment_management/pick_replenishment_stations with storage juggernaut:replenishment_management/pick_replenishment_stations

scoreboard players set #runner_lives_count var 0
execute as @a[tag=runner] run scoreboard players operation #runner_lives_count var += @s lives
scoreboard players remove #runner_lives_count var 2

scoreboard players set #juggernaut_multiplier var 0
execute as @a[tag=juggernaut] run scoreboard players add #juggernaut_multiplier var 1

execute if score #juggernaut_customisation completable_stations matches 1 run scoreboard players set #beginning_time var 3500
execute if score #juggernaut_customisation completable_stations matches 0 run scoreboard players set #beginning_time var 4500

scoreboard players operation #juggernaut_manager total_replenishment_needed = #beginning_time var
scoreboard players operation #juggernaut_manager total_replenishment_needed *= #runner_lives_count var
scoreboard players operation #juggernaut_manager total_replenishment_needed += #beginning_time var
scoreboard players operation #juggernaut_manager total_replenishment_needed /= #juggernaut_multiplier var

scoreboard players operation #juggernaut_manager tmp = #juggernaut_manager total_replenishment_needed
scoreboard players operation #juggernaut_manager tmp /= #100 var
scoreboard players operation #juggernaut_manager tmp *= #5 var
scoreboard players operation #juggernaut_manager total_replenishment_needed -= #juggernaut_manager tmp

execute if score #juggernaut_customisation completable_stations matches 1 run scoreboard players operation #total_replenishment_per_station var = #juggernaut_manager total_replenishment_needed
execute if score #juggernaut_customisation completable_stations matches 1 run scoreboard players operation #total_replenishment_per_station var /= #5 var

# For the above code, the formula is:
# replenishment = 0.95((4500(total_runner_lives - 2) + 4500) / juggernauts)

# Set the game state to pregame
scoreboard players set #game_state var 10
scoreboard players set #juggernaut_manager replenish_progress 0
scoreboard players set #juggernaut_manager replenish_decimal 0
scoreboard players set #juggernaut_manager replenish_percentage 0

# Turn off natural regeneration.
gamerule natural_health_regeneration false

# Juggernaut and Runner Perks
function juggernaut:perk_management/clear_prev_perks
execute if score #juggernaut_customisation perks_enabled matches 1 run function juggernaut:perk_management/give_runner_perks
execute if score #juggernaut_customisation perks_enabled matches 1 run function juggernaut:perk_management/give_juggernaut_perks

tag @a remove saved_skin

# Check if debug mode should be off
execute if score #juggernaut_customisation debug_mode matches 1 run tellraw @a [{"text": "[","bold": true,"color": "dark_gray"},{"text": "WARNING","bold": true,"color": "yellow"},{"text": "]","bold": true,"color": "dark_gray"},{"text": " Debug mode is enabled. This could cause instability and issues.","color": "yellow",bold:false},{"text": " Click here to disable it.","color": "aqua","click_event": {"action": "run_command","command": "/scoreboard players set #juggernaut_customisation debug_mode 0"},bold:false}]