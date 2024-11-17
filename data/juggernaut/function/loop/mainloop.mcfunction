scoreboard players set #0 var 0
scoreboard players set #75 var 75
scoreboard players set #33 var 33
scoreboard players set #100 var 100
scoreboard players set #10 var 10

# When runners are hit by the juggernaut (scout does not get this speed boost)
execute as @a[tag=runner,tag=!scout] at @s if entity @a[tag=juggernaut,distance=..5] if score @s damage_taken > #0 var run effect give @s speed 1 0 true
execute as @a[tag=runner,tag=using_blood_pact] at @s if entity @a[tag=juggernaut,distance=..5] if score @s damage_taken > #0 var run tag @s add blood_pact_active
execute as @a[tag=runner,tag=using_blood_pact] at @s if entity @a[tag=juggernaut,distance=..5] if score @s damage_taken > #0 var run tag @s remove using_blood_pact
execute as @a[tag=runner] at @s if entity @a[tag=chain_hunter,distance=..5] if score @s damage_taken > #0 var run function juggernaut:effects/apply_effect {effect:"hindered",duration:4,color:"dark_gray"}
# execute as @a[tag=runner] at @s if entity @a[tag=predator,distance=..5] if score @s damage_taken > #0 var run function juggernaut:effects/apply_effect {effect:"hemorrhaged",duration:30,color:"dark_red"}
execute as @a[tag=is_exposed] run function juggernaut:damage_player
execute as @a[tag=runner] unless entity @s[tag=borrowing_time] if score @s damage_taken > #0 var run scoreboard players set @s damage_taken 0

execute at @e[tag=respawn_point] as @a[distance=..10] run tp @s @e[tag=arena.spawn,limit=1,sort=random]

function juggernaut:chase/check_in_chase

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
# execute if score #game_state var matches 10..19 if score @n[type=armor_stand,tag=juggernaut_manager] replenish_progress >= @n[type=armor_stand,tag=juggernaut_manager] total_replenishment_needed run tellraw @a {"text": "Runners win! (Replenishment Complete)","bold": true}
# execute if score #game_state var matches 10..19 unless entity @a[tag=juggernaut] run scoreboard players add @a[tag=runner] points 100
# execute if score #game_state var matches 10..19 if score @n[type=armor_stand,tag=juggernaut_manager] replenish_progress >= @n[type=armor_stand,tag=juggernaut_manager] total_replenishment_needed run function juggernaut:end_game

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

# execute if score #game_state var matches 11 if score @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal <= #33 var if entity @n[type=armor_stand,tag=juggernaut_manager] run title @a actionbar [{"text":"Replenishment Percentage: ","color": "dark_green","bold": true},{"score":{"name":"@n[type=armor_stand,tag=juggernaut_manager]","objective":"replenish_decimal"},"bold": true,"color": "dark_green"},{"text": "%"}]

# execute if score #game_state var matches 11 if score @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal > #33 var if score @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal <= #75 var if entity @n[type=armor_stand,tag=juggernaut_manager] run title @a actionbar [{"text":"Replenishment Percentage: ","color": "gold","bold": true},{"score":{"name":"@n[type=armor_stand,tag=juggernaut_manager]","objective":"replenish_decimal"},"bold": true,"color": "gold"},{"text": "%"}]

# execute if score #game_state var matches 11 if score @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal > #75 var if entity @n[type=armor_stand,tag=juggernaut_manager] run title @a actionbar [{"text":"Replenishment Percentage: ","color": "dark_red","bold": true},{"score":{"name":"@n[type=armor_stand,tag=juggernaut_manager]","objective":"replenish_decimal"},"bold": true,"color": "dark_red"},{"text": "%"}]

execute if score #game_state var matches 11 if score @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal <= #33 var if entity @n[type=armor_stand,tag=juggernaut_manager] run title @a actionbar [{"text":"Replenishment Percentage: ","color": "dark_green","bold": true},{"score":{"name":"@n[type=armor_stand,tag=juggernaut_manager]","objective":"replenish_decimal"},"bold": true,"color": "dark_green"},{"text": "%"},{"text": " [","color": "dark_green","bold":true},{"score":{"name":"#stations_completed","objective":"var"},"color": "dark_green","bold":true},{"text": "/","color": "dark_green","bold":true},{"score":{"name":"#stations_needed","objective":"var"},"color": "dark_green","bold":true},{"text": "]","color": "dark_green","bold":true}]

execute if score #game_state var matches 11 if score @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal > #33 var if score @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal <= #75 var if entity @n[type=armor_stand,tag=juggernaut_manager] run title @a actionbar [{"text":"Replenishment Percentage: ","color": "gold","bold": true},{"score":{"name":"@n[type=armor_stand,tag=juggernaut_manager]","objective":"replenish_decimal"},"bold": true,"color": "gold"},{"text": "%"},{"text": " [","color": "gold","bold":true},{"score":{"name":"#stations_completed","objective":"var"},"color": "gold","bold":true},{"text": "/","color": "gold","bold":true},{"score":{"name":"#stations_needed","objective":"var"},"color": "gold","bold":true},{"text": "]","color": "gold","bold":true}]

execute if score #game_state var matches 11 if score @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal > #75 var if entity @n[type=armor_stand,tag=juggernaut_manager] run title @a actionbar [{"text":"Replenishment Percentage: ","color": "dark_red","bold": true},{"score":{"name":"@n[type=armor_stand,tag=juggernaut_manager]","objective":"replenish_decimal"},"bold": true,"color": "dark_red"},{"text": "%"},{"text": " [","color": "dark_red","bold":true},{"score":{"name":"#stations_completed","objective":"var"},"color": "dark_red","bold":true},{"text": "/","color": "dark_red","bold":true},{"score":{"name":"#stations_needed","objective":"var"},"color": "dark_red","bold":true},{"text": "]","color": "dark_red","bold":true}]


# Effect mechanics
# This doesn't change the attributes as this could potentially mess with the player's stats. (and kit effects)
execute as @a[tag=is_hindered] run effect give @s slowness 1 4 true
execute as @a[tag=is_hindered] run effect give @s speed 1 11 true

scoreboard players set #runners_left var 0
execute as @a[tag=runner] run scoreboard players add #runners_left var 1

# Jug Kits
# Chain Hunter
execute if entity @a[tag=chain_hunter] run function juggernaut:ability_management/check_ability {\
    player_tag:"chain_hunter",\
    item_id:"minecraft:chain",\
    item_name:'{"text": "Summon Chain Shot","color": "gray"}',\
    ability_id:1,\
    cooldown:20,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown",\
}
execute if entity @a[tag=chain_hunter] run function juggernaut:ability_management/check_ability {\
    player_tag:"chain_hunter",\
    item_id:"minecraft:ghast_tear",\
    item_name:'{"text": "Chain Pull","color": "gray"}',\
    ability_id:2,\
    cooldown:20,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"jug_kit_cooldown_2",\
}

# Spirit Walker
execute if entity @a[tag=spirit_walker] run function juggernaut:ability_management/check_ability {\
    player_tag:"spirit_walker",\
    item_id:"minecraft:amethyst_shard",\
    item_name:'{"text": "Phase Shift","color": "#577ebe"}',\
    ability_id:0,\
    cooldown:30,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown",\
}

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
execute as @a[tag=blinker] run title @s actionbar [{"text":"Blinker Cooldown: ","color": "dark_red","bold": true},{"score":{"name":"@s","objective":"blinker_cooldown_percent"},"bold": true,"color": "dark_red"},{"text": "%"}]

# Dragon
execute as @a[tag=dragon] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:feather"}},distance=..3] run tag @s remove is_floating
execute as @a[tag=dragon] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:feather"}},distance=..3] run item replace entity @s hotbar.0 with phantom_membrane[item_name='{"text": "Flight","bold": true,"color": "green"}']
execute as @a[tag=dragon] at @s as @e[type=item,nbt={Item:{id:"minecraft:feather"}},distance=..3] run kill @s
execute as @a[tag=dragon] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"}},distance=..3] run tag @s add is_floating
execute as @a[tag=dragon] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"}},distance=..3] run item replace entity @s hotbar.0 with feather[item_name='{"text": "Walk","bold": true,"color": "dark_green"}']
execute as @a[tag=dragon] at @s as @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"}},distance=..3] run kill @s

execute as @a[tag=dragon] run attribute @s generic.safe_fall_distance base set 999
execute as @a[tag=dragon] at @s if block ~ ~-5 ~ #juggernaut:non-surface_blocks run attribute @s generic.gravity base set 0.005
execute as @a[tag=dragon] at @s unless block ~ ~-5 ~ #juggernaut:non-surface_blocks run attribute @s generic.gravity base set -0.015
execute as @a[tag=dragon] at @s if block ~ ~-6 ~ #juggernaut:non-surface_blocks unless block ~ ~-5 ~ #juggernaut:non-surface_blocks run attribute @s generic.gravity base set 0
execute as @a[tag=dragon] at @s unless block ~ ~-0.75 ~ #juggernaut:non-surface_blocks run attribute @s generic.gravity base set 0.08
execute as @a[tag=dragon,nbt={Inventory:[{id:"minecraft:feather",count:1}]}] run attribute @s generic.gravity base set -0.01
execute as @a[tag=dragon] if entity @s[scores={sneak_time=1}] run attribute @s generic.gravity base set 0.01


# Hunter
execute if entity @a[tag=jug_hunter] run function juggernaut:ability_management/check_ability {\
    player_tag:"jug_hunter",\
    item_id:"minecraft:target",\
    item_name:'{"text": "Mark Prey","color": "dark_red"}',\
    ability_id:1,\
    cooldown:5,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"jug_kit_cooldown",\
}
execute if entity @a[tag=jug_hunter] run function juggernaut:ability_management/check_ability {\
    player_tag:"jug_hunter",\
    item_id:"minecraft:vault",\
    item_name:'{"text": "Pursue Prey","color": "dark_red"}',\
    ability_id:2,\
    cooldown:35,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"jug_kit_cooldown",\
}

execute as @a[tag=jug_hunter,tag=is_hunting] at @s run particle witch ~ ~0.5 ~ 1 1 1 0.00001 3 force

execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run tp @r[tag=jug_hunter,tag=is_hunting] @s

execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run tag @a[tag=jug_hunter,tag=is_hunting] remove is_hunting
execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run tag @a[tag=has_hunters_mark] remove has_hunters_mark
execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run execute as @a[tag=jug_hunter,tag=is_hunting] at @s run particle campfire_cosy_smoke ~ ~0.5 ~ 1 1 1 0.00001 100 force
execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run execute as @a[tag=jug_hunter,tag=is_hunting] at @s run playsound entity.enderman.teleport master @a[distance=..20] ~ ~ ~
execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run kill @s


# execute as @a[tag=has_hunters_mark] at @s run particle minecraft:trial_spawner_detection_ominous ~ ~-0.5 ~ 1.5 1.5 1.5 0.0001 4 force @a[tag=has_hunters_mark]
execute as @a[tag=has_hunters_mark] at @s run particle minecraft:trial_spawner_detection ~ ~-0.5 ~ 1 1.5 1 0 4 force @a[tag=jug_hunter]


# Lightning rod
execute as @e[type=item,nbt={Item:{id:"minecraft:lightning_rod"}}] run execute as @r[tag=runner] run effect give @s glowing 4 0 true
execute as @e[type=item,nbt={Item:{id:"minecraft:lightning_rod"}}] run kill @s

# Predator Functionality

execute if entity @a[tag=predator] run effect give @a[tag=runner] darkness infinite 0 true
execute as @a[tag=predator] at @s unless entity @s[scores={sneak_time=1}] run particle white_ash ~ ~0.5 ~ 3 3 3 0.0001 30 force @a[tag=!predator]
execute as @a[tag=predator] at @s unless entity @s[scores={sneak_time=1}] run particle ash ~ ~1 ~ 0.25 0.5 0.25 0.0001 100 force @a[tag=!predator]
# execute as @a[tag=predator] at @s if entity @s[scores={sneak_time=1}] run effect give @s speed 1 0 true
# execute at @a[tag=predator] as @a[tag=runner,distance=..4] if score #game_state var matches 11 var run effect give @s blindness 4 3 true

# Warlock Functionality
execute if entity @a[tag=warlock] run function juggernaut:ability_management/check_ability {\
    player_tag:"warlock",\
    item_id:"minecraft:red_dye",\
    item_name:'{"text": "Spawn Malevolent Aura","color": "dark_red"}',\
    ability_id:1,\
    cooldown:20,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"malevolent_aura_cooldown",\
}
execute if entity @a[tag=warlock] run function juggernaut:ability_management/check_ability {\
    player_tag:"warlock",\
    item_id:"minecraft:cyan_dye",\
    item_name:'{"text": "Spawn Banishment Glyph","color": "dark_aqua"}',\
    ability_id:2,\
    cooldown:30,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"banishment_glyph_cooldown",\
}
execute if entity @a[tag=warlock] run function juggernaut:ability_management/check_ability {\
    player_tag:"warlock",\
    item_id:"minecraft:black_dye",\
    item_name:'{"text": "Spawn Withering Surge","color": "dark_gray"}',\
    ability_id:3,\
    cooldown:40,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"withering_surge_cooldown",\
}

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


# Eclipse Stalker
execute if entity @a[tag=eclipse_stalker,tag=!using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:'{"text": "Place Camera","color": "#FFD700"}',\
    ability_id:1,\
    cooldown:4,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown",\
}
execute if entity @a[tag=eclipse_stalker,tag=!using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:'{"text": "Use Camera","color": "#FFD700"}',\
    ability_id:2,\
    cooldown:2,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"jug_kit_cooldown_2",\
}
execute if entity @a[tag=eclipse_stalker,tag=using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:'{"text": "Change Camera","color": "#FFD700"}',\
    ability_id:4,\
    cooldown:2,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown_2",\
}
execute if entity @a[tag=eclipse_stalker,tag=using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:'{"text": "Leave Camera","color": "#FFD700"}',\
    ability_id:3,\
    cooldown:30,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"jug_kit_cooldown_2",\
}
execute if entity @a[tag=eclipse_stalker,tag=using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:'{"text": "Kill Camera","color": "#FFD700"}',\
    ability_id:5,\
    cooldown:25,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"jug_kit_cooldown_2",\
}
execute if entity @a[tag=eclipse_stalker,tag=using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:magma_cream",\
    item_name:'{"text": "Shadow Mark","color": "#cc3c3c"}',\
    ability_id:6,\
    cooldown:5,\
    hotbar_slot:"hotbar.5",\
    cooldown_var:"shadow_mark_cooldown",\
}
execute if entity @a[tag=eclipse_stalker,tag=using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:fire_charge",\
    item_name:'{"text": "Materialise","color": "#aa0000"}',\
    ability_id:7,\
    cooldown:10,\
    hotbar_slot:"hotbar.6",\
    cooldown_var:"shadow_mark_cooldown",\
}

execute as @e[type=armor_stand,tag=camera] at @s run particle white_smoke ~ ~ ~ 0.25 0.25 0.25 0 10 force @a


#Runner Kits
# Guide passive effects
execute as @a[tag=guide,scores={is_sprinting=1..}] at @s if entity @a[tag=runner,distance=1..8,scores={is_sprinting=1..}] run effect give @a[tag=runner,distance=..8] speed 1 0 true

# Guide
execute if entity @a[tag=guide] run function juggernaut:ability_management/check_ability {\
    player_tag:"guide",\
    item_id:"minecraft:ender_eye",\
    item_name:'{"text": "Replenish Boost","color": "#FFD700"}',\
    ability_id:1,\
    cooldown:50,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"jug_kit_cooldown",\
}
execute if entity @a[tag=guide] run function juggernaut:ability_management/check_ability {\
    player_tag:"guide",\
    item_id:"minecraft:rabbit_foot",\
    item_name:'{"text": "Nimble Escape","color": "#FFD700"}',\
    ability_id:2,\
    cooldown:40,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown_2",\
}

# Escapist passive effects
execute as @a[tag=escapist] run effect give @s speed 1 0 true

# Escapist Ability
execute if entity @a[tag=escapist] run function juggernaut:ability_management/check_ability {\
    player_tag:"escapist",\
    item_id:"minecraft:gunpowder",\
    item_name:'{"text": "Flee Powder","color": "#646464"}',\
    ability_id:0,\
    cooldown:60,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"jug_kit_cooldown",\
}

# Medic Ability
execute if entity @a[tag=medic] run function juggernaut:ability_management/check_ability {\
    player_tag:"medic",\
    item_id:"minecraft:nether_star",\
    item_name:'{"text": "Rescue","color": "#A4D1EA"}',\
    ability_id:1,\
    cooldown:120,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"jug_kit_cooldown",\
}

execute if entity @a[tag=medic] run function juggernaut:ability_management/check_ability {\
    player_tag:"medic",\
    item_id:"minecraft:glistering_melon_slice",\
    item_name:'{"text": "Heal","color": "#dbbe2d"}',\
    ability_id:2,\
    cooldown:120,\
    hotbar_slot:"hotbar.4",\
    cooldown_var:"jug_kit_cooldown_2",\
}

# Make medic immune to glowing
execute as @a[tag=medic] run effect clear @s glowing

execute as @a[tag=scout] run scoreboard players add @n[tag=juggernaut_manager] scout_reveal_timer 1
execute as @a[tag=juggernaut_manager,scores={scout_reveal_timer=1200..}] run effect give @a[tag=juggernaut] glowing 16 0 true
execute as @a[tag=juggernaut_manager,scores={scout_reveal_timer=1200..}] run scoreboard players set @a[tag=juggernaut_manager] scout_reveal_timer 0

execute if entity @a[tag=scout] run function juggernaut:ability_management/check_ability {\
    player_tag:"scout",\
    item_id:"minecraft:glowstone_dust",\
    item_name:'{"text": "Revealing Powder","color": "gold"}',\
    ability_id:0,\
    cooldown:25,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown",\
}

# Survivor effects
execute as @a[tag=survivor] run effect give @s resistance 1 0 true
execute as @a[tag=survivor] run attribute @s generic.max_health base set 40

# execute if entity @a[tag=survivor] run function juggernaut:ability_management/check_ability {\
#     player_tag:"survivor",\
#     item_id:"minecraft:stone",\
#     item_name:'{"text": "Resistance Stone","color": "#A4D1EA"}',\
#     ability_id:0,\
#     cooldown:60,\
#     hotbar_slot:"hotbar.1",\
#     cooldown_var:"jug_kit_cooldown",\
# }

execute as @a[tag=survivor] at @s as @e[type=snowball,distance=..3] run tag @s add ice_bomb
execute as @e[type=snowball,tag=ice_bomb] at @s run particle electric_spark ~ ~ ~ 1 1 1 0.00001 60 force
execute as @e[type=snowball,tag=ice_bomb] at @s run effect give @a[tag=juggernaut,distance=..2] slowness 8 255 true

# Engineer
execute at @e[type=armor_stand,tag=engineer_tower] run execute as @a[tag=juggernaut,distance=..3] run particle totem_of_undying ~ ~ ~ 0.25 1 0.25 0 20 force

execute as @e[type=skeleton,tag=skeleton_turret] unless entity @e[type=armor_stand,tag=turret] run kill @s
execute as @e[type=skeleton,tag=skeleton_turret] at @s run tp @s @n[type=armor_stand,tag=turret]

# Engineer borrowed time ability
execute if entity @a[tag=engineer] run function juggernaut:ability_management/check_ability {\
    player_tag:"engineer",\
    item_id:"minecraft:gold_block",\
    item_name:'{"text": "Spawn Revealing Tower","color": "gold"}',\
    ability_id:4,\
    cooldown:90,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"revealing_tower_cooldown",\
}
execute if entity @a[tag=engineer] run function juggernaut:ability_management/check_ability {\
    player_tag:"engineer",\
    item_id:"minecraft:lime_dye",\
    item_name:'{"text": "Spawn Replenishment Tower","color": "green"}',\
    ability_id:2,\
    cooldown:60,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"replenishment_tower_cooldown",\
}
execute if entity @a[tag=engineer] run function juggernaut:ability_management/check_ability {\
    player_tag:"engineer",\
    item_id:"minecraft:bone",\
    item_name:'{"text": "Spawn Turret","color": "gray"}',\
    ability_id:3,\
    cooldown:90,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"turret_cooldown",\
}
execute if entity @a[tag=engineer] run function juggernaut:ability_management/check_ability {\
    player_tag:"engineer",\
    item_id:"minecraft:clock",\
    item_name:'{"text": "Borrowed Time","color": "gold"}',\
    ability_id:0,\
    cooldown:120,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"jug_kit_cooldown",\
}

execute at @e[type=armor_stand,tag=replenishment_tower_particle_emitter] unless entity @e[type=armor_stand,tag=replenishment_tower,distance=..5] run kill @e[type=armor_stand,tag=replenishment_tower_particle_emitter]

execute as @e[type=armor_stand,tag=revealing_tower] at @s if entity @a[tag=juggernaut,distance=..8] run data modify entity @s CustomNameVisible set value true
execute as @e[type=armor_stand,tag=revealing_tower] at @s unless entity @a[tag=juggernaut,distance=..8] run data modify entity @s CustomNameVisible set value false

execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter] at @s run particle dust{color:[1,1,0],scale:1} ^0.75 ^ ^0.75 0.1 0.1 0.1 0.4 4 normal
execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter] at @s run particle dust{color:[0,1,1],scale:1} ^-0.75 ^1 ^-0.75 0.1 0.1 0.1 0.4 4 normal
execute as @e[type=armor_stand,tag=replenishment_tower] at @s positioned ~ ~-1 ~ run execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter,distance=..2] unless entity @s[distance=..1] run tp @s ~ ~-0.5 ~
execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter] at @s run tp @s ~ ~0.005 ~ ~10 ~

execute as @a[tag=borrowing_time] run effect give @s resistance 1 255 true
execute as @a[tag=borrowing_time] run scoreboard players operation @s borrowed_damage_taken /= #10 var
execute as @a[tag=borrowing_time] run scoreboard players operation @s borrowed_damage += @s borrowed_damage_taken
execute as @a[tag=borrowing_time] run scoreboard players set @s borrowed_damage_taken 0
execute as @a[tag=borrowing_time,scores={borrowed_time_remaining=..0}] run scoreboard players operation @s borrowed_damage *= #75 var
execute as @a[tag=borrowing_time,scores={borrowed_time_remaining=..0}] run scoreboard players operation @s borrowed_damage /= #100 var
execute as @a[tag=borrowing_time,scores={borrowed_time_remaining=..0}] run tag @s remove borrowing_time

# Loop per second function.
execute as @e[type=armor_stand,tag=juggernaut_manager] run scoreboard players add @s tick_counter 1
scoreboard players set #20 var 20
execute as @e[type=armor_stand,tag=juggernaut_manager] if score @s tick_counter >= #20 var run function juggernaut:loop/second
# execute as @e[type=armor_stand,tag=juggernaut_manager] if score @s tick_counter = #20 var run function juggernaut:loop/half_second
# execute as @e[type=armor_stand,tag=juggernaut_manager] if score @s tick_counter = #10 var run function juggernaut:loop/half_second
execute as @e[type=armor_stand,tag=juggernaut_manager] if score @s tick_counter >= #20 var run scoreboard players set @s tick_counter 0

execute as @a[tag=runner] run function juggernaut:healing/set_healing_needed

# Healing mechanic
execute as @a[tag=runner,tag=!medic,scores={sneak_time=0}] at @s run function juggernaut:healing/try_heal_player {distance:1.5,heal_amount:5}
# Medic heals at increased speed, so run the function with double the heal amount per second.
execute as @a[tag=medic,scores={sneak_time=0}] at @s run function juggernaut:healing/try_heal_player {distance:1.5,heal_amount:7}

# Self-heal
execute as @a[tag=runner,tag=!survivor,scores={sneak_time=1,health=..19}] at @s run function juggernaut:healing/try_self_heal {heal_amount:2}

# Hemorrhaged Mechanic
execute as @a[tag=is_hemorrhaged,tag=!is_being_healed] at @s run function juggernaut:healing/force_unheal_player {amount:3}

# Mangled Mechanic
execute as @a[tag=is_mangled,tag=is_being_healed,tag=!self_healing] at @s run function juggernaut:healing/force_unheal_player {amount:4}
execute as @a[tag=is_mangled,tag=is_being_healed,tag=self_healing] at @s run function juggernaut:healing/force_unheal_player {amount:1}

# Remove tags to keep all data current
execute as @a[tag=runner,tag=is_healing] run tag @s remove is_healing
execute as @a[tag=runner,tag=self_healing] run tag @s remove self_healing
execute as @a[tag=runner,tag=is_being_healed] run tag @s remove is_being_healed

scoreboard players set @a[scores={sneak_time=1..}] sneak_time 0
scoreboard players set @a[scores={is_sprinting=1..}] is_sprinting 0


execute as @a[tag=using_camera] at @s as @n[type=armor_stand,tag=used_camera] at @s run tp @p[tag=using_camera] ~ ~ ~
execute as @a[tag=shadow_marked] at @s run particle flame ~ ~0.5 ~ 1.5 1.5 1.5 0 1 force @a[tag=juggernaut]

execute as @a[tag=has_respawn_time] run effect give @s invisibility 1 0 true
effect give @a[tag=using_flame_ward] fire_resistance 1 0 true
execute as @a[tag=using_quickened_stealth] run attribute @s player.sneaking_speed base set 0.4