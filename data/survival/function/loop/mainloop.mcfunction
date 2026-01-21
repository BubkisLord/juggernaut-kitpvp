# Main Loop
execute at @e[type=armor_stand,tag=respawn_point] if entity @a[distance=..10] as @a[distance=..10] run tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]

# Enforce Grace Period
execute if score #grace_period var > #0 var run effect give @a weakness 1 255 true
execute if score #grace_period var > #0 var run effect give @a resistance 1 255 true


# If only one player is alive, wait 15 seconds and then end the game
# Calculate players left.
scoreboard players set #surv_players_alive var 0
execute as @a[scores={lives_remaining=1..}] run scoreboard players add #surv_players_alive var 1
# If only one player is alive, and time is up then end game.
execute if score #end_game_timer var < #0 var run function survival:end_game

execute as @a[nbt={Inventory:[{id:"minecraft:red_glazed_terracotta"}]}] at @s anchored eyes run summon fireball ^-0.2 ^ ^1 {Tags:["kill_on_end_game"],ExplosionPower:4}
execute as @a[nbt={Inventory:[{id:"minecraft:red_glazed_terracotta"}]}] at @s run clear @s red_glazed_terracotta

# Spawn Crates
execute if score #crate_count var < #max_crate_count var run summon armor_stand 0 100 0 {Tags:["crate","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true,CustomName:{"text": "Survival Crate","bold": true},CustomNameVisible:true}
execute positioned 0 100 0 as @e[type=armor_stand,tag=crate,distance=..3] if score #crate_count var < #max_crate_count var run spreadplayers ~ ~ 30 60 under 200 false @s
scoreboard players set #crate_count var 0
execute as @e[type=armor_stand,tag=crate] run scoreboard players add #crate_count var 1


# Indicate Chests
execute as @e[type=armor_stand,tag=survival_chest_indicator,tag=common] at @s unless block ~ ~ ~ chest{Items:[]} run particle dust{color:[0.0,0.6,0.0],scale:1} ~ ~1.3 ~ 0.1 2 0.1 0 8 force
execute as @e[type=armor_stand,tag=survival_chest_indicator,tag=uncommon] at @s unless block ~ ~ ~ chest{Items:[]} run particle dust{color:[0.4,1.0,0.4],scale:1} ~ ~1.3 ~ 0.1 2 0.1 0 8 force
execute as @e[type=armor_stand,tag=survival_chest_indicator,tag=rare] at @s unless block ~ ~ ~ chest{Items:[]} run particle dust{color:[0,1,1],scale:1} ~ ~1.3 ~ 0.1 2 0.1 0 8 force
execute as @e[type=armor_stand,tag=survival_chest_indicator,tag=legendary] at @s unless block ~ ~ ~ chest{Items:[]} run particle dust{color:[1.0,0.8,0.0],scale:1} ~ ~1.3 ~ 0.1 2 0.1 0 8 force


# Allow Crates to be opened
execute as @e[type=armor_stand,tag=crate] at @s if entity @a[distance=..3,tag=!spectator] run particle totem_of_undying ~ ~ ~ 0.3 0.3 0.3 0 10 force @a[distance=..3]
# Open after 3 seconds
execute as @e[type=armor_stand,tag=crate,scores={var=3..}] at @s run loot give @p[distance=..3,tag=!spectator] loot survival:crate
execute as @e[type=armor_stand,tag=crate,scores={var=3..}] at @s run playsound block.note_block.cow_bell master @a[distance=..3] ~ ~ ~ 1 1
execute as @e[type=armor_stand,tag=crate,scores={var=3..}] at @s run playsound entity.item.pickup master @a[distance=..3] ~ ~ ~ 1 1
execute as @e[type=armor_stand,tag=crate,scores={var=3..}] run kill @s


# Enable loop per second function
execute as @e[type=armor_stand,tag=surv_game_manager] run scoreboard players add @s tick_counter 1
execute as @e[type=armor_stand,tag=surv_game_manager,scores={tick_counter=20..}] run function survival:loop/second
execute as @e[type=armor_stand,tag=surv_game_manager,scores={tick_counter=20..}] run scoreboard players set @s tick_counter 0

execute as @a[tag=spectator] at @s run function survival:loop/clone_inventory