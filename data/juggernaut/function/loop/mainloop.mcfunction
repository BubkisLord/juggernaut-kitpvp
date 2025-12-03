# When a runner is hit by the juggernaut, run the respective hook to trigger effects.
execute as @a[tag=runner,scores={damage_taken=1..}] at @s if entity @a[tag=juggernaut,distance=..5] run function juggernaut:hooks/hit_by_juggernaut
execute as @a[tag=runner,scores={damage_taken=1..}] run scoreboard players set @s damage_taken 0

# If a player is undetectable, remove glowing.
execute as @a[tag=is_undetectable] run effect clear @s glowing

execute at @e[type=armor_stand,tag=respawn_point] as @a[distance=..10] at @r[tag=juggernaut] if entity @e[type=armor_stand,tag=arena.spawn,distance=30..] run tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random,distance=30..]

# Check if players are in chase.
execute if score #game_state var matches 11 run function juggernaut:chase/check_in_chase

execute if score #game_state var matches 11 as @a[tag=runner] at @s if entity @e[type=armor_stand,tag=replenishment.station,distance=..3] run function juggernaut:replenishment_management/calculate_replenishment_modifier
execute if score #game_state var matches 11 run function juggernaut:replenishment_management/replenishment_stations
# While juggernaut is not released, disallow all interactions with replenishment stations but allow for runners to see them.
execute if score #game_state var matches 12 as @e[type=armor_stand,tag=replenishment.station] at @s run particle minecraft:end_rod ~ ~2.5 ~ 0.2 60 0.2 0 60 force @a[tag=runner]

execute if score #game_state var matches 10 run function juggernaut:loop/display_lobby_particles

# Get the highest replenished station.
execute if score #juggernaut_customisation completable_stations matches 1 run scoreboard players set #highest_station var 0
execute if score #juggernaut_customisation completable_stations matches 1 as @e[type=armor_stand,tag=replenishment.station] run function juggernaut:replenishment_management/update_highest_station
execute if score #juggernaut_customisation completable_stations matches 1 unless entity @e[type=armor_stand,tag=highest_station] as @e[type=armor_stand,tag=replenishment.station,limit=1,sort=random] run function juggernaut:replenishment_management/set_highest_station

execute if score #juggernaut_customisation debug_mode matches 0 run function juggernaut:check_end_game

scoreboard players set #runners_left var 0
execute as @a[tag=runner] run scoreboard players add #runners_left var 1

# Runner Kits
execute if entity @a[tag=guide] run function juggernaut:loop/kits_loop/guide
execute if entity @a[tag=escapist] run function juggernaut:loop/kits_loop/escapist
execute if entity @a[tag=rogue] run function juggernaut:loop/kits_loop/rogue
execute if entity @a[tag=medic] run function juggernaut:loop/kits_loop/medic
execute if entity @a[tag=scout] run function juggernaut:loop/kits_loop/scout
execute if entity @a[tag=survivor] run function juggernaut:loop/kits_loop/survivor
execute if entity @a[tag=jug_ghost] run function juggernaut:loop/kits_loop/ghost
execute if entity @a[tag=cloak] run function juggernaut:loop/kits_loop/cloak
execute if entity @a[tag=engineer] run function juggernaut:loop/kits_loop/engineer
execute if entity @a[tag=trickster] run function juggernaut:loop/kits_loop/trickster
execute if entity @a[tag=harbinger] run function juggernaut:loop/kits_loop/harbinger

# Juggernaut Kits
execute if entity @a[tag=classic_jug] run function juggernaut:loop/kits_loop/classic_jug
execute if entity @a[tag=dragon] run function juggernaut:loop/kits_loop/dragon
execute if entity @a[tag=eclipse_stalker] run function juggernaut:loop/kits_loop/eclipse_stalker
execute if entity @a[tag=jug_hunter] run function juggernaut:loop/kits_loop/hunter
execute if entity @a[tag=warlock] run function juggernaut:loop/kits_loop/warlock
execute if entity @a[tag=predator] run function juggernaut:loop/kits_loop/predator
execute if entity @a[tag=chain_hunter] run function juggernaut:loop/kits_loop/chain_hunter
execute if entity @a[tag=spirit_walker] run function juggernaut:loop/kits_loop/spirit_walker
execute if entity @a[tag=witch_doctor] run function juggernaut:loop/kits_loop/witch_doctor

execute if entity @a[tag=using_beacon_of_hope] run function juggernaut:ability_management/check_ability {\
    player_tag:"using_beacon_of_hope",\
    item_id:"minecraft:beacon",\
    item_name:{"text": "Beacon of Hope","color": "aqua"},\
    ability_id:"beacon_of_hope",\
    cooldown:999999,\
    hotbar_slot:"hotbar.8",\
    cooldown_var:"beacon_of_hope_cooldown",\
}

# Loop per second function.
scoreboard players add #tick_counter var 1
execute if score #tick_counter var >= #20 var run function juggernaut:loop/second
execute if score #tick_counter var = #20 var run function juggernaut:loop/half_second
execute if score #tick_counter var = #10 var run function juggernaut:loop/half_second
execute if score #tick_counter var >= #20 var run scoreboard players set #tick_counter var 0

# Set healing needed
execute as @a[tag=runner] run function juggernaut:healing/set_healing_needed

# Healing mechanic
execute as @a[tag=runner,scores={is_sneaking=0,is_sprinting=0}] at @s if entity @a[tag=runner,distance=..1.5] run function juggernaut:healing/check_heal_player

# Self-heal
execute as @a[tag=runner,scores={is_sneaking=1}] at @s if score @s health < @s max_health run function juggernaut:healing/check_self_heal

# Hemorrhaged Mechanic
execute if entity @a[tag=is_hemorrhaged] as @a[tag=is_hemorrhaged,tag=!is_being_healed,tag=!self_healing] at @s run function juggernaut:healing/force_unheal_player {amount:1}

# Mangled Mechanic
execute if entity @a[tag=is_mangled] as @a[tag=is_mangled,tag=is_being_healed,tag=!self_healing] at @s run function juggernaut:healing/force_unheal_player {amount:4}
execute if entity @a[tag=is_mangled] as @a[tag=is_mangled,tag=is_being_healed,tag=self_healing] at @s run function juggernaut:healing/force_unheal_player {amount:1}

# Remove tags to keep all data current
execute if entity @a[tag=runner,tag=is_healing] as @a[tag=runner,tag=is_healing] run tag @s remove is_healing
execute if entity @a[tag=runner,tag=is_healing] as @a[tag=runner,tag=self_healing] run tag @s remove self_healing
execute if entity @a[tag=runner,tag=is_healing] as @a[tag=runner,tag=is_being_healed] run tag @s remove is_being_healed

scoreboard players set @a[scores={is_sneaking=1..}] is_sneaking 0
