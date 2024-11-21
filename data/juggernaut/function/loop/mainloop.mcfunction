scoreboard players set #0 var 0
scoreboard players set #75 var 75
scoreboard players set #33 var 33
scoreboard players set #100 var 100
scoreboard players set #10 var 10

# When runners are hit by the juggernaut (scout does not get this speed boost)
execute as @a[tag=runner,scores={damage_taken=1..}] at @s if entity @a[tag=juggernaut,distance=..5] run function juggernaut:hooks/hit_by_juggernaut
execute as @a[tag=runner,scores={damage_taken=1..}] run scoreboard players set @s damage_taken 0

execute as @a[tag=is_undetectable] run effect clear @s glowing

execute at @e[tag=respawn_point] as @a[distance=..10] at @r[tag=juggernaut] run tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random,distance=30..]

execute if score #game_state var matches 11 run function juggernaut:chase/check_in_chase

execute if score #game_state var matches 11 as @a[tag=runner] at @s if entity @e[type=armor_stand,tag=replenishment.station,distance=..3] run function juggernaut:replenishment_management/calculate_replenishment_modifier
execute if score #game_state var matches 11 run function juggernaut:replenishment_management/replenishment_stations
# While juggernaut is not released, disallow all interactions with replenishment stations but allow for runners to see them.
execute if score #game_state var matches 12 as @e[tag=replenishment.station] at @s run particle minecraft:end_rod ~ ~2.5 ~ 0.2 60 0.2 0 120 force @a[tag=runner]

execute if score #game_state var matches 10 as @n[type=armor_stand,tag=runner_kit_selection_room] at @s run particle campfire_cosy_smoke ~ ~1 ~ 7 1 7 0.00001 1 force
execute if score #game_state var matches 10 as @n[type=armor_stand,tag=runner_kit_selection_room] at @s run effect give @a[distance=..30] weakness 1 255 true

execute if score #game_state var matches 10 as @n[type=armor_stand,tag=juggernaut_kit_selection_room] at @s run particle ash ~ ~1 ~ 7 1 7 0.00001 5 force
execute if score #game_state var matches 10 as @n[type=armor_stand,tag=juggernaut_kit_selection_room] at @s run particle white_ash ~ ~1 ~ 7 1 7 0.00001 5 force
execute if score #game_state var matches 10 as @n[type=armor_stand,tag=juggernaut_kit_selection_room] at @s run particle crimson_spore ~ ~1 ~ 7 1 7 0.00001 5 force

execute if score #game_state var matches 10 as @n[type=armor_stand,tag=juggernaut_kit_selection_room] at @s run effect give @a[distance=..30] weakness 1 255 true

execute unless entity @a[tag=!has_jug_kit] if score #game_state var matches 10 run function juggernaut:start_juggernaut

# Get the highest replenished station.
execute if score #juggernaut_customisation completable_stations matches 1 run scoreboard players set #highest_station var 0
execute if score #juggernaut_customisation completable_stations matches 1 as @e[type=armor_stand,tag=replenishment.station] run function juggernaut:replenishment_management/update_highest_station

# If there are no runners or juggernauts then the game will end.
execute if score #game_state var matches 10..19 unless entity @a[tag=juggernaut] run tellraw @a {"text": "Runners win! (Juggernaut Dead/Not Found)","bold": true}
execute if score #game_state var matches 10..19 unless entity @a[tag=juggernaut] run scoreboard players add @a[tag=runner] points 100
execute if score #game_state var matches 10..19 unless entity @a[tag=juggernaut] run function juggernaut:end_game

execute if score #game_state var matches 10..19 unless entity @a[tag=runner] run tellraw @a {"text": "Juggernaut wins! (Runners Dead/Not Found)","bold": true}
execute if score #game_state var matches 10..19 unless entity @a[tag=runner] run scoreboard players add @a[tag=juggernaut] points 100
execute if score #game_state var matches 10..19 unless entity @a[tag=runner] run function juggernaut:end_game

#The replenish progress mode for winning the game.
execute if score #juggernaut_customisation completable_stations matches 0 if score #game_state var matches 10..19 if score @n[type=armor_stand,tag=juggernaut_manager] replenish_progress >= @n[type=armor_stand,tag=juggernaut_manager] total_replenishment_needed run tellraw @a {"text": "Runners win! (Replenishment Complete)","bold": true}
execute if score #juggernaut_customisation completable_stations matches 0 if score #game_state var matches 10..19 unless entity @a[tag=juggernaut] run scoreboard players add @a[tag=runner] points 100
execute if score #juggernaut_customisation completable_stations matches 0 if score #game_state var matches 10..19 if score @n[type=armor_stand,tag=juggernaut_manager] replenish_progress >= @n[type=armor_stand,tag=juggernaut_manager] total_replenishment_needed run function juggernaut:end_game

# If the 5 minutes runs out, then the game ends.
# execute if score #game_state var matches 10..19 if entity @a[tag=juggernaut,scores={juggernaut_game_time=0}] run scoreboard players add @a[tag=runner] kills 5
# execute if score #game_state var matches 10..19 if entity @a[tag=juggernaut,scores={juggernaut_game_time=0}] run function juggernaut:end_game

execute if score #game_state var matches 11 run function juggernaut:replenishment_management/display_replenishment_progress


# Effect mechanics
# This doesn't change the attributes as this could potentially mess with the player's stats. (and kit effects)
execute as @a[tag=is_hindered] run effect give @s slowness 1 4 true
execute as @a[tag=is_hindered] run effect give @s speed 1 11 true

scoreboard players set #runners_left var 0
execute as @a[tag=runner] run scoreboard players add #runners_left var 1

# Jug Kits
function juggernaut:ability_management/juggernaut_kits

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
execute as @a[tag=dragon] if entity @s[scores={is_sneaking=1}] run attribute @s generic.gravity base set 0.01


# Hunter
execute as @a[tag=jug_hunter,tag=is_hunting] at @s run particle witch ~ ~0.5 ~ 1 1 1 0.00001 3 force

execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run tp @r[tag=jug_hunter,tag=is_hunting] @s

execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run tag @a[tag=jug_hunter,tag=is_hunting] remove is_hunting
execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run tag @a[tag=has_hunters_mark] remove has_hunters_mark
execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run execute as @a[tag=jug_hunter,tag=is_hunting] at @s run particle campfire_cosy_smoke ~ ~0.5 ~ 1 1 1 0.00001 100 force
execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run execute as @a[tag=jug_hunter,tag=is_hunting] at @s run playsound entity.enderman.teleport master @a[distance=..20] ~ ~ ~
execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run kill @s

execute as @a[tag=has_hunters_mark] at @s run particle minecraft:trial_spawner_detection ~ ~-0.5 ~ 1 1.5 1 0 4 force @a[tag=jug_hunter]

# Lightning rod
execute as @e[type=item,nbt={Item:{id:"minecraft:lightning_rod"}}] run execute as @r[tag=runner] run effect give @s glowing 4 0 true
execute as @e[type=item,nbt={Item:{id:"minecraft:lightning_rod"}}] run kill @s

# Predator Functionality
execute if entity @a[tag=predator] run effect give @a[tag=runner] darkness infinite 0 true
execute as @a[tag=predator] at @s unless entity @s[scores={is_sneaking=1}] run particle white_ash ~ ~0.5 ~ 3 3 3 0.0001 30 force @a[tag=!predator]
execute as @a[tag=predator] at @s unless entity @s[scores={is_sneaking=1}] run particle ash ~ ~1 ~ 0.25 0.5 0.25 0.0001 100 force @a[tag=!predator]
# execute as @a[tag=predator] at @s if entity @s[scores={is_sneaking=1}] run effect give @s speed 1 0 true
# execute at @a[tag=predator] as @a[tag=runner,distance=..4] if score #game_state var matches 11 var run effect give @s blindness 4 3 true

# Warlock
execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=malevolent_aura] run bossbar set warlock:malevolent_aura visible false
execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=banishment_glyph] run bossbar set warlock:banishment_glyph visible false
execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=withering_surge] run bossbar set warlock:withering_surge visible false

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
execute if entity @e[type=armor_stand,tag=malevolent_aura] run function juggernaut:abilities/warlock/tower_effects/malevolent_aura
execute if entity @e[type=armor_stand,tag=withering_surge] run function juggernaut:abilities/warlock/tower_effects/withering_surge

execute if entity @e[type=armor_stand,tag=warlock_armor_stand] run function juggernaut:abilities/warlock/warlock_towers

# Eclipse Stalker
execute as @e[type=armor_stand,tag=camera] at @s run particle white_smoke ~ ~ ~ 0.25 0.25 0.25 0 10 force @a


#Runner Kits
function juggernaut:ability_management/runner_kits

# Guide passive effects
execute as @a[tag=guide,scores={is_sprinting=1..}] at @s if entity @a[tag=runner,distance=1..8,scores={is_sprinting=1..}] run effect give @a[tag=runner,distance=..8] speed 1 0 true

# Escapist passive effects
execute as @a[tag=escapist] run effect give @s speed 1 0 true

# Rogue Passive Effect
execute as @a[tag=rogue,scores={is_sneaking=1}] run attribute @s generic.step_height base set 1
execute as @a[tag=rogue,scores={is_sneaking=0}] run attribute @s generic.step_height base set 0.6

# Make medic immune to glowing
execute as @a[tag=medic] run effect clear @s glowing

# Scout passive effects
execute as @a[tag=scout] run scoreboard players add @n[tag=juggernaut_manager] scout_reveal_timer 1
execute as @a[tag=juggernaut_manager,scores={scout_reveal_timer=1200..}] run effect give @a[tag=juggernaut] glowing 16 0 true
execute as @a[tag=juggernaut_manager,scores={scout_reveal_timer=1200..}] run scoreboard players set @a[tag=juggernaut_manager] scout_reveal_timer 0


# Survivor effects
execute as @a[tag=survivor] run effect give @s resistance 1 0 true
execute as @a[tag=survivor] run attribute @s generic.max_health base set 40


execute as @a[tag=survivor] at @s as @e[type=snowball,distance=..3] run tag @s add ice_bomb
execute as @e[type=snowball,tag=ice_bomb] at @s run particle electric_spark ~ ~ ~ 1 1 1 0.00001 60 force
execute as @e[type=snowball,tag=ice_bomb] at @s run effect give @a[tag=juggernaut,distance=..2] slowness 8 255 true


# Ghost
execute as @a[tag=jug_ghost,scores={is_sneaking=1}] at @s if entity @a[distance=0.5..8] run effect give @a[tag=runner,distance=..8] invisibility 1 0 false
execute as @a[tag=jug_ghost,scores={is_sneaking=1}] at @s if entity @a[distance=0.5..8] as @a[tag=runner,distance=..8] run function juggernaut:effects/apply_effect_silent {effect:"undetectable",duration:1}


# Engineer
execute at @e[type=armor_stand,tag=engineer_tower] run execute as @a[tag=juggernaut,distance=..3] run particle totem_of_undying ~ ~ ~ 0.25 1 0.25 0 20 force

execute as @e[type=skeleton,tag=skeleton_turret] unless entity @e[type=armor_stand,tag=turret] run kill @s
execute as @e[type=skeleton,tag=skeleton_turret] at @s run tp @s @n[type=armor_stand,tag=turret]

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

# Juggernaut Perks
execute as @a[tag=juggernaut,tag=using_predatory_senses,scores={is_sprinting=0}] at @s as @a[tag=runner,scores={is_sprinting=1},tag=!is_undetectable,distance=..15] run effect give @s glowing 1 0 true

# Set healing needed
execute as @a[tag=runner] run function juggernaut:healing/set_healing_needed

# Healing mechanic
execute as @a[tag=runner,scores={is_sneaking=0,is_sprinting=0}] at @s if entity @a[tag=runner,distance=..1.5] run function juggernaut:healing/check_heal_player

# Self-heal
execute as @a[tag=runner,tag=!survivor,scores={is_sneaking=1,health=..19}] at @s run function juggernaut:healing/check_self_heal

# Hemorrhaged Mechanic
execute as @a[tag=is_hemorrhaged,tag=!is_being_healed,tag=!self_healing] at @s run function juggernaut:healing/force_unheal_player {amount:1}

# Mangled Mechanic
execute as @a[tag=is_mangled,tag=is_being_healed,tag=!self_healing] at @s run function juggernaut:healing/force_unheal_player {amount:4}
execute as @a[tag=is_mangled,tag=is_being_healed,tag=self_healing] at @s run function juggernaut:healing/force_unheal_player {amount:1}

# Remove tags to keep all data current
execute as @a[tag=runner,tag=is_healing] run tag @s remove is_healing
execute as @a[tag=runner,tag=self_healing] run tag @s remove self_healing
execute as @a[tag=runner,tag=is_being_healed] run tag @s remove is_being_healed

scoreboard players set @a[scores={is_sneaking=1..}] is_sneaking 0


execute as @a[tag=using_camera] at @s as @n[type=armor_stand,tag=used_camera] at @s run tp @p[tag=using_camera] ~ ~ ~
execute as @a[tag=shadow_marked] at @s run particle flame ~ ~0.5 ~ 1.5 1.5 1.5 0 1 force @a[tag=juggernaut]

# Quickened Stealth
execute as @a[tag=using_quickened_stealth] run attribute @s player.sneaking_speed base set 0.4
execute as @a[tag=using_quickened_stealth,tag=rogue] run attribute @s player.sneaking_speed base set 0.9