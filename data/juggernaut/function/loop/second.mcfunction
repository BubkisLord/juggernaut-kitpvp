# Point gaining
function juggernaut:loop/recursive_point_gaining

# Progress and clear old effects.
execute as @a run function juggernaut:effects/check_effects {effect:"bleeding"}
execute as @a run function juggernaut:effects/check_effects {effect:"hindered"}
execute as @a run function juggernaut:effects/check_effects {effect:"exposed"}
execute as @a run function juggernaut:effects/check_effects {effect:"hemorrhaged"}
execute as @a run function juggernaut:effects/check_effects {effect:"not_replenishing"}
execute as @a run function juggernaut:effects/check_effects {effect:"undetectable"}

execute as @a run function juggernaut:attribute_management/check {attribute_name:"movement_speed",default_value:0.1}

execute if score #game_state var matches 11..12 as @a[tag=runner] run function juggernaut:perk_management/check_runner_perks
execute if score #game_state var matches 11 as @a[tag=juggernaut] run function juggernaut:perk_management/check_jug_perks

# Juggernaut timeout countdown
execute as @a[tag=juggernaut,scores={juggernaut_game_time=1..}] run scoreboard players remove @a[tag=juggernaut] juggernaut_game_time 1
# Juggernaut release sequence
scoreboard players remove @a[tag=juggernaut] juggernaut_release_timer 1
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=30}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "30","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=10}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "10","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=9}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "9","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=8}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "8","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=7}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "7","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=6}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "6","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=5}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "5","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=4}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "4","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=3}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "3","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=2}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "2","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=1}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "1","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=0}] run tellraw @a [{"text": "Juggernaut","bold": true,"color": "dark_red","underlined": true},{"text": " Released!","bold": true,"color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=0}] run title @a title [{"text": "Juggernaut","bold": true,"color": "dark_red","underlined": true},{"text": " Released!","bold": true,"color": "gray"}]
execute if entity @a[tag=juggernaut,scores={juggernaut_release_timer=0}] as @r[tag=runner] at @s run tp @a[tag=juggernaut,scores={juggernaut_release_timer=0}] @e[tag=arena.spawn,limit=1,sort=furthest]
execute if entity @a[tag=juggernaut,scores={juggernaut_release_timer=0}] as @a[tag=runner] at @s run playsound minecraft:block.end_portal.spawn master @s ~ ~ ~ 0.4 0.1
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=0}] run scoreboard players set #game_state var 11

execute as @e[tag=replenishment.station] if score @s replenish_timeout > #0 var run scoreboard players remove @s replenish_timeout 1

# Remove is_glowing tag from juggernaut every second.
execute if entity @a[tag=juggernaut] run tag @a[tag=juggernaut] remove is_glowing

# General kit cooldowns
execute as @a if score #game_state var matches 10..19 if score @s jug_kit_cooldown > #0 var run function juggernaut:ability_management/apply_ability_modifiers

execute as @a if score #game_state var matches 10..19 if score @s jug_kit_cooldown > #0 var run scoreboard players remove @s jug_kit_cooldown 1
execute as @a unless score #game_state var matches 10..19 if score @s jug_kit_cooldown > #0 var run scoreboard players set @s jug_kit_cooldown 0

execute as @a if score #game_state var matches 10..19 if score @s jug_kit_cooldown_2 > #0 var run scoreboard players remove @s jug_kit_cooldown_2 1
execute as @a unless score #game_state var matches 10..19 if score @s jug_kit_cooldown_2 > #0 var run scoreboard players set @s jug_kit_cooldown_2 0

execute as @a if score #game_state var matches 10..19 if score @s shadow_mark_cooldown > #0 var run scoreboard players remove @s shadow_mark_cooldown 1
execute as @a unless score #game_state var matches 10..19 if score @s shadow_mark_cooldown > #0 var run scoreboard players set @s shadow_mark_cooldown 0

execute as @a if score #game_state var matches 10..19 if score @s brutal_efficiency_cooldown > #0 var run scoreboard players remove @s brutal_efficiency_cooldown 1
execute as @a unless score #game_state var matches 10..19 if score @s brutal_efficiency_cooldown > #0 var run scoreboard players set @s brutal_efficiency_cooldown 0

execute as @a if score #game_state var matches 10..19 if score @s speed_pot_cooldown > #0 var run scoreboard players remove @s speed_pot_cooldown 1
execute as @a unless score #game_state var matches 10..19 if score @s speed_pot_cooldown > #0 var run scoreboard players set @s speed_pot_cooldown 0
execute as @a if score #game_state var matches 10..19 if score @s fire_pot_cooldown > #0 var run scoreboard players remove @s fire_pot_cooldown 1
execute as @a unless score #game_state var matches 10..19 if score @s fire_pot_cooldown > #0 var run scoreboard players set @s fire_pot_cooldown 0
execute as @a if score #game_state var matches 10..19 if score @s strength_pot_cooldown > #0 var run scoreboard players remove @s strength_pot_cooldown 1
execute as @a unless score #game_state var matches 10..19 if score @s strength_pot_cooldown > #0 var run scoreboard players set @s strength_pot_cooldown 0

# Engineer tower cooldowns/duration
execute as @e[type=armor_stand,tag=engineer_tower] run scoreboard players remove @s var 1
execute as @e[tag=engineer] if score @s revealing_tower_cooldown > #0 var run scoreboard players remove @s revealing_tower_cooldown 1
execute as @e[tag=engineer] if score @s replenishment_tower_cooldown > #0 var run scoreboard players remove @s replenishment_tower_cooldown 1
execute as @e[tag=engineer] if score @s turret_cooldown > #0 var run scoreboard players remove @s turret_cooldown 1

execute at @e[type=armor_stand,tag=engineer_tower] run execute as @a[tag=juggernaut,distance=..3] run scoreboard players add @n[type=armor_stand,tag=engineer_tower] dispel_progress 1
execute as @e[type=armor_stand,tag=engineer_tower] at @s run execute if score @s dispel_progress >= @s total_dispelling_needed run playsound block.note_block.bell master @a[tag=juggernaut,distance=..16] ~ ~ ~ 2 1.2
execute as @e[type=armor_stand,tag=engineer_tower] at @s run execute if score @s dispel_progress >= @s total_dispelling_needed run playsound entity.ender_dragon.growl master @a[tag=engineer] ~ ~ ~ 3 0.2 1
execute as @e[type=armor_stand,tag=engineer_tower] at @s run execute if score @s dispel_progress >= @s total_dispelling_needed run kill @s

# Borrowed time ability
execute as @a[tag=!borrowing_time,scores={borrowed_damage=1..}] run damage @s 1
execute as @a[tag=!borrowing_time,scores={borrowed_damage=1..}] run scoreboard players remove @s borrowed_damage 1

execute as @a[tag=borrowing_time] run scoreboard players remove @s borrowed_time_remaining 1

# Chain Tether Removal
execute as @e[type=armor_stand,tag=portal_tether] at @s run scoreboard players add @s var 1

# Warlock cooldowns
execute as @a[tag=warlock] if score #game_state var matches 10..19 if score @s malevolent_aura_cooldown > #0 var run scoreboard players remove @s malevolent_aura_cooldown 1
execute as @a[tag=warlock] if score #game_state var matches 10..19 if score @s banishment_glyph_cooldown > #0 var run scoreboard players remove @s banishment_glyph_cooldown 1
execute as @a[tag=warlock] if score #game_state var matches 10..19 if score @s withering_surge_cooldown > #0 var run scoreboard players remove @s withering_surge_cooldown 1

execute as @a[tag=warlock] unless score #game_state var matches 10..19 if score @s malevolent_aura_cooldown > #0 var run scoreboard players set @s malevolent_aura_cooldown 0
execute as @a[tag=warlock] unless score #game_state var matches 10..19 if score @s banishment_glyph_cooldown > #0 var run scoreboard players set @s banishment_glyph_cooldown 0
execute as @a[tag=warlock] unless score #game_state var matches 10..19 if score @s withering_surge_cooldown > #0 var run scoreboard players set @s withering_surge_cooldown 0

# Hunter remnant delay
execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var > #0 var run scoreboard players remove @s var 1

execute as @a[tag=blinker,nbt={SelectedItem:{id:"minecraft:ender_pearl"}}] at @s run function juggernaut:raycasts/raycast {\
    player_tag:"blinker",\
    raycast_tag:"blinker_raycast",\
    target_tag:"blinker_remnant",\
    hit_distance:8,\
    raycast_limit:1000,\
    move_function_id:3,\
    hit_function_id:3,\
    collides_with_blocks:0,\
}

# Scout revealing by maintaining line of sight
execute as @a[tag=scout] at @s run function juggernaut:raycasts/raycast {\
    player_tag:"scout",\
    raycast_tag:"scout_raycast",\
    target_tag:"juggernaut",\
    hit_distance:2.5,\
    raycast_limit:200,\
    move_function_id:0,\
    hit_function_id:2,\
    collides_with_blocks:1,\
}

execute as @a[tag=dragon] run function juggernaut:raycasts/raycast {\
    player_tag:"dragon",\
    raycast_tag:"dragon_breath_raycast",\
    target_tag:"runner",\
    hit_distance:1.5,\
    raycast_limit:24,\
    move_function_id:1,\
    hit_function_id:1,\
    collides_with_blocks:1,\
}

# Predatory Instincts Perk
execute as @a[tag=juggernaut,tag=using_predatory_instincts,scores={is_walking=0,is_sprinting=0,is_crouch_walking=0}] at @s as @a[tag=runner,tag=!is_undetectable,distance=..8] run effect give @s glowing 1 0 true

# Update scores
scoreboard players set @a[scores={is_sprinting=1..}] is_sprinting 0
scoreboard players set @a[scores={is_walking=1..}] is_walking 0
scoreboard players set @a[scores={is_crouch_walking=1..}] is_crouch_walking 0

# Update max health score
execute as @a store result score @s max_health run attribute @s max_health get

# Update chase time
execute as @a[tag=in_chase] run scoreboard players add @s chase_time 1
execute as @a[tag=!in_chase] run scoreboard players set @s chase_time 0

# Update unyielding wrath stacks
execute as @a[tag=juggernaut,tag=in_chase,tag=using_unyielding_wrath] run scoreboard players operation @s unyielding_wrath_time = @s chase_time
execute as @a[tag=juggernaut,tag=in_chase,tag=using_unyielding_wrath] run scoreboard players operation @s unyielding_wrath_time %= #10 var
execute as @a[tag=juggernaut,tag=in_chase,tag=using_unyielding_wrath,scores={unyielding_wrath_time=0}] run scoreboard players add @s unyielding_wrath_stacks 1
execute as @a[tag=juggernaut,tag=in_chase,tag=using_unyielding_wrath,scores={unyielding_wrath_time=0,unyielding_wrath_stacks=1}] run attribute @s movement_speed modifier add unyielding_wrath_1 0.003 add_value
execute as @a[tag=juggernaut,tag=in_chase,tag=using_unyielding_wrath,scores={unyielding_wrath_time=0,unyielding_wrath_stacks=2}] run attribute @s movement_speed modifier add unyielding_wrath_2 0.003 add_value
execute as @a[tag=juggernaut,tag=in_chase,tag=using_unyielding_wrath,scores={unyielding_wrath_time=0,unyielding_wrath_stacks=3}] run attribute @s movement_speed modifier add unyielding_wrath_3 0.003 add_value
execute as @a[tag=juggernaut,tag=in_chase,tag=using_unyielding_wrath,scores={unyielding_wrath_time=0,unyielding_wrath_stacks=4}] run attribute @s movement_speed modifier add unyielding_wrath_4 0.003 add_value
execute as @a[tag=juggernaut,tag=in_chase,tag=using_unyielding_wrath,scores={unyielding_wrath_time=0,unyielding_wrath_stacks=5}] run attribute @s movement_speed modifier add unyielding_wrath_5 0.003 add_value

execute as @a[tag=juggernaut,tag=!in_chase,tag=using_unyielding_wrath] run attribute @s movement_speed modifier remove unyielding_wrath_1
execute as @a[tag=juggernaut,tag=!in_chase,tag=using_unyielding_wrath] run attribute @s movement_speed modifier remove unyielding_wrath_2
execute as @a[tag=juggernaut,tag=!in_chase,tag=using_unyielding_wrath] run attribute @s movement_speed modifier remove unyielding_wrath_3
execute as @a[tag=juggernaut,tag=!in_chase,tag=using_unyielding_wrath] run attribute @s movement_speed modifier remove unyielding_wrath_4
execute as @a[tag=juggernaut,tag=!in_chase,tag=using_unyielding_wrath] run attribute @s movement_speed modifier remove unyielding_wrath_5
execute as @a[tag=juggernaut,tag=!in_chase,tag=using_unyielding_wrath] run scoreboard players set @s unyielding_wrath_stacks 0

# Update domination speed
execute as @a[tag=juggernaut,tag=using_domination] run function juggernaut:perk_management/perk_functions/set_domination_speed

# Update Grim Determination speed
execute as @a[tag=runner,tag=in_chase,tag=harbinger] run function juggernaut:set_grim_determination_speed
execute as @a[tag=runner,tag=!in_chase,tag=harbinger] run attribute @s movement_speed modifier remove grim_determination

# Update beacon of hope duration
execute as @a[tag=beacon_of_hope_active,scores={beacon_of_hope_duration=1..}] run scoreboard players remove @s beacon_of_hope_duration 1
execute as @a[tag=beacon_of_hope_active,scores={beacon_of_hope_duration=0}] run tag @s remove beacon_of_hope_active

# Flame Ward
effect give @a[tag=using_flame_ward] fire_resistance 1 0 true

# Spectator
execute as @a[tag=spectator] run tag @s remove in_chase

# Reset second counter periodically
execute if score #second_counter var matches 100.. run scoreboard players set #second_counter var 0