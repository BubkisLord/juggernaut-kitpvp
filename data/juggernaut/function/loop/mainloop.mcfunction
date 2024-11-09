scoreboard players set #0 var 0
scoreboard players set #75 var 75
scoreboard players set #33 var 33
scoreboard players set #100 var 100
scoreboard players set #10 var 10

# When runners are hit by the juggernaut (scout does not get this speed boost)
execute as @a[tag=runner,tag=!scout] at @s if entity @a[tag=juggernaut,distance=..5] if score @s damage_taken > #0 var run effect give @s speed 1 0 true
execute as @a[tag=runner] unless entity @s[tag=borrowing_time] if score @s damage_taken > #0 var run scoreboard players set @s damage_taken 0

execute at @e[tag=respawn_point] as @a[distance=..10] run tp @s @e[tag=arena.spawn,limit=1,sort=random]


execute as @e[type=armor_stand,tag=jug_spawn] at @s run tp @a[distance=..8] @e[tag=arena.spawn,limit=1,sort=random]

execute if score #game_state var matches 10 as @n[type=armor_stand,tag=runner_kit_selection_room] at @s run particle campfire_cosy_smoke ~ ~1 ~ 7 1 7 0.00001 1 force
execute if score #game_state var matches 10 as @n[type=armor_stand,tag=runner_kit_selection_room] at @s run effect give @a[distance=..30] weakness 1 255 true

execute if score #game_state var matches 11 as @n[type=armor_stand,tag=runner_kit_selection_room] at @s run tp @a[tag=has_jug_kit,tag=runner,distance=..20] @e[tag=arena.spawn,limit=1,sort=random]
execute if score #game_state var matches 11 as @n[type=armor_stand,tag=runner_kit_selection_room] at @s run tag @a[distance=..10] remove lobby.player
execute if score #game_state var matches 11 as @n[type=armor_stand,tag=runner_kit_selection_room] at @s run clear @a[tag=!has_jug_kit,distance=..10]

execute if score #game_state var matches 10 as @n[type=armor_stand,tag=juggernaut_kit_selection_room] at @s run particle ash ~ ~1 ~ 7 1 7 0.00001 5 force
execute if score #game_state var matches 10 as @n[type=armor_stand,tag=juggernaut_kit_selection_room] at @s run particle white_ash ~ ~1 ~ 7 1 7 0.00001 5 force
execute if score #game_state var matches 10 as @n[type=armor_stand,tag=juggernaut_kit_selection_room] at @s run particle crimson_spore ~ ~1 ~ 7 1 7 0.00001 5 force

execute if score #game_state var matches 10 as @n[type=armor_stand,tag=juggernaut_kit_selection_room] at @s run effect give @a[distance=..30] weakness 1 255 true

execute unless entity @a[tag=!has_jug_kit] if score #game_state var matches 10 run function juggernaut:start_juggernaut

# If there are no runners or juggernauts then the game will end.
execute if score #game_state var matches 10..19 unless entity @a[tag=juggernaut] run tellraw @a {"text": "Runners win! (Juggernaut Dead/Not Found)","bold": true}
execute if score #game_state var matches 10..19 unless entity @a[tag=juggernaut] run scoreboard players add @a[tag=runner] points 100
execute if score #game_state var matches 10..19 unless entity @a[tag=juggernaut] run function juggernaut:end_game

execute if score #game_state var matches 10..19 unless entity @a[tag=runner] run tellraw @a {"text": "Juggernaut wins! (Runners Dead/Not Found)","bold": true}
execute if score #game_state var matches 10..19 unless entity @a[tag=runner] run scoreboard players add @a[tag=juggernaut] points 100
execute if score #game_state var matches 10..19 unless entity @a[tag=runner] run function juggernaut:end_game

#The replenish progress mode for winning the game. (3 mins of continued replenishing)
execute if score #game_state var matches 10..19 if score @n[type=armor_stand,tag=juggernaut_manager] replenish_progress >= @n[type=armor_stand,tag=juggernaut_manager] total_replenishment_needed run tellraw @a {"text": "Runners win! (Replenishment Complete)","bold": true}
execute if score #game_state var matches 10..19 unless entity @a[tag=juggernaut] run scoreboard players add @a[tag=runner] points 100
execute if score #game_state var matches 10..19 if score @n[type=armor_stand,tag=juggernaut_manager] replenish_progress >= @n[type=armor_stand,tag=juggernaut_manager] total_replenishment_needed run function juggernaut:end_game

# If the 5 minutes runs out, then the game ends.
# execute if score #game_state var matches 10..19 if entity @a[tag=juggernaut,scores={juggernaut_game_time=0}] run scoreboard players add @a[tag=runner] kills 5
# execute if score #game_state var matches 10..19 if entity @a[tag=juggernaut,scores={juggernaut_game_time=0}] run function juggernaut:end_game


#Code to calculate the percentage of replenishment progress and display it...
#...never look through this code again.
scoreboard players operation @n[type=armor_stand,tag=juggernaut_manager] temp_progress = @n[type=armor_stand,tag=juggernaut_manager] replenish_progress
scoreboard players operation @n[type=armor_stand,tag=juggernaut_manager] temp_progress *= #100 var

scoreboard players operation @n[type=armor_stand,tag=juggernaut_manager] temp_max_progress = @n[type=armor_stand,tag=juggernaut_manager] total_replenishment_needed
scoreboard players operation @n[type=armor_stand,tag=juggernaut_manager] temp_max_progress *= #100 var

execute store result score @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal run scoreboard players operation @n[type=armor_stand,tag=juggernaut_manager] temp_progress /= @n[type=armor_stand,tag=juggernaut_manager] total_replenishment_needed

execute if score #game_state var matches 11 if score @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal <= #33 var if entity @n[type=armor_stand,tag=juggernaut_manager] run title @a actionbar [{"text":"Replenishment Percentage: ","color": "dark_green","bold": true},{"score":{"name":"@n[type=armor_stand,tag=juggernaut_manager]","objective":"replenish_decimal"},"bold": true,"color": "dark_green"},{"text": "%"}]

execute if score #game_state var matches 11 if score @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal > #33 var if score @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal <= #75 var if entity @n[type=armor_stand,tag=juggernaut_manager] run title @a actionbar [{"text":"Replenishment Percentage: ","color": "gold","bold": true},{"score":{"name":"@n[type=armor_stand,tag=juggernaut_manager]","objective":"replenish_decimal"},"bold": true,"color": "gold"},{"text": "%"}]

execute if score #game_state var matches 11 if score @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal > #75 var if entity @n[type=armor_stand,tag=juggernaut_manager] run title @a actionbar [{"text":"Replenishment Percentage: ","color": "dark_red","bold": true},{"score":{"name":"@n[type=armor_stand,tag=juggernaut_manager]","objective":"replenish_decimal"},"bold": true,"color": "dark_red"},{"text": "%"}]


#Jug Kits
# Blinker
execute as @a[tag=blinker,scores={tick_counter=60..}] run effect give @s invisibility 1 0 true
execute as @a[tag=blinker,scores={tick_counter=60..}] run scoreboard players set @s tick_counter 0
execute as @a[tag=blinker] run scoreboard players add @s tick_counter 1

execute as @a[tag=blinker,scores={jug_kit_cooldown=0}] if items entity @s hotbar.2 barrier[item_name='[{"text": "Teleport to Remnant | ","color": "dark_red","bold": true},{"text": "ON COOLDOWN","color": "red"}]'] run item replace entity @s hotbar.2 with ender_pearl[item_name='[{"text": "Teleport to Remnant | ","color": "dark_red","bold": true},{"text": "READY","color": "green"}]',food={nutrition:0,saturation:0,can_always_eat:true,eat_seconds:999999}] 1
execute as @a[tag=blinker] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:ender_pearl"}},distance=..3] run item replace entity @s hotbar.2 with barrier[item_name='[{"text": "Teleport to Remnant | ","color": "dark_red","bold": true},{"text": "ON COOLDOWN","color": "red"}]'] 1
execute as @a[tag=blinker] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:ender_pearl"}},distance=..3] run tp @s @n[tag=blinker_teleporting]
execute as @a[tag=blinker,nbt={SelectedItem:{id:"minecraft:barrier"}}] run scoreboard players add @s blinker_tp_timeout 1
execute as @a[tag=blinker] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:ender_pearl"}},distance=..3] run scoreboard players set @s jug_kit_cooldown 45
execute as @a[tag=blinker] at @s as @e[type=item,nbt={Item:{id:"minecraft:ender_pearl"}},distance=..3] run kill @s

execute as @a[tag=blinker] at @s unless entity @e[type=armor_stand,tag=blinker_radar] run summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,CustomNameVisible:false,NoGravity:true,Small:true,Tags:["blinker_radar"]}

execute as @a[tag=blinker] at @s if entity @e[type=armor_stand,tag=blinker_remnant,sort=random,limit=1] unless entity @e[type=armor_stand,tag=blinker_teleporting] run tp @n[type=armor_stand,tag=blinker_radar] ~ ~ ~ facing entity @e[type=armor_stand,tag=blinker_remnant,sort=random,limit=1]

execute as @a[tag=blinker] at @s if entity @e[type=armor_stand,tag=blinker_remnant,sort=random,limit=1] if entity @e[type=armor_stand,tag=blinker_teleporting] run tp @n[type=armor_stand,tag=blinker_radar] ~ ~ ~ facing entity @n[type=armor_stand,tag=blinker_teleporting]

execute as @a[tag=blinker] at @s unless entity @e[type=armor_stand,tag=blinker_remnant,sort=random,limit=1] run tp @n[type=armor_stand,tag=blinker_radar] ~ ~ ~ facing ~ ~-1 ~

execute as @e[type=armor_stand,tag=blinker_radar] at @s anchored eyes run particle dust{color:[100,0,0],scale:1} ^ ^ ^1 0.1 0.1 0.1 0 2 force @a[tag=blinker]
execute as @e[type=armor_stand,tag=blinker_radar] at @s anchored eyes run particle dust{color:[0,100,0],scale:1} ^ ^ ^1 0.1 0.1 0.1 0 2 force @a[tag=blinker]

execute as @a[tag=blinker,scores={jug_kit_cooldown_2=0}] at @s run summon armor_stand ~ ~ ~ {Invulnerable:true,CustomNameVisible:false,NoGravity:true,Tags:["blinker_remnant","kill_on_end_game"]}

execute as @a[tag=blinker,scores={jug_kit_cooldown_2=0}] run scoreboard players set @s jug_kit_cooldown_2 30
execute as @a[tag=blinker] run scoreboard players set @s max_blinker_cooldown 30
execute as @a[tag=blinker] run execute store result score @s blinker_cooldown_percent run scoreboard players get @s jug_kit_cooldown_2
execute as @a[tag=blinker] run scoreboard players operation @s blinker_cooldown_percent *= #100 var
execute as @a[tag=blinker] run scoreboard players operation @s blinker_cooldown_percent /= @s max_blinker_cooldown
execute as @a[tag=blinker,scores={blinker_cooldown_percent=0}] run title @s actionbar [{"text":"||||||||||","color": "white","bold": true}]
execute as @a[tag=blinker,scores={blinker_cooldown_percent=91..100}] run title @s actionbar [{"text":"|","color": "dark_red","bold": true},{"text":"|||||||||","color": "white","bold": true}]
execute as @a[tag=blinker,scores={blinker_cooldown_percent=81..90}] run title @s actionbar [{"text":"||","color": "dark_red","bold": true},{"text":"||||||||","color": "white","bold": true}]
execute as @a[tag=blinker,scores={blinker_cooldown_percent=71..80}] run title @s actionbar [{"text":"|||","color": "dark_red","bold": true},{"text":"|||||||","color": "white","bold": true}]
execute as @a[tag=blinker,scores={blinker_cooldown_percent=61..70}] run title @s actionbar [{"text":"||||","color": "dark_red","bold": true},{"text":"||||||","color": "white","bold": true}]
execute as @a[tag=blinker,scores={blinker_cooldown_percent=51..60}] run title @s actionbar [{"text":"|||||","color": "dark_red","bold": true},{"text":"|||||","color": "white","bold": true}]
execute as @a[tag=blinker,scores={blinker_cooldown_percent=41..50}] run title @s actionbar [{"text":"||||||","color": "dark_red","bold": true},{"text":"||||","color": "white","bold": true}]
execute as @a[tag=blinker,scores={blinker_cooldown_percent=31..40}] run title @s actionbar [{"text":"|||||||","color": "dark_red","bold": true},{"text":"|||","color": "white","bold": true}]
execute as @a[tag=blinker,scores={blinker_cooldown_percent=21..30}] run title @s actionbar [{"text":"||||||||","color": "dark_red","bold": true},{"text":"||","color": "white","bold": true}]
execute as @a[tag=blinker,scores={blinker_cooldown_percent=11..20}] run title @s actionbar [{"text":"|||||||||","color": "dark_red","bold": true},{"text":"|","color": "white","bold": true}]
execute as @a[tag=blinker,scores={blinker_cooldown_percent=1..10}] run title @s actionbar [{"text":"||||||||||","color": "dark_red","bold": true}]


# Dragon
execute as @a[tag=dragon] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:feather"}},distance=..3] run tag @s remove is_floating
execute as @a[tag=dragon] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:feather"}},distance=..3] run item replace entity @s hotbar.0 with phantom_membrane[item_name='{"text": "Flight","bold": true,"color": "green"}']
execute as @a[tag=dragon] at @s as @e[type=item,nbt={Item:{id:"minecraft:feather"}},distance=..3] run kill @s
execute as @a[tag=dragon] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"}},distance=..3] run tag @s add is_floating
execute as @a[tag=dragon] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"}},distance=..3] run item replace entity @s hotbar.0 with feather[item_name='{"text": "Walk","bold": true,"color": "dark_green"}']
execute as @a[tag=dragon] at @s as @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"}},distance=..3] run kill @s

execute as @a[tag=dragon] if entity @s[tag=is_floating] at @s run function juggernaut:raycasts/raycast {\
    player_tag:"dragon",\
    raycast_tag:"dragon_breath_raycast",\
    target_tag:"runner",\
    hit_distance:1.5,\
    raycast_limit:20,\
    move_function_id:1,\
    hit_function_id:1,\
    collides_with_blocks:1,\
}
execute as @a[tag=dragon] if entity @s[tag=!is_floating] at @s run function juggernaut:raycasts/raycast {\
    player_tag:"dragon",\
    raycast_tag:"dragon_breath_raycast",\
    target_tag:"runner",\
    hit_distance:1.5,\
    raycast_limit:5,\
    move_function_id:1,\
    hit_function_id:1,\
    collides_with_blocks:1,\
}

execute as @a[tag=dragon] if entity @s[tag=is_floating] at @s unless block ~ ~-5 ~ air run effect give @s levitation 1 0 true
execute as @a[tag=dragon] if entity @s[tag=is_floating] at @s run effect give @s slow_falling 1 255 true

# jug_hunter functionality
execute at @a[tag=jug_hunter] as @e[type=item,nbt={Item:{id:"minecraft:target"}},distance=..3] if score #game_state var matches 11 run tag @p[tag=runner,distance=..12] add has_hunters_mark

# If successful
execute if score #game_state var matches 11 as @a[tag=jug_hunter] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:target"}},distance=..3] if entity @p[tag=runner,distance=..12,tag=has_hunters_mark] run item replace entity @s hotbar.2 with minecraft:barrier[item_name='[{"text": "Pursue Prey | ","color": "dark_red"},{"text": "ON COOLDOWN","color": "red"}]']
execute if score #game_state var matches 11 as @a[tag=jug_hunter] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:target"}},distance=..3] if entity @p[tag=runner,distance=..12,tag=has_hunters_mark] run scoreboard players set @s jug_kit_cooldown 40
execute if score #game_state var matches 11 at @a[tag=jug_hunter] as @e[type=item,nbt={Item:{id:"minecraft:target"}},distance=..3] if entity @p[tag=runner,distance=..12,tag=has_hunters_mark] run kill @s
# If failure
execute as @a[tag=jug_hunter] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:target"}},distance=..3] unless entity @p[tag=runner,distance=..12,tag=has_hunters_mark] run scoreboard players set @s jug_kit_cooldown 8
execute as @a[tag=jug_hunter] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:target"}},distance=..3] unless entity @p[tag=runner,distance=..12,tag=has_hunters_mark] run item replace entity @s hotbar.2 with minecraft:barrier[item_name='[{"text": "Mark Prey | ","color": "dark_red"},{"text": "ON COOLDOWN","color": "red"}]']
execute at @a[tag=jug_hunter] as @e[type=item,nbt={Item:{id:"minecraft:target"}},distance=..3] unless entity @p[tag=runner,distance=..12,tag=has_hunters_mark] run particle angry_villager ~ ~0.5 ~ 1 1 1 0 80 force
execute if score #game_state var matches 11 at @a[tag=jug_hunter] as @e[type=item,nbt={Item:{id:"minecraft:target"}},distance=..3] unless entity @p[tag=runner,distance=..12,tag=has_hunters_mark] run kill @s
# If in pregame
execute as @a[tag=jug_hunter] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:target"}},distance=..3] if score #game_state var matches 10 run scoreboard players set @s jug_kit_cooldown 8
execute as @a[tag=jug_hunter] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:target"}},distance=..3] if score #game_state var matches 10 run item replace entity @s hotbar.2 with minecraft:barrier[item_name='[{"text": "Mark Prey | ","color": "dark_red"},{"text": "ON COOLDOWN","color": "red"}]']
execute at @a[tag=jug_hunter] as @e[type=item,nbt={Item:{id:"minecraft:target"}},distance=..3] if score #game_state var matches 10 run particle angry_villager ~ ~0.5 ~ 1 1 1 0 80 force
execute at @a[tag=jug_hunter] as @e[type=item,nbt={Item:{id:"minecraft:target"}},distance=..3] if score #game_state var matches 10 run kill @s


execute as @a[tag=jug_hunter,scores={jug_kit_cooldown=0}] if items entity @s hotbar.2 barrier[item_name='[{"text": "Pursue Prey | ","color": "dark_red"},{"text": "ON COOLDOWN","color": "red"}]'] run item replace entity @s hotbar.2 with wooden_sword[item_name='[{"text": "Pursue Prey | ","color": "dark_red"},{"text": "READY","color": "green"}]',custom_model_data=2] 1
execute at @a[tag=jug_hunter] if entity @e[type=item,nbt={Item:{id:"minecraft:wooden_sword"}},distance=..3] if entity @a[tag=has_hunters_mark,limit=1,sort=nearest] as @a[tag=has_hunters_mark,limit=1,sort=nearest] at @s run summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,NoGravity:true,CustomNameVisible:false,Tags:[hunter_remnant]}
execute if entity @a[tag=has_hunters_mark,limit=1,sort=nearest] as @e[type=armor_stand,tag=hunter_remnant] at @s run particle flame ~ ~1 ~ 0.25 0.25 0.25 0 8
execute if entity @a[tag=has_hunters_mark,limit=1,sort=nearest] as @a[tag=jug_hunter] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:wooden_sword"}},distance=..3] run execute as @e[type=armor_stand,tag=hunter_remnant] run scoreboard players set @s var 3
execute if entity @a[tag=has_hunters_mark,limit=1,sort=nearest] as @a[tag=jug_hunter] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:wooden_sword"}},distance=..3] run tag @s add is_hunting
execute if entity @a[tag=has_hunters_mark,limit=1,sort=nearest] as @a[tag=jug_hunter] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:wooden_sword"}},distance=..3] run item replace entity @s hotbar.2 with barrier[item_name='[{"text": "Mark Prey | ","color": "dark_red"},{"text": "ON COOLDOWN","color": "red"}]']
execute if entity @a[tag=has_hunters_mark,limit=1,sort=nearest] as @a[tag=jug_hunter] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:wooden_sword"}},distance=..3] run scoreboard players set @s jug_kit_cooldown 40
execute if entity @a[tag=has_hunters_mark,limit=1,sort=nearest] at @a[tag=jug_hunter] as @e[type=item,nbt={Item:{id:"minecraft:wooden_sword"}},distance=..3] run kill @s

execute as @a[tag=jug_hunter,tag=is_hunting] at @s run particle witch ~ ~0.5 ~ 1 1 1 0.00001 3 force

execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run tp @r[tag=jug_hunter,tag=is_hunting] @s

execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run tag @a[tag=jug_hunter,tag=is_hunting] remove is_hunting
execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run tag @a[tag=has_hunters_mark] remove has_hunters_mark
execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run execute as @a[tag=jug_hunter,tag=is_hunting] at @s run particle campfire_cosy_smoke ~ ~0.5 ~ 1 1 1 0.00001 100 force
execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run execute as @a[tag=jug_hunter,tag=is_hunting] at @s run playsound entity.enderman.teleport master @a[distance=..20] ~ ~ ~
execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run kill @s

execute as @a[tag=jug_hunter,scores={jug_kit_cooldown=0}] if items entity @s hotbar.2 barrier[item_name='[{"text": "Mark Prey | ","color": "dark_red"},{"text": "ON COOLDOWN","color": "red"}]'] run item replace entity @s hotbar.2 with target[item_name='[{"text": "Mark Prey | ","color": "dark_red"},{"text": "READY","color": "green"}]'] 1

execute as @a[tag=has_hunters_mark,scores={has_respawn_time=0}] at @s run particle minecraft:trial_spawner_detection_ominous ~ ~-0.5 ~ 1.5 1.5 1.5 0.0001 4 force @a[tag=has_hunters_mark]
execute as @a[tag=has_hunters_mark,scores={has_respawn_time=0}] at @s run particle minecraft:trial_spawner_detection ~ ~-0.5 ~ 1 1.5 1 0 4 force @a[tag=jug_hunter]
# execute as @a[tag=has_hunters_mark] run playsound minecraft:entity.arrow.hit_player player @s ~ ~ ~ 1 1 1
execute as @a[tag=jug_hunter,nbt={SelectedItem:{id:"minecraft:wooden_sword"}}] if items entity @s weapon.mainhand minecraft:wooden_sword run effect give @s weakness 1 255 true
execute as @e[type=arrow,nbt={inGround:true},tag=hunter_arrow] run tag @s remove hunter_arrow


# Lightning rod
execute as @e[type=item,nbt={Item:{id:"minecraft:lightning_rod"}}] run execute as @r[tag=runner] run effect give @s glowing 4 0 true
execute as @e[type=item,nbt={Item:{id:"minecraft:lightning_rod"}}] run kill @s

# Predator Functionality

execute if entity @a[tag=predator] run effect give @a[tag=runner] darkness infinite 0 true
execute as @a[tag=predator] at @s unless entity @s[scores={sneak_time=1}] run particle white_ash ~ ~0.5 ~ 3 3 3 0.0001 30 force @a[tag=!predator]
execute as @a[tag=predator] at @s unless entity @s[scores={sneak_time=1}] run particle ash ~ ~1 ~ 0.25 0.5 0.25 0.0001 100 force @a[tag=!predator]
# execute as @a[tag=predator] at @s if entity @s[scores={sneak_time=1}] run effect give @s speed 1 0 true
scoreboard players set @a[scores={sneak_time=1..}] sneak_time 0
# execute at @a[tag=predator] as @a[tag=runner,distance=..4] if score #game_state var matches 11 var run effect give @s blindness 4 3 true

# Warlock Functionality
execute as @e[type=armor_stand,tag=juggernaut_manager] run execute if score #game_state var matches 11 if score @s malevolent_aura_cooldown = #0 var run item replace entity @a[tag=warlock] hotbar.1 with red_dye[item_name='[{"text": "Spawn Malevolent Aura","color": "dark_red","bold": true},{"text": " | "},{"text": "READY","color": "green"}]']
execute as @e[type=armor_stand,tag=juggernaut_manager] run execute if score #game_state var matches 11 if score @s malevolent_aura_cooldown > #0 var run item replace entity @a[tag=warlock] hotbar.1 with barrier[item_name='[{"text": "Spawn Malevolent Aura","color": "dark_red","bold": true},{"text": " | "},{"text": "ON COOLDOWN","color": "red"}]']

execute as @e[type=armor_stand,tag=juggernaut_manager] run execute if score #game_state var matches 11 if score @s banishment_glyph_cooldown = #0 var run item replace entity @a[tag=warlock] hotbar.2 with cyan_dye[item_name='[{"text": "Spawn Banishment Glyph","color": "dark_aqua","bold": true},{"text": " | "},{"text": "READY","color": "green"}]']
execute as @e[type=armor_stand,tag=juggernaut_manager] run execute if score #game_state var matches 11 if score @s banishment_glyph_cooldown > #0 var run item replace entity @a[tag=warlock] hotbar.2 with barrier[item_name='[{"text": "Spawn Banishment Glyph","color": "dark_aqua","bold": true},{"text": " | "},{"text": "ON COOLDOWN","color": "red"}]']

execute as @e[type=armor_stand,tag=juggernaut_manager] run execute if score #game_state var matches 11 if score @s withering_surge_cooldown = #0 var run item replace entity @a[tag=warlock] hotbar.3 with black_dye[item_name='[{"text": "Spawn Withering Surge","color": "dark_gray","bold": true},{"text": " | "},{"text": "READY","color": "green"}]']
execute as @e[type=armor_stand,tag=juggernaut_manager] run execute if score #game_state var matches 11 if score @s withering_surge_cooldown > #0 var run item replace entity @a[tag=warlock] hotbar.3 with barrier[item_name='[{"text": "Spawn Withering Surge","color": "dark_gray","bold": true},{"text": " | "},{"text": "ON COOLDOWN","color": "red"}]']

#Spawning warlock auras
execute at @a[tag=warlock] run execute as @e[type=item,nbt={Item:{id:"minecraft:red_dye"}},distance=..3] run kill @e[type=armor_stand,tag=malevolent_aura]
execute at @a[tag=warlock] run execute as @e[type=item,nbt={Item:{id:"minecraft:red_dye"}},distance=..3] run function juggernaut:spawn/spawn_malevolent_aura

execute at @a[tag=warlock] run execute as @e[type=item,nbt={Item:{id:"minecraft:cyan_dye"}},distance=..3] run kill @e[type=armor_stand,tag=banishment_glyph]
execute at @a[tag=warlock] run execute as @e[type=item,nbt={Item:{id:"minecraft:cyan_dye"}},distance=..3] unless entity @e[type=armor_stand,tag=banishment_glyph] run function juggernaut:spawn/spawn_banishment_glyph

execute at @a[tag=warlock] run execute as @e[type=item,nbt={Item:{id:"minecraft:black_dye"}},distance=..3] run kill @e[type=armor_stand,tag=withering_surge]
execute at @a[tag=warlock] run execute as @e[type=item,nbt={Item:{id:"minecraft:black_dye"}},distance=..3] unless entity @e[type=armor_stand,tag=withering_surge] run function juggernaut:spawn/spawn_withering_surge

#Particle effects
execute at @e[type=armor_stand,tag=malevolent_aura] run particle dripping_lava ~ ~ ~ 16 8 16 0.00001 20 force @a[distance=..16]
# execute as @e[type=armor_stand,tag=malevolent_aura] at @s run function juggernaut:malevolent_sphere_recursive
execute at @e[type=armor_stand,tag=banishment_glyph] run particle dripping_water ~ ~ ~ 16 8 16 0 20 force @a[distance=..16]
# execute as @e[type=armor_stand,tag=banishment_glyph] at @s run function juggernaut:banishment_sphere_recursive
execute at @e[type=armor_stand,tag=withering_surge] run particle large_smoke ~ ~ ~ 16 8 16 0.00001 10 force @a[distance=..14]
# execute as @e[type=armor_stand,tag=withering_surge] at @s run function juggernaut:withering_sphere_recursive

execute at @e[type=armor_stand,tag=warlock_armor_stand] if entity @a[tag=runner,distance=..3] run particle totem_of_undying ~ ~0.75 ~ 0.25 0.5 0.25 0 10 force

#Sound effects
execute at @e[tag=warlock_armor_stand] as @a[distance=..16] run function abilities:aura_sound

#Warlock aura effects
#Malevolent Aura
execute at @e[type=armor_stand,tag=malevolent_aura] run execute as @a[tag=juggernaut,distance=..16] run effect give @s strength 1 0 true
execute at @e[type=armor_stand,tag=malevolent_aura] run execute as @a[tag=runner,distance=..16] run effect give @s slowness 1 0 true
execute at @e[type=armor_stand,tag=malevolent_aura] run execute as @a[tag=runner,distance=..16] run effect give @s poison 2 0 true
execute at @e[type=armor_stand,tag=malevolent_aura] run execute as @a[tag=juggernaut,distance=..16] run effect give @s speed 1 0 true
#Withering Surge
execute at @e[type=armor_stand,tag=withering_surge] run execute as @a[tag=runner,distance=..14] run effect give @s wither 2 0 true

#Display the progress of dispelling on each armor stand
execute as @e[type=armor_stand,tag=warlock_armor_stand] run scoreboard players operation @s temp_progress = @s dispel_progress
execute as @e[type=armor_stand,tag=warlock_armor_stand] run scoreboard players operation @s temp_progress *= #100 var

execute as @e[type=armor_stand,tag=warlock_armor_stand] run scoreboard players operation @s temp_max_progress = @s total_dispelling_needed
execute as @e[type=armor_stand,tag=warlock_armor_stand] run scoreboard players operation @s temp_max_progress *= #100 var

execute as @e[type=armor_stand,tag=warlock_armor_stand] run execute store result score @s replenish_decimal run scoreboard players operation @s temp_progress /= @s total_dispelling_needed

bossbar set warlock:malevolent_aura max 100
bossbar set warlock:banishment_glyph max 100
bossbar set warlock:withering_surge max 100

execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=malevolent_aura] store result bossbar warlock:malevolent_aura value run scoreboard players get @s temp_progress
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=banishment_glyph] store result bossbar warlock:banishment_glyph value run scoreboard players get @s temp_progress
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=withering_surge] store result bossbar warlock:withering_surge value run scoreboard players get @s temp_progress

execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=malevolent_aura] at @s run bossbar set warlock:malevolent_aura visible true
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=banishment_glyph] at @s run bossbar set warlock:banishment_glyph visible true
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=withering_surge] at @s run bossbar set warlock:withering_surge visible true

execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=malevolent_aura] at @s run tag @a[distance=..16] add see_malevolent_aura_bar
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=malevolent_aura] at @s run tag @a[tag=warlock] add see_malevolent_aura_bar
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=malevolent_aura] at @s run tag @a[distance=17..,tag=!warlock] remove see_malevolent_aura_bar
execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=malevolent_aura] run tag @a remove see_malevolent_aura_bar

execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=banishment_glyph] at @s run tag @a[distance=..16] add see_banishment_glyph_bar
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=banishment_glyph] at @s run tag @a[tag=warlock] add see_banishment_glyph_bar
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=banishment_glyph] at @s run tag @a[distance=17..,tag=!warlock] remove see_banishment_glyph_bar
execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=banishment_glyph] run tag @a remove see_banishment_glyph_bar

execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=withering_surge] at @s run tag @a[distance=..14] add see_withering_surge_bar
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=withering_surge] at @s run tag @a[tag=warlock] add see_withering_surge_bar
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=withering_surge] at @s run tag @a[distance=15..,tag=!warlock] remove see_withering_surge_bar
execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=withering_surge] run tag @a remove see_withering_surge_bar

execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=malevolent_aura] at @s run bossbar set warlock:malevolent_aura players @a[tag=see_malevolent_aura_bar]
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=banishment_glyph] at @s run bossbar set warlock:banishment_glyph players @a[tag=see_banishment_glyph_bar]
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=withering_surge] at @s run bossbar set warlock:withering_surge players @a[tag=see_withering_surge_bar]

execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=malevolent_aura] run bossbar set warlock:malevolent_aura visible false
execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=banishment_glyph] run bossbar set warlock:banishment_glyph visible false
execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=withering_surge] run bossbar set warlock:withering_surge visible false

#Dispelling auras
execute at @e[type=armor_stand,tag=warlock_armor_stand] run execute as @a[tag=runner,distance=..3] run scoreboard players add @n[type=armor_stand,tag=warlock_armor_stand] dispel_progress 1
execute as @e[type=armor_stand,tag=warlock_armor_stand] at @s run execute if score @s dispel_progress >= @s total_dispelling_needed run playsound block.note_block.bell master @a[tag=runner,distance=..16] ~ ~ ~ 2 1.2
execute as @e[type=armor_stand,tag=warlock_armor_stand] at @s run execute if score @s dispel_progress >= @s total_dispelling_needed run playsound entity.ender_dragon.growl master @a[tag=warlock] ~ ~ ~ 3 0.2 1
execute as @e[type=armor_stand,tag=warlock_armor_stand] at @s run execute if score @s dispel_progress >= @s total_dispelling_needed run effect give @a[tag=runner,distance=..3] glowing 3 0 true
execute as @e[type=armor_stand,tag=warlock_armor_stand] at @s run execute if score @s dispel_progress >= @s total_dispelling_needed run kill @s


#Runner Kits
# Escapist passive effects
execute as @a[tag=escapist] run effect give @s speed 1 0 true
# Escapist activated ability
execute as @a[tag=escapist] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:gunpowder"}},distance=..3] run effect give @s speed 8 1 true
execute as @a[tag=escapist] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:gunpowder"}},distance=..3] run effect give @s invisibility 10 0 false
execute as @a[tag=escapist] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:gunpowder"}},distance=..3] run scoreboard players set @s jug_kit_cooldown 40
execute as @a[tag=escapist] at @s run execute as @e[type=item,nbt={Item:{id:"minecraft:gunpowder"}},distance=..3] run kill @s
execute as @a[tag=escapist,scores={jug_kit_cooldown=0}] run item replace entity @s hotbar.0 with gunpowder[item_name='[{"text": "Floo","strikethrough": true,"color": "#646464"},{"text": " Flee Powder | ","strikethrough": false,"color": "#646464"},{"text": "READY","color": "green","strikethrough": false}]'] 1
execute as @a[tag=escapist,scores={jug_kit_cooldown=0}] run scoreboard players remove @s jug_kit_cooldown 1
execute as @a[tag=escapist,scores={jug_kit_cooldown=1..}] run item replace entity @s hotbar.0 with barrier[item_name='[{"text": "Floo","strikethrough": true,"color": "#646464"},{"text": " Flee Powder | ","strikethrough": false,"color": "#646464"},{"text": "ON COOLDOWN","color": "red","strikethrough": false}]'] 1

# Medic passive effects
execute as @a[tag=medic] run effect give @a[tag=runner] regeneration 1 0 true

# If failure
execute as @a[tag=medic] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:nether_star"}},distance=..3] if entity @a[tag=juggernaut,distance=..20] run item replace entity @s hotbar.3 with minecraft:barrier[item_name='[{"text": "Rescue | ","color": "#A4D1EA"},{"text": "ON COOLDOWN","color": "red"}]']
execute as @a[tag=medic] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:nether_star"}},distance=..3] if entity @a[tag=juggernaut,distance=..20] run scoreboard players set @s jug_kit_cooldown 4
execute at @a[tag=medic] as @e[type=item,nbt={Item:{id:"minecraft:nether_star"}},distance=..3] if entity @a[tag=juggernaut,distance=..20] run particle angry_villager ~ ~0.5 ~ 1 1 1 0 80 force
execute at @a[tag=medic] as @e[type=item,nbt={Item:{id:"minecraft:nether_star"}},distance=..3] if entity @a[tag=juggernaut,distance=..20] run kill @s
# If successful
execute as @a[tag=medic] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:nether_star"}},distance=..3] unless entity @a[tag=juggernaut,distance=..20] run tag @s add teleporting
execute as @a[tag=medic] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:nether_star"}},distance=..3] unless entity @a[tag=juggernaut,distance=..20] run scoreboard players set @s jug_kit_cooldown 120
execute as @a[tag=medic] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:nether_star"}},distance=..3] unless entity @a[tag=juggernaut,distance=..20] run item replace entity @s hotbar.3 with minecraft:barrier[item_name='[{"text": "Rescue | ","color": "#A4D1EA"},{"text": "ON COOLDOWN","color": "red"}]']
execute at @a[tag=medic] as @e[type=item,nbt={Item:{id:"minecraft:nether_star"}},distance=..3] unless entity @a[tag=juggernaut,distance=..20] run kill @s

execute as @a[tag=medic,scores={jug_kit_cooldown=0}] if items entity @s hotbar.3 barrier run item replace entity @s hotbar.3 with minecraft:nether_star[item_name='[{"text": "Rescue | ","color": "#A4D1EA"},{"text": "READY","color": "green"}]']
execute as @a[tag=medic,tag=teleporting] if entity @a[tag=runner,tag=!teleporting] run tp @s @r[tag=runner,tag=!teleporting]
execute as @a[tag=medic,tag=teleporting] unless entity @a[tag=runner,tag=!teleporting] run tp @s @e[tag=arena.spawn,limit=1,sort=random]
execute as @a[tag=medic,tag=teleporting] run tag @s remove teleporting

# Make medic immune to glowing
execute as @a[tag=medic] run effect clear @s glowing

# Scout passive effect
execute as @a[tag=scout] run effect give @s jump_boost 1 1 true

execute as @a[tag=scout] run scoreboard players add @n[tag=juggernaut_manager] scout_reveal_timer 1
execute as @a[tag=juggernaut_manager,scores={scout_reveal_timer=1200..}] run effect give @a[tag=juggernaut] glowing 16 0 true
execute as @a[tag=juggernaut_manager,scores={scout_reveal_timer=1200..}] run scoreboard players set @a[tag=juggernaut_manager] scout_reveal_timer 0
# Scout activated ability
execute as @a[tag=scout] at @s as @e[type=item,nbt={Item:{id:"minecraft:glowstone_dust"}},distance=..3] run effect give @a[tag=juggernaut] glowing 12 0 true
execute as @a[tag=scout] at @s as @e[type=item,nbt={Item:{id:"minecraft:glowstone_dust"}},distance=..3] run kill @s

# Survivor effects
execute as @a[tag=survivor] run effect give @s resistance 1 1 true
execute as @a[tag=survivor] run attribute @s generic.max_health base set 40
execute as @a[tag=survivor] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:stone"}},distance=..3] run effect give @s resistance 3 0 true
execute as @a[tag=survivor] at @s as @e[type=item,nbt={Item:{id:"minecraft:stone"}},distance=..3] run kill @s

# Survivor activated ability
execute as @a[tag=survivor] at @s as @e[type=snowball,distance=..3] run tag @s add ice_bomb
execute as @e[type=snowball,tag=ice_bomb] at @s run particle electric_spark ~ ~ ~ 1 1 1 0.00001 60 force
execute as @e[type=snowball,tag=ice_bomb] at @s run effect give @a[tag=juggernaut,distance=..2] slowness 8 255 true

# Engineer
execute at @e[type=armor_stand,tag=engineer_tower] run execute as @a[tag=juggernaut,distance=..3] run particle totem_of_undying ~ ~ ~ 0.25 1 0.25 0 20 force

execute as @e[type=skeleton,tag=skeleton_turret] unless entity @e[type=armor_stand,tag=turret] run kill @s
execute as @e[type=skeleton,tag=skeleton_turret] at @s run tp @s @n[type=armor_stand,tag=turret]

# Engineer borrowed time ability
execute as @a[tag=engineer] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:raw_gold_block"}},distance=..3] run function juggernaut:spawn/spawn_revealing_tower
execute as @a[tag=engineer] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}},distance=..3] run function juggernaut:spawn/spawn_replenishment_tower
execute as @a[tag=engineer] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:bone"}},distance=..3] run function juggernaut:spawn/spawn_turret
execute at @e[type=armor_stand,tag=replenishment_tower_particle_emitter] unless entity @e[type=armor_stand,tag=replenishment_tower,distance=..5] run kill @e[type=armor_stand,tag=replenishment_tower_particle_emitter]
execute as @e[type=armor_stand,tag=revealing_tower] at @s run execute as @a[tag=juggernaut,distance=..48] run effect give @s glowing 1 0 true
execute as @e[type=armor_stand,tag=revealing_tower] at @s if entity @a[tag=juggernaut,distance=..8] run data modify entity @s CustomNameVisible set value true
execute as @e[type=armor_stand,tag=revealing_tower] at @s unless entity @a[tag=juggernaut,distance=..8] run data modify entity @s CustomNameVisible set value false

execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter] at @s run particle dust{color:[1,1,0],scale:1} ^0.75 ^ ^0.75 0.1 0.1 0.1 0.4 4 normal
execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter] at @s run particle dust{color:[0,1,1],scale:1} ^-0.75 ^1 ^-0.75 0.1 0.1 0.1 0.4 4 normal
execute as @e[type=armor_stand,tag=replenishment_tower] at @s positioned ~ ~-1 ~ run execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter,distance=..2] unless entity @s[distance=..1] run tp @s ~ ~-0.5 ~
execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter] at @s run tp @s ~ ~0.005 ~ ~10 ~

execute as @a[tag=engineer] at @s run execute if entity @e[type=item,nbt={Item:{id:"minecraft:red_concrete"}},distance=..3] if entity @n[type=armor_stand,tag=replenishment_tower,distance=..3] run scoreboard players set @s replenishment_tower_cooldown 0
execute as @a[tag=engineer] at @s run execute if entity @e[type=item,nbt={Item:{id:"minecraft:red_concrete"}},distance=..3] if entity @n[type=armor_stand,tag=revealing_tower,distance=..3] run scoreboard players set @s revealing_tower_cooldown 0
execute as @a[tag=engineer] at @s run execute as @e[type=item,nbt={Item:{id:"minecraft:red_concrete"}},distance=..3] run kill @n[type=armor_stand,tag=engineer_tower,distance=..3]

execute as @a[tag=engineer] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:clock"}},distance=..3] run tag @s add borrowing_time
execute as @a[tag=engineer] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:clock"}},distance=..3] run scoreboard players set @s jug_kit_cooldown 10
execute as @a[tag=engineer] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:clock"}},distance=..3] run scoreboard players set @s borrowed_damage_taken 0
execute as @a[tag=engineer] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:clock"}},distance=..3] run scoreboard players set @s borrowed_damage 0
execute as @a[tag=engineer] at @s run execute as @e[type=item,nbt={Item:{id:"minecraft:clock"}},distance=..3] run kill @s
execute as @a[tag=borrowing_time] run effect give @s resistance 1 255 true
execute as @a[tag=borrowing_time] run scoreboard players operation @s borrowed_damage_taken /= #10 var
execute as @a[tag=borrowing_time] run scoreboard players operation @s borrowed_damage += @s borrowed_damage_taken
execute as @a[tag=borrowing_time] run scoreboard players set @s borrowed_damage_taken 0
execute as @a[tag=borrowing_time,scores={jug_kit_cooldown=0}] run scoreboard players operation @s borrowed_damage *= #75 var
execute as @a[tag=borrowing_time,scores={jug_kit_cooldown=0}] run scoreboard players operation @s borrowed_damage /= #100 var
execute as @a[tag=borrowing_time,scores={jug_kit_cooldown=0}] run tag @s remove borrowing_time


# Loop per second function.
execute as @e[type=armor_stand,tag=juggernaut_manager] run scoreboard players add @s tick_counter 1
scoreboard players set #20 var 20
execute as @e[type=armor_stand,tag=juggernaut_manager] if score @s tick_counter >= #20 var run function juggernaut:loop/second
execute as @e[type=armor_stand,tag=juggernaut_manager] if score @s tick_counter >= #20 var run scoreboard players set @s tick_counter 0