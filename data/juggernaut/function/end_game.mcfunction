scoreboard players set #game_state var 0
scoreboard players set @a juggernaut_release_timer 0
scoreboard players set @a ability_cooldown0 0
scoreboard players set @a ability_cooldown1 0
scoreboard players set @a ability_cooldown2 0
scoreboard players set @a ability_cooldown3 0
scoreboard players set @a brutal_efficiency_cooldown 0
scoreboard players set @a unyielding_wrath_time 0
scoreboard players set @a waiting_game_time 0
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
scoreboard players set @a shapeshift_time 0
scoreboard players set @a replenishment_base 0
scoreboard players set @a replenishment_modifier 0
scoreboard players set @a replenishment_per_tick 0
scoreboard players set @a replenishment_display_speed 0

execute as @e[type=armor_stand,tag=replenishment.station] run data modify entity @s CustomNameVisible set value 0b

execute as @a run attribute @s name_tag_distance modifier remove juggernaut:name_tag_distance
execute as @a run attribute @s waypoint_receive_range base reset
execute as @a run attribute @s waypoint_transmit_range base reset

spawnpoint @a 2000 100 0
gamerule show_death_messages false
tag @a remove has_jug_kit
tag @a remove juggernaut
tag @a remove runner
tag @a remove spectator
tag @a remove classic_jug
tag @a remove predator
tag @a remove witch_doctor
tag @a remove medic
tag @a remove survivor
tag @a remove escapist
tag @a remove rogue
tag @a remove scout
tag @a remove engineer
tag @a remove warlock
tag @a remove hunter
tag @a remove is_hunting
tag @a remove has_hunters_mark
tag @a remove dragon
tag @a remove is_floating
tag @a remove blinker
tag @a remove spirit_walker
tag @a remove guide
tag @e remove sentinel_tower
tag @a remove ghost
tag @a remove trickster
tag @a remove fishmonger
tag @a remove timekeeper
tag @a remove knight
tag @a remove chameleon
tag @a remove using_horse
tag @a remove on_horse
tag @a remove windrunner
tag @a remove double_chase_progress
tag @a remove spectral_cloak_active
tag @a remove phantom
tag @a remove pursued
tag @a remove jester
tag @a remove puppeteer
tag @a remove has_mannequin
tag @a remove has_puppets
tag @e[type=armor_stand] remove haunted_station
tag @a add lobby.player

tag @a remove has_respawn_time
tag @a remove see_malevolent_aura_bar
tag @a remove see_banishment_glyph_bar
tag @a remove see_withering_surge_bar
tag @a remove see_revealing_tower_bar

tag @a remove hunted

tag @a remove shapeshift_target
tag @a remove saved_skin
tag @a remove shapeshifting
tag @a remove not_phasing
tag @a remove is_phasing
tag @a remove is_being_healed

tag @a remove rewinding
execute as @a run attribute @s movement_speed modifier remove juggernaut:predator_move_spd
execute as @a run attribute @s movement_speed modifier remove juggernaut:fury

execute as @a run attribute @s sneaking_speed modifier remove juggernaut:adept_stalker

execute as @a run function juggernaut:perk_management/remove_perks

execute as @a run attribute @s bounciness base reset
execute as @a run attribute @s air_drag_modifier base reset
execute as @a run attribute @s friction_modifier base reset
execute as @a run attribute @s jump_strength base reset
execute as @a run attribute @s safe_fall_distance base reset

setblock -62 71 -29 brown_carpet replace

scoreboard players set #stations_completed var 0

execute as @e[type=armor_stand,tag=station_completed] run tag @s add replenishment.station
execute as @e[type=armor_stand,tag=station_completed] run tag @s remove station_completed
execute as @e[type=armor_stand,tag=replenishment.station_deactivated] run tag @s add replenishment.station
execute as @e[type=armor_stand,tag=replenishment.station_deactivated] run tag @s remove replenishment.station_deactivated
scoreboard players set @e[type=armor_stand,tag=replenishment.station] replenish_amount 0

execute as @a run function juggernaut:effects/clear_effect {effect:"not_replenishing"}
execute as @a run function juggernaut:effects/clear_effect {effect:"undetectable"}
execute as @a run function juggernaut:effects/clear_effect {effect:"risky_business"}

execute as @a run scoreboard players set @s chase_timeout 0
execute as @a run tag @s remove in_chase
execute as @a run tag @s remove undying_ties_target
tag @e[type=armor_stand] remove highest_station

team modify runner nametagVisibility always

time set noon

clear @a
kill @a
gamerule show_death_messages true
gamerule natural_health_regeneration true
kill @e[type=armor_stand,tag=warlock_armor_stand]
kill @e[tag=kill_on_end_game]
kill @e[type=armor_stand,tag=hunter_remnant]
execute as @a run attribute @s scale base reset
execute as @a run attribute @s entity_interaction_range base reset
execute as @a run attribute @s jump_strength base reset
execute as @a run attribute @s step_height base reset
execute as @a run attribute @s max_health base reset
execute as @a run attribute @s movement_speed base reset
execute as @a run attribute @s safe_fall_distance base reset
execute as @a run attribute @s gravity base reset
execute as @a run attribute @s sneaking_speed base reset
execute as @a run attribute @s attack_damage base reset
execute as @a run attribute @s water_movement_efficiency base reset
execute as @a run attribute @s sneaking_speed modifier remove juggernaut:quickened_stealth_speed
execute as @a run attribute @s scale modifier remove teeny_weeny
execute as @a run attribute @s sneaking_speed modifier remove juggernaut:ghost_sneaking_effects
execute as @a run attribute @s jump_strength modifier remove juggernaut:ghost_sneaking_effects
execute as @a run attribute @s friction_modifier modifier remove juggernaut:windrunner
execute as @a run attribute @s bounciness modifier remove juggernaut:windrunner
execute as @a run attribute @s sneaking_speed modifier remove juggernaut:dragon_flight
execute as @a run attribute @s camera_distance modifier remove juggernaut:chameleon_shapeshift
execute as @a run attribute @s movement_speed modifier remove juggernaut:phantom_move_spd

xp set @a 0 levels
xp set @a 0 points

scoreboard players set #juggernaut_manager replenish_progress 0
scoreboard players set #juggernaut_manager replenish_decimal 0
scoreboard players set #juggernaut_manager total_replenishment_needed 0

scoreboard players set @e[type=armor_stand,tag=replenishment.station] sentinel_progress 0

scoreboard players set @a lives 0
scoreboard players set @a game_deaths 0
scoreboard players set @a jug_kills 0
scoreboard players set @a used_totem 0
scoreboard players set @a ts_step 0

scoreboard players set @a perk_rerolls 0

scoreboard players set #engineer_count var 0
scoreboard players set #escapist_count var 0
scoreboard players set #ghost_count var 0
scoreboard players set #guide_count var 0
scoreboard players set #medic_count var 0
scoreboard players set #rogue_count var 0
scoreboard players set #scout_count var 0
scoreboard players set #survivor_count var 0
scoreboard players set #trickster_count var 0
scoreboard players set #puppeteer_count var 0
scoreboard players set #windrunner_count var 0
scoreboard players set #chameleon_count var 0
scoreboard players set #dragon_count var 0
scoreboard players set #fishmonger_count var 0
scoreboard players set #hunter_count var 0
scoreboard players set #classic_juggernaut_count var 0
scoreboard players set #knight_count var 0
scoreboard players set #predator_count var 0
scoreboard players set #spirit_walker_count var 0
scoreboard players set #timekeeper_count var 0
scoreboard players set #warlock_count var 0
scoreboard players set #witch_doctor_count var 0
scoreboard players set #phantom_count var 0
scoreboard players set #jester_count var 0
scoreboard players set #puppeteer_count var 0

bossbar remove warlock:revealing_tower
bossbar remove warlock:malevolent_aura
bossbar remove warlock:banishment_glyph
bossbar remove warlock:withering_surge

# stopwatch remove replenishment_minigame_timer

kill @e[type=armor_stand,tag=malevolent_aura]
kill @e[type=armor_stand,tag=banishment_glyph]
kill @e[type=armor_stand,tag=withering_surge]
weather clear 9999999
team leave @a
gamemode adventure @a
stopsound @a

stopsound @a master entity.enderman.teleport

execute store result storage juggernaut:salt salt int 1 run random value 0..2147483646
function juggernaut:reset_randomness with storage juggernaut:salt
