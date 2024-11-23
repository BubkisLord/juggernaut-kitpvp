scoreboard players set #game_state var 0
scoreboard players set @a juggernaut_game_time 0
scoreboard players set @a juggernaut_release_timer 0
scoreboard players set @a jug_kit_cooldown 0
scoreboard players set @a jug_kit_cooldown_2 0
scoreboard players set @a revealing_tower_cooldown 0
scoreboard players set @a replenishment_tower_cooldown 0
scoreboard players set @a turret_cooldown 0
scoreboard players set @a shadow_mark_cooldown 0
scoreboard players set @a brutal_efficiency_cooldown 0
scoreboard players set @a unyielding_wrath_stacks 0
scoreboard players set @a unyielding_wrath_time 0
scoreboard players set @a domination_kills 0
scoreboard players set @a ticks_spent_buffing 0
scoreboard players set @a ticks_spent_debuffing 0
scoreboard players set @a ticks_spent_replenishing 0
scoreboard players set @a ticks_till_decrement 0
scoreboard players set @a ticks_till_increment 0
scoreboard players set @a replenish_debuff 0
scoreboard players set @a replenish_buff 0
scoreboard players set @a ticks_spent_on_ability_buff 0
scoreboard players set @a ticks_spent_on_ability_debuff 0
scoreboard players set @a ticks_spent_on_ability 0
scoreboard players set @a ticks_till_decrement_ability 0
scoreboard players set @a ticks_till_increment_ability 0
scoreboard players set @a ability_debuff 0
scoreboard players set @a ability_buff 0
scoreboard players set @a beacon_of_hope_cooldown 0
scoreboard players set @a speed_pot_cooldown 0
scoreboard players set @a fire_pot_cooldown 0
scoreboard players set @a strength_pot_cooldown 0
spawnpoint @a 2000 100 0
gamerule showDeathMessages false
tag @a remove has_jug_kit
tag @a remove juggernaut
tag @a remove runner
tag @a remove spectator
tag @a remove predator
tag @a remove witchdoctor
tag @a remove medic
tag @a remove survivor
tag @a remove escapist
tag @a remove rogue
tag @a remove scout
tag @a remove engineer
tag @a remove witchdoctor
tag @a remove warlock
tag @a remove jug_hunter
tag @a remove is_hunting
tag @a remove has_hunters_mark
tag @a remove dragon
tag @a remove is_floating
tag @a remove chain_hunter
tag @a remove blinker
tag @a remove spirit_walker
tag @a remove guide
tag @a remove using_camera
tag @a remove eclipse_stalker
tag @e remove used_camera
tag @e remove sentinel_tower
tag @a remove shadow_marked
tag @a remove beacon_of_hope_active
tag @a remove jug_ghost
tag @a remove harbinger
tag @a remove trickster
tag @a add lobby.player

tag @a remove using_blood_pact
tag @a remove using_flame_ward
tag @a remove using_fractured_aid
tag @a remove using_self_preservation
tag @a remove using_sentinel
tag @a remove using_quickened_stealth
tag @a remove using_undying_ties
tag @a remove using_unwavering_strength
tag @a remove using_beacon_of_hope
tag @a remove using_hopeful_sprint
tag @a remove using_shared_resolve

tag @a remove using_predatory_instincts
tag @a remove using_rapid_brutality
tag @a remove using_brutal_efficiency
tag @a remove using_unyielding_wrath
tag @a remove using_domination
tag @a remove using_floods_of_rage
tag @a remove using_pressure_point
tag @a remove using_overwhelming_presence
tag @a remove using_bane_of_solidarity
tag @a remove using_crippling_defeat
tag @a remove using_waiting_game

tag @a remove has_respawn_time
tag @a remove see_malevolent_aura_bar
tag @a remove see_banishment_glyph_bar
tag @a remove see_withering_surge_bar

scoreboard players set #stations_completed var 0

execute as @e[tag=station_completed] run tag @s add replenishment.station
execute as @e[tag=station_completed] run tag @s remove station_completed
execute as @e[tag=replenishment.station_deactivated] run tag @s add replenishment.station
execute as @e[tag=replenishment.station_deactivated] run tag @s remove replenishment.station_deactivated
scoreboard players set @e[tag=replenishment.station] replenish_amount 0

clear @a
kill @a
gamerule showDeathMessages true
gamerule naturalRegeneration true
kill @e[type=armor_stand,tag=warlock_armor_stand]
kill @e[tag=kill_on_end_game]
kill @e[type=armor_stand,tag=hunter_remnant]
execute as @a run attribute @s generic.scale base set 1
execute as @a run attribute @s player.entity_interaction_range base set 3
execute as @a run attribute @s generic.jump_strength base set 0.41999999
execute as @a run attribute @s generic.step_height base set 0.6
execute as @a run attribute @s generic.max_health base set 20
execute as @a run attribute @s generic.movement_speed base set 0.1
execute as @a run attribute @s generic.safe_fall_distance base set 3
execute as @a run attribute @s generic.gravity base set 0.08
execute as @a run attribute @s player.sneaking_speed base set 0.3
execute as @a run attribute @s player.sneaking_speed modifier remove juggernaut:quickened_stealth_speed

execute as @a run attribute @s generic.movement_speed modifier remove unyielding_wrath_1
execute as @a run attribute @s generic.movement_speed modifier remove unyielding_wrath_2
execute as @a run attribute @s generic.movement_speed modifier remove unyielding_wrath_3
execute as @a run attribute @s generic.movement_speed modifier remove unyielding_wrath_4
execute as @a run attribute @s generic.movement_speed modifier remove unyielding_wrath_5

scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] replenish_progress 0
scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal 0
scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] replenish_percentage 0
scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] total_replenishment_needed 0
scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] scout_reveal_timer 0

scoreboard players set @e[type=armor_stand,tag=replenishment.station] sentinel_progress 0

scoreboard players set @a lives 0
scoreboard players set @a game_deaths 0
scoreboard players set @a borrowed_damage 0
kill @e[type=armor_stand,tag=malevolent_aura]
kill @e[type=armor_stand,tag=banishment_glyph]
kill @e[type=armor_stand,tag=withering_surge]
team leave @a
gamemode adventure @a
stopsound @a