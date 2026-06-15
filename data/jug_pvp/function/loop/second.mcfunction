# Make Crates be able to be opened
execute as @e[type=armor_stand,tag=crate] at @s unless entity @a[distance=..3,tag=!spectator] run particle dust_color_transition{from_color:[0.3,0.2,0.2],to_color:[0.9,0.9,0.9],scale:1} ~ ~-0.25 ~ 0.3 0.3 0.3 0 300 force @a[distance=..16]
execute as @e[type=armor_stand,tag=crate] at @s if entity @a[distance=..3,tag=!spectator] run scoreboard players add @s var 1

execute if score #juggernaut_pvp_setup_worldborder var matches 0 run function juggernaut_pvp:setup_worldborder

# Decrease Grace Period
execute if score #grace_period var > #0 var run title @a actionbar [{"text": "Grace Period: ","bold": true},{"score":{"name":"#grace_period","objective":"var"},"bold": true},{"text": " seconds"}]
execute if score #grace_period var > #0 var run scoreboard players remove #grace_period var 1
execute if score #grace_period var = #0 var run effect clear @a resistance
execute if score #grace_period var = #0 var run effect clear @a weakness

# Make the worldborder close faster the more replenishments have occurred. Additionally, limit the minimum space to 5 block radius.
execute store result score #worldborder_size var run worldborder get

execute if score #worldborder_size var matches 11.. if score #times_replenished var = #0 var if score #grace_period var <= #0 var run worldborder add -1 1s
execute if score #worldborder_size var matches 11.. if score #times_replenished var = #1 var if score #grace_period var <= #0 var run worldborder add -1.5 1s
execute if score #worldborder_size var matches 11.. if score #times_replenished var = #2 var if score #grace_period var <= #0 var run worldborder add -1.75 1s
execute if score #worldborder_size var matches 11.. if score #times_replenished var >= #3 var if score #grace_period var <= #0 var run worldborder add -2.25 1s

# Check World Border
execute if score #worldborder_size var matches 150..300 run function survival:loop/check_worldborder {distance:300}
execute if score #worldborder_size var matches 280..300 run function survival:loop/check_worldborder {distance:300}
execute if score #worldborder_size var matches 260..279 run function survival:loop/check_worldborder {distance:279}
execute if score #worldborder_size var matches 240..259 run function survival:loop/check_worldborder {distance:259}
execute if score #worldborder_size var matches 220..239 run function survival:loop/check_worldborder {distance:239}
execute if score #worldborder_size var matches 200..219 run function survival:loop/check_worldborder {distance:219}
execute if score #worldborder_size var matches 180..199 run function survival:loop/check_worldborder {distance:199}
execute if score #worldborder_size var matches 160..179 run function survival:loop/check_worldborder {distance:179}
execute if score #worldborder_size var matches 140..159 run function survival:loop/check_worldborder {distance:159}
execute if score #worldborder_size var matches 120..139 run function survival:loop/check_worldborder {distance:139}
execute if score #worldborder_size var matches 100..119 run function survival:loop/check_worldborder {distance:119}
execute if score #worldborder_size var matches 80..99 run function survival:loop/check_worldborder {distance:99}
execute if score #worldborder_size var matches 60..79 run function survival:loop/check_worldborder {distance:79}
execute if score #worldborder_size var matches 40..59 run function survival:loop/check_worldborder {distance:59}
execute if score #worldborder_size var matches 20..39 run function survival:loop/check_worldborder {distance:39}
execute if score #worldborder_size var matches 0..19 run function survival:loop/check_worldborder {distance:19}


execute as @a if score #game_state var matches 40..49 if score @s ability_cooldown0 > #0 var run scoreboard players remove @s ability_cooldown0 1
execute as @a unless score #game_state var matches 40..49 if score @s ability_cooldown0 > #0 var run scoreboard players set @s ability_cooldown0 0

execute as @a if score #game_state var matches 40..49 if score @s ability_cooldown1 > #0 var run scoreboard players remove @s ability_cooldown1 1
execute as @a unless score #game_state var matches 40..49 if score @s ability_cooldown1 > #0 var run scoreboard players set @s ability_cooldown1 0

execute as @a if score #game_state var matches 40..49 if score @s ability_cooldown2 > #0 var run scoreboard players remove @s ability_cooldown2 1
execute as @a unless score #game_state var matches 40..49 if score @s ability_cooldown2 > #0 var run scoreboard players set @s ability_cooldown2 0

execute as @a if score #game_state var matches 40..49 if score @s shadow_mark_cooldown > #0 var run scoreboard players remove @s shadow_mark_cooldown 1
execute as @a unless score #game_state var matches 40..49 if score @s shadow_mark_cooldown > #0 var run scoreboard players set @s shadow_mark_cooldown 0

execute as @a if score #game_state var matches 40..49 if score @s speed_pot_cooldown > #0 var run scoreboard players remove @s speed_pot_cooldown 1
execute as @a unless score #game_state var matches 40..49 if score @s speed_pot_cooldown > #0 var run scoreboard players set @s speed_pot_cooldown 0
execute as @a if score #game_state var matches 40..49 if score @s fire_pot_cooldown > #0 var run scoreboard players remove @s fire_pot_cooldown 1
execute as @a unless score #game_state var matches 40..49 if score @s fire_pot_cooldown > #0 var run scoreboard players set @s fire_pot_cooldown 0
execute as @a if score #game_state var matches 40..49 if score @s strength_pot_cooldown > #0 var run scoreboard players remove @s strength_pot_cooldown 1
execute as @a unless score #game_state var matches 40..49 if score @s strength_pot_cooldown > #0 var run scoreboard players set @s strength_pot_cooldown 0

# Hunter remnant delay
execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var > #0 var run scoreboard players remove @s var 1


execute as @a[tag=dragon] run function juggernaut:raycasts/raycast {\
    player_tag:"dragon",\
    raycast_id:"dragon_breath",\
    target_tag:"runner",\
    hit_distance:1.5,\
    raycast_limit:24,\
    move_function_id:1,\
    collides_with_blocks:1,\
}

# Update scores
scoreboard players set @a[scores={is_sprinting=1..}] is_sprinting 0
scoreboard players set @a[scores={is_walking=1..}] is_walking 0
scoreboard players set @a[scores={is_crouch_walking=1..}] is_crouch_walking 0

execute as @a[tag=chameleon] run item replace entity @s container.11 with tipped_arrow[potion_contents={custom_effects:[{id:"slowness",duration:100,amplifier:0},{id:"poison",duration:1200,amplifier:0}],custom_name:"Acid",custom_color:12713016},item_name={"text":"Acid Arrow",color:"#b5ee4a"},custom_name={"text":"Acid Arrow",color:"#b5ee4a"}] 99

# Progress seconds until end of game
scoreboard players set #surv_players_alive var 0
execute as @a[scores={lives_remaining=1..}] run scoreboard players add #surv_players_alive var 1
execute if score #surv_players_alive var matches ..1 run scoreboard players set #survival_game_ending var 1

scoreboard players set #teams_alive var 0
execute if score #game_state var matches 26 as @p[team=blue,scores={lives_remaining=1..}] run scoreboard players add #teams_alive var 1
execute if score #game_state var matches 26 as @p[team=red,scores={lives_remaining=1..}] run scoreboard players add #teams_alive var 1
execute if score #game_state var matches 26 as @p[team=green,scores={lives_remaining=1..}] run scoreboard players add #teams_alive var 1
execute if score #game_state var matches 26 as @p[team=yellow,scores={lives_remaining=1..}] run scoreboard players add #teams_alive var 1

execute if score #game_state var matches 26 if score #teams_alive var matches ..1 run scoreboard players set #survival_game_ending var 1

execute if score #survival_game_ending var matches 1 if score #end_game_timer var matches 10.. run tellraw @a [{"text": "#==== GAME OVER ====#","color": "dark_red","bold": true}]
execute if score #teams_alive var matches ..1 if score #game_state var matches 46 if score #survival_game_ending var matches 1 if score #end_game_timer var matches 10.. as @p[team=blue,scores={lives_remaining=1..}] run tellraw @a [{"text": "Team ","color": "white","bold": false},{"text":"Blue","color":"blue","bold": true},{"text": " Has Won!","color": "white","bold": false}]
execute if score #teams_alive var matches ..1 if score #game_state var matches 46 if score #survival_game_ending var matches 1 if score #end_game_timer var matches 10.. as @p[team=red,scores={lives_remaining=1..}] run tellraw @a [{"text": "Team ","color": "white","bold": false},{"text":"Red","color":"red","bold": true},{"text": " Has Won!","color": "white","bold": false}]
execute if score #teams_alive var matches ..1 if score #game_state var matches 46 if score #survival_game_ending var matches 1 if score #end_game_timer var matches 10.. as @p[team=green,scores={lives_remaining=1..}] run tellraw @a [{"text": "Team ","color": "white","bold": false},{"text":"Green","color":"green","bold": true},{"text": " Has Won!","color": "white","bold": false}]
execute if score #teams_alive var matches ..1 if score #game_state var matches 46 if score #survival_game_ending var matches 1 if score #end_game_timer var matches 10.. as @p[team=yellow,scores={lives_remaining=1..}] run tellraw @a [{"text": "Team ","color": "white","bold": false},{"text":"Yellow","color":"yellow","bold": true},{"text": " Has Won!","color": "white","bold": false}]

execute if score #game_state var matches 41 if score #survival_game_ending var matches 1 if score #end_game_timer var matches 10.. as @a[scores={lives_remaining=1..}] run tellraw @a [{"selector":"@s","color":"dark_aqua","bold": true},{"text": " Has Won!","color": "white","bold": false}]

# execute if score #survival_teams var matches 1.. if score #survival_game_ending var matches 1 if score #end_game_timer var matches 10.. as @a[scores={lives_remaining=1..}] run tellraw @a [{"text": "Team ","color": "white","bold": false},{"nbt":"team", "entity": "@s","bold": true},{"text": " Has Won!","color": "white","bold": false}]
# execute if score #survival_game_ending var matches 1 run tellraw @a [{"text": "Game Ends In: "},{"score": {"name": "#end_game_timer","objective": "var"},"bold": true},{"text": " seconds","bold": false}]
execute if score #survival_game_ending var matches 1 run scoreboard players remove #end_game_timer var 1