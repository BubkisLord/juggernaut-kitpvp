# Main Loop
execute at @e[type=armor_stand,tag=respawn_point] if entity @a[distance=..10] as @a[distance=..10] run tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]

# If only one player is alive, wait 15 seconds and then end the game
# Calculate players left.
scoreboard players set #surv_players_alive var 0
execute as @a[scores={lives_remaining=1..}] run scoreboard players add #surv_players_alive var 1
# If only one player is alive, and time is up then end game.
execute if score #end_game_timer var < #0 var run function jug_pvp:end_game

execute as @a[nbt={Inventory:[{id:"minecraft:red_glazed_terracotta"}]}] at @s anchored eyes run summon fireball ^-0.2 ^ ^1 {Tags:["kill_on_end_game"],ExplosionPower:4}
execute as @a[nbt={Inventory:[{id:"minecraft:red_glazed_terracotta"}]}] at @s run clear @s red_glazed_terracotta

# Spawn Crates
execute if score #crate_count var < #max_crate_count var run summon armor_stand 0 100 0 {Tags:["crate","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true,CustomName:{"text": "Survival Crate","bold": true},CustomNameVisible:true}
execute positioned 0 100 0 as @e[type=armor_stand,tag=crate,distance=..3] if score #crate_count var < #max_crate_count var run spreadplayers ~ ~ 30 60 under 200 false @s
scoreboard players set #crate_count var 0
execute as @e[type=armor_stand,tag=crate] run scoreboard players add #crate_count var 1

# Allow Crates to be opened
execute as @e[type=armor_stand,tag=crate] at @s if entity @a[distance=..3,tag=!spectator] run particle totem_of_undying ~ ~ ~ 0.3 0.3 0.3 0 10 force @a[distance=..3]
# Open after 3 seconds
execute as @e[type=armor_stand,tag=crate,scores={var=3..}] at @s run loot give @p[distance=..3,tag=!spectator] loot survival:crate
execute as @e[type=armor_stand,tag=crate,scores={var=3..}] at @s run playsound block.note_block.cow_bell master @a[distance=..3] ~ ~ ~ 1 1
execute as @e[type=armor_stand,tag=crate,scores={var=3..}] at @s run playsound entity.item.pickup master @a[distance=..3] ~ ~ ~ 1 1
execute as @e[type=armor_stand,tag=crate,scores={var=3..}] run kill @s

execute if entity @a[tag=classic_jug] run function juggernaut:loop/kits_loop/classic_jug
execute if entity @a[tag=dragon] run function juggernaut:loop/kits_loop/dragon
execute if entity @a[tag=jug_hunter] run function juggernaut:loop/kits_loop/hunter
execute if entity @a[tag=warlock] run function juggernaut:loop/kits_loop/warlock
execute if entity @a[tag=predator] run function juggernaut:loop/kits_loop/predator
execute if entity @a[tag=chain_hunter] run function juggernaut:loop/kits_loop/chain_hunter
execute if entity @a[tag=spirit_walker] run function juggernaut:loop/kits_loop/spirit_walker
execute if entity @a[tag=witch_doctor] run function juggernaut:loop/kits_loop/witch_doctor
execute if entity @a[tag=timekeeper] run function juggernaut:loop/kits_loop/timekeeper
execute if entity @a[tag=chameleon] run function juggernaut:loop/kits_loop/chameleon
execute if entity @a[tag=fishmonger] run function juggernaut:loop/kits_loop/fishmonger
execute if entity @a[tag=jug_knight] run function juggernaut:loop/kits_loop/knight

scoreboard players set @a[scores={is_sneaking=1..}] is_sneaking 0


# Enable loop per second function
execute as @e[type=armor_stand,tag=surv_game_manager] run scoreboard players add @s tick_counter 1
execute as @e[type=armor_stand,tag=surv_game_manager,scores={tick_counter=20..}] run function jug_pvp:loop/second
execute as @e[type=armor_stand,tag=surv_game_manager,scores={tick_counter=20..}] run scoreboard players set @s tick_counter 0

execute as @a[tag=spectator] at @s run function survival:loop/clone_inventory