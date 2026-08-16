# When a runner is hit by the juggernaut, run the respective hook to trigger effects.
execute as @a[tag=runner,scores={damage_taken=1..}] at @s if entity @a[tag=juggernaut,scores={jug_dmg=1..}] run function juggernaut:hooks/hit_by_juggernaut
execute as @a[tag=runner,scores={damage_taken=1..}] run scoreboard players set @s damage_taken 0
execute as @a[tag=juggernaut] run scoreboard players set @s jug_dmg 0

# If a player is undetectable, remove glowing.
execute as @a[tag=undetectable] run effect clear @s glowing
execute as @a[tag=undetectable] run tag @s remove is_glowing

execute at @e[type=armor_stand,tag=respawn_point] as @a[distance=..10] at @r[tag=juggernaut] if entity @e[type=armor_stand,tag=arena.spawn,distance=30..] run tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random,distance=30..]

# Check if players are in chase.
execute if score #game_state var matches 11 run function juggernaut:loop/check_in_chase
execute if score #game_state var matches 11 run function juggernaut:replenishment_management/replenishment_stations
# While juggernaut is not released, disallow all interactions with replenishment stations but allow for runners to see them.
execute if score #game_state var matches 12 as @e[type=armor_stand,tag=replenishment.station] at @s run particle minecraft:end_rod ~ ~2.5 ~ 0.2 60 0.2 0 60 force @a[tag=runner]

# If debug mode is on, display the arena spawn point to all players.
execute if score #juggernaut_customisation debug_mode matches 1 as @e[type=armor_stand,tag=arena.spawn] at @s run particle dust_color_transition{from_color:[0.0f, 1.0f, 1.0f],to_color:[0.0f, 0.0f, 1.0f],scale:2} ~ ~ ~ 0.1 100 0.1 0 100 force @a

execute if score #juggernaut_customisation debug_mode matches 1 as @e[type=armor_stand,tag=replenishment.station] at @s run particle dust_color_transition{from_color:[1.0f, 0.0f, 1.0f],to_color:[1.0f, 0.0f, 0.0f],scale:1} ~ ~0.5 ~ 0.1 0.1 0.1 0 10 force @a

execute if score #game_state var matches 10 run function juggernaut:loop/display_lobby_particles

# Check perks while in start of game lobby.
execute if score #game_state var matches 10 as @a[tag=runner] run function juggernaut:perk_management/runner/check_perks
execute unless score #game_state var matches 11 if score #game_state var matches 10..12 as @a[tag=juggernaut] run function juggernaut:perk_management/juggernaut/check_perks

# Get the highest replenished station.
execute if score #juggernaut_customisation completable_stations matches 1 run scoreboard players set #highest_station var 0
execute if score #juggernaut_customisation completable_stations matches 1 as @e[type=armor_stand,tag=replenishment.station] run function juggernaut:replenishment_management/update_highest_station
execute if score #juggernaut_customisation completable_stations matches 1 unless entity @e[type=armor_stand,tag=highest_station] as @e[type=armor_stand,tag=replenishment.station,limit=1,sort=random] run function juggernaut:replenishment_management/set_highest_station

execute if score #juggernaut_customisation debug_mode matches 0 run function juggernaut:check_end_game

scoreboard players set #runners_left var 0
execute as @a[tag=runner] run scoreboard players add #runners_left var 1

execute as @a[tag=juggernaut,scores={jug_kills=1..}] at @s run function juggernaut:hooks/jug_killed_player
execute as @a[tag=juggernaut,scores={jug_kills=1..}] run scoreboard players set @s jug_kills 0

# Runner Kits
execute as @a[tag=guide] at @s run function juggernaut:loop/runner/guide
execute as @a[tag=escapist] at @s run function juggernaut:loop/runner/escapist
execute as @a[tag=rogue] at @s run function juggernaut:loop/runner/rogue
execute as @a[tag=medic] at @s run function juggernaut:loop/runner/medic
execute as @a[tag=scout] at @s run function juggernaut:loop/runner/scout
execute as @a[tag=survivor] at @s run function juggernaut:loop/runner/survivor
execute as @a[tag=ghost] at @s run function juggernaut:loop/runner/ghost
execute as @a[tag=engineer] at @s run function juggernaut:loop/runner/engineer
execute as @a[tag=trickster] at @s run function juggernaut:loop/runner/trickster
execute as @a[tag=jester] at @s run function juggernaut:loop/runner/jester
execute as @a[tag=puppeteer] at @s run function juggernaut:loop/runner/puppeteer

# Juggernaut Kits
execute as @a[tag=classic_jug] at @s run function juggernaut:loop/juggernaut/classic_jug
execute as @a[tag=dragon] at @s run function juggernaut:loop/juggernaut/dragon
execute as @a[tag=hunter] at @s run function juggernaut:loop/juggernaut/hunter
execute as @a[tag=warlock] at @s run function juggernaut:loop/juggernaut/warlock
execute as @a[tag=predator] at @s run function juggernaut:loop/juggernaut/predator
execute as @a[tag=spirit_walker] at @s run function juggernaut:loop/juggernaut/spirit_walker
execute as @a[tag=witch_doctor] at @s run function juggernaut:loop/juggernaut/witch_doctor
execute as @a[tag=timekeeper] at @s run function juggernaut:loop/juggernaut/timekeeper
execute as @a[tag=chameleon] at @s run function juggernaut:loop/juggernaut/chameleon
execute as @a[tag=fishmonger] at @s run function juggernaut:loop/juggernaut/fishmonger
execute as @a[tag=knight] at @s run function juggernaut:loop/juggernaut/knight
execute as @a[tag=phantom] at @s run function juggernaut:loop/juggernaut/phantom
execute as @a[tag=beast_tamer] at @s run function juggernaut:loop/juggernaut/beast_tamer

# Loop per second function.
scoreboard players add #tick_counter var 1
execute if score #tick_counter var >= #20 var run function juggernaut:loop/second
execute if score #tick_counter var >= #20 var run scoreboard players set #tick_counter var 0

execute as @a run function juggernaut:ability_management/calculate_cooldown_modifier
execute as @a if score @s ability_cooldown0 matches 1.. run scoreboard players operation @s ability_cooldown0 -= @s cooldown_modifier
execute as @a if score @s ability_cooldown1 matches 1.. run scoreboard players operation @s ability_cooldown1 -= @s cooldown_modifier
execute as @a if score @s ability_cooldown2 matches 1.. run scoreboard players operation @s ability_cooldown2 -= @s cooldown_modifier
execute as @a if score @s ability_cooldown3 matches 1.. run scoreboard players operation @s ability_cooldown3 -= @s cooldown_modifier
execute as @a if score @s ability_cooldown4 matches 1.. run scoreboard players operation @s ability_cooldown4 -= @s cooldown_modifier
execute as @a if score @s ability_cooldown5 matches 1.. run scoreboard players operation @s ability_cooldown5 -= @s cooldown_modifier
execute as @a if score @s ability_cooldown6 matches 1.. run scoreboard players operation @s ability_cooldown6 -= @s cooldown_modifier
execute as @a if score @s ability_cooldown7 matches 1.. run scoreboard players operation @s ability_cooldown7 -= @s cooldown_modifier
execute as @a if score @s ability_cooldown8 matches 1.. run scoreboard players operation @s ability_cooldown8 -= @s cooldown_modifier
execute as @a if score @s ability_cooldown9 matches 1.. run scoreboard players operation @s ability_cooldown9 -= @s cooldown_modifier

# Effect particles
execute as @a[tag=undetectable] at @s run particle dust{color:[0,0,0],scale:1} ~ ~0.5 ~ 0.3 1 0.3 0 1 force @s

# Give respawn time effect
execute as @a[tag=has_respawn_protection] run effect give @s weakness 1 255 true

# Predatory Instincts Perk
execute if score #game_state var matches 11 as @a[tag=juggernaut,tag=using_predatory_instincts,predicate=is_still] at @s as @a[tag=runner,tag=!undetectable,distance=..12] run effect give @s glowing 4 0 true

# Insidious Perk
execute as @a[tag=using_insidious,predicate=is_still] run function juggernaut:effects/apply_effect {effect:"undetectable",duration:1}
execute as @a[tag=using_insidious,predicate=is_still] run effect give @s invisibility 1 0 true

# Adept Stalker Perk
execute as @a[tag=using_adept_stalker,predicate=is_sneaking] run function juggernaut:effects/apply_effect {effect:"undetectable",duration:1}

# Set healing needed
execute as @a[tag=runner] run function juggernaut:healing/set_healing_needed

# Healing check
execute as @a[tag=runner,predicate=is_sneaking] at @s if score @s health < @s max_health run function juggernaut:healing/check_self_heal

# Second Wind Perk
execute as @a[tag=using_second_wind] run function juggernaut:loop/update_second_wind

# Remove hidden name tag from Runners when not by revealing tower
execute as @a[tag=runner] at @s unless entity @e[type=armor_stand,tag=revealing_tower,distance=..16] run attribute @s name_tag_distance modifier remove juggernaut:revealing_tower

# Always show tips in the pregame
execute if score #game_state var matches 12 as @a run function tips:show
