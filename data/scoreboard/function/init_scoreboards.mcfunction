scoreboard objectives add var dummy
scoreboard objectives add tick_counter dummy
scoreboard objectives add raycast_limit dummy
scoreboard objectives add dispel_progress dummy
scoreboard objectives add temp_progress dummy
scoreboard objectives add game_deaths deathCount
scoreboard objectives add lives dummy
scoreboard objectives add grace_period dummy
scoreboard objectives add ability_cooldown0 dummy
scoreboard objectives add ability_cooldown1 dummy
scoreboard objectives add ability_cooldown2 dummy
scoreboard objectives add ability_cooldown3 dummy
scoreboard objectives add ability_cooldown4 dummy
scoreboard objectives add ability_cooldown5 dummy
scoreboard objectives add replenish_timeout dummy
scoreboard objectives add juggernaut_release_timer dummy
scoreboard objectives add total_replenishment_needed dummy
scoreboard objectives add health health
scoreboard objectives add replenish_progress dummy
scoreboard objectives add lives_remaining dummy
scoreboard objectives add current_raycast_depth dummy
scoreboard objectives add raycast_depth_counter dummy
scoreboard objectives add replenish_decimal dummy
scoreboard objectives add temp_max_progress dummy
scoreboard objectives add total_dispelling_needed dummy
scoreboard objectives add damage_taken minecraft.custom:minecraft.damage_taken
scoreboard objectives add jump_time minecraft.custom:minecraft.jump
scoreboard objectives add has_respawn_protection dummy
scoreboard objectives add healing_progress dummy
scoreboard objectives add healing_needed dummy
scoreboard objectives add healing_percent dummy
scoreboard objectives add is_sprinting minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add is_walking minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add is_crouch_walking minecraft.custom:minecraft.crouch_one_cm
scoreboard objectives add chase_time dummy
scoreboard objectives add sentinel_progress dummy
scoreboard objectives add replenish_amount dummy
scoreboard objectives add chase_timeout dummy
scoreboard objectives add brutal_efficiency_cooldown dummy
scoreboard objectives add unyielding_wrath_time dummy
scoreboard objectives add waiting_game_time dummy
scoreboard objectives add domination_movement_speed dummy
scoreboard objectives add grim_determination_speed dummy
scoreboard objectives add max_health dummy
scoreboard objectives add debug_mode dummy
scoreboard objectives add healing_base dummy
scoreboard objectives add healing_modifier dummy
scoreboard objectives add healing_per_tick dummy
scoreboard objectives add healing_display_speed dummy
scoreboard objectives add self_healing_base dummy
scoreboard objectives add self_healing_modifier dummy
scoreboard objectives add self_healing_per_tick dummy
scoreboard objectives add self_healing_display_speed dummy
scoreboard objectives add current_cooldown dummy
scoreboard objectives add tmp dummy
scoreboard objectives add runner_count dummy
scoreboard objectives add medic_heal_amount dummy
scoreboard objectives add jug_dmg minecraft.custom:minecraft.damage_dealt
scoreboard objectives add jug_ticker dummy
scoreboard objectives add round_robin dummy
scoreboard objectives add jug_kills minecraft.custom:minecraft.player_kills
scoreboard objectives add respawn_time_left dummy
scoreboard objectives add used_totem minecraft.used:minecraft.totem_of_undying
scoreboard objectives add perks_enabled dummy
scoreboard objectives add max_perks_equipped dummy
scoreboard objectives add random_perks dummy
scoreboard objectives add random_kits dummy
scoreboard objectives add perk_rerolls dummy
scoreboard objectives add shapeshift_time dummy
scoreboard objectives add completable_stations dummy
scoreboard objectives add replenishment_base dummy
scoreboard objectives add replenishment_modifier dummy
scoreboard objectives add replenishment_per_tick dummy
scoreboard objectives add replenishment_display_speed dummy
scoreboard objectives add random_perks dummy
scoreboard objectives add cooldown_modifier dummy
scoreboard objectives add overclock_damage dummy
scoreboard objectives add healing_time_left dummy
scoreboard objectives add healing_minutes dummy
scoreboard objectives add healing_seconds dummy
scoreboard objectives add undetectable_duration_left dummy
scoreboard objectives add ts_step dummy

# Initialise game state variable
scoreboard players set #game_state var 0

# Initialise default customisation variables
scoreboard players set #juggernaut_customisation round_robin 1
scoreboard players set #juggernaut_customisation juggernaut_count 1
scoreboard players set #juggernaut_customisation perks_enabled 1
scoreboard players set #juggernaut_customisation completable_stations 1
scoreboard players set #juggernaut_customisation debug_mode 0
scoreboard players set #juggernaut_customisation perk_rerolls 2
scoreboard players set #juggernaut_customisation max_perks_equipped 2
scoreboard players operation @a max_perks_equipped = #juggernaut_customisation max_perks_equipped

# Initialise default customisation variables
scoreboard players set #survival_customisation crate_count 8
scoreboard players set #survival_customisation teams_mode 1
scoreboard players set #survival_customisation has_legendaries 1

# Initialise variables for use in calculations
scoreboard players set #0 var 0
scoreboard players set #1 var 1
scoreboard players set #2 var 2
scoreboard players set #3 var 3
scoreboard players set #5 var 5
scoreboard players set #6 var 6
scoreboard players set #10 var 10
scoreboard players set #20 var 20
scoreboard players set #25 var 25
scoreboard players set #40 var 40
scoreboard players set #50 var 50
scoreboard players set #60 var 60
scoreboard players set #75 var 75
scoreboard players set #100 var 100
scoreboard players set #1000 var 1000
scoreboard players set #20000 var 20000

# Tips Management
scoreboard objectives add tips.data dummy
function tips:add

# Juggernaut Kit Statistics
scoreboard objectives add picked_kit_chameleon dummy "Picked Kit - Chameleon"
scoreboard objectives add kills_kit_chameleon dummy "Kills with Chameleon"
scoreboard objectives add chameleon_wins dummy "Wins with Chameleon"
scoreboard objectives add chameleon_losses dummy "Losses with Chameleon"

scoreboard objectives add picked_kit_dragon dummy "Picked Kit - Dragon"
scoreboard objectives add kills_kit_dragon dummy "Kills with Dragon"
scoreboard objectives add dragon_wins dummy "Wins with Dragon"
scoreboard objectives add dragon_losses dummy "Losses with Dragon"

scoreboard objectives add picked_kit_fishmonger dummy "Picked Kit - Fishmonger"
scoreboard objectives add kills_kit_fishmonger dummy "Kills with Fishmonger"
scoreboard objectives add fishmonger_wins dummy "Wins with Fishmonger"
scoreboard objectives add fishmonger_losses dummy "Losses with Fishmonger"

scoreboard objectives add picked_kit_hunter dummy "Picked Kit - Hunter"
scoreboard objectives add kills_kit_hunter dummy "Kills with Hunter"
scoreboard objectives add hunter_wins dummy "Wins with Hunter"
scoreboard objectives add hunter_losses dummy "Losses with Hunter"

scoreboard objectives add picked_kit_classic_juggernaut dummy "Picked Kit - Classic Juggernaut"
scoreboard objectives add kills_kit_classic_juggernaut dummy "Kills with Classic Juggernaut"
scoreboard objectives add classic_juggernaut_wins dummy "Wins with Classic Juggernaut"
scoreboard objectives add classic_juggernaut_losses dummy "Losses with Classic Juggernaut"

scoreboard objectives add picked_kit_knight dummy "Picked Kit - Knight"
scoreboard objectives add kills_kit_knight dummy "Kills with Knight"
scoreboard objectives add knight_wins dummy "Wins with Knight"
scoreboard objectives add knight_losses dummy "Losses with Knight"

scoreboard objectives add picked_kit_predator dummy "Picked Kit - Predator"
scoreboard objectives add kills_kit_predator dummy "Kills with Predator"
scoreboard objectives add predator_wins dummy "Wins with Predator"
scoreboard objectives add predator_losses dummy "Losses with Predator"

scoreboard objectives add picked_kit_spirit_walker dummy "Picked Kit - Spirit Walker"
scoreboard objectives add kills_kit_spirit_walker dummy "Kills with Spirit Walker"
scoreboard objectives add spirit_walker_wins dummy "Wins with Spirit Walker"
scoreboard objectives add spirit_walker_losses dummy "Losses with Spirit Walker"

scoreboard objectives add picked_kit_timekeeper dummy "Picked Kit - Timekeeper"
scoreboard objectives add kills_kit_timekeeper dummy "Kills with Timekeeper"
scoreboard objectives add timekeeper_wins dummy "Wins with Timekeeper"
scoreboard objectives add timekeeper_losses dummy "Losses with Timekeeper"

scoreboard objectives add picked_kit_warlock dummy "Picked Kit - Warlock"
scoreboard objectives add kills_kit_warlock dummy "Kills with Warlock"
scoreboard objectives add warlock_wins dummy "Wins with Warlock"
scoreboard objectives add warlock_losses dummy "Losses with Warlock"

scoreboard objectives add picked_kit_witch_doctor dummy "Picked Kit - Witch Doctor"
scoreboard objectives add kills_kit_witch_doctor dummy "Kills with Witch Doctor"
scoreboard objectives add witch_doctor_wins dummy "Wins with Witch Doctor"
scoreboard objectives add witch_doctor_losses dummy "Losses with Witch Doctor"

scoreboard objectives add picked_kit_phantom dummy "Picked Kit - Phantom"
scoreboard objectives add kills_kit_phantom dummy "Kills with Phantom"
scoreboard objectives add phantom_wins dummy "Wins with Phantom"
scoreboard objectives add phantom_losses dummy "Losses with Phantom"

# Runner Kit Statistics
scoreboard objectives add picked_kit_engineer dummy "Picked Engineer"
scoreboard objectives add engineer_wins dummy "Wins with Engineer"
scoreboard objectives add engineer_losses dummy "Losses with Engineer"

scoreboard objectives add picked_kit_escapist dummy "Picked Escapist"
scoreboard objectives add escapist_wins dummy "Wins with Escapist"
scoreboard objectives add escapist_losses dummy "Losses with Escapist"

scoreboard objectives add picked_kit_ghost dummy "Picked Ghost"
scoreboard objectives add ghost_wins dummy "Wins with Ghost"
scoreboard objectives add ghost_losses dummy "Losses with Ghost"

scoreboard objectives add picked_kit_guide dummy "Picked Guide"
scoreboard objectives add guide_wins dummy "Wins with Guide"
scoreboard objectives add guide_losses dummy "Losses with Guide"

scoreboard objectives add picked_kit_medic dummy "Picked Medic"
scoreboard objectives add medic_wins dummy "Wins with Medic"
scoreboard objectives add medic_losses dummy "Losses with Medic"

scoreboard objectives add picked_kit_rogue dummy "Picked Rogue"
scoreboard objectives add rogue_wins dummy "Wins with Rogue"
scoreboard objectives add rogue_losses dummy "Losses with Rogue"

scoreboard objectives add picked_kit_scout dummy "Picked Scout"
scoreboard objectives add scout_wins dummy "Wins with Scout"
scoreboard objectives add scout_losses dummy "Losses with Scout"

scoreboard objectives add picked_kit_survivor dummy "Picked Survivor"
scoreboard objectives add survivor_wins dummy "Wins with Survivor"
scoreboard objectives add survivor_losses dummy "Losses with Survivor"

scoreboard objectives add picked_kit_trickster dummy "Picked Trickster"
scoreboard objectives add trickster_wins dummy "Wins with Trickster"
scoreboard objectives add trickster_losses dummy "Losses with Trickster"

scoreboard objectives add picked_kit_windrunner dummy "Picked Windrunner"
scoreboard objectives add windrunner_wins dummy "Wins with Windrunner"
scoreboard objectives add windrunner_losses dummy "Losses with Windrunner"

scoreboard objectives add picked_kit_jester dummy "Picked Jester"
scoreboard objectives add jester_wins dummy "Wins with Jester"
scoreboard objectives add jester_losses dummy "Losses with Jester"

scoreboard objectives add picked_kit_puppeteer dummy "Picked Puppeteer"
scoreboard objectives add puppeteer_wins dummy "Wins with Puppeteer"
scoreboard objectives add puppeteer_losses dummy "Losses with Puppeteer"

# Puppeteer kit internals: owner linkage id, chosen ring slot, puppet lifetime timer, and the
# mannequin's tracked/baseline health (used to detect when it has taken damage).
scoreboard objectives add puppet_id dummy
scoreboard objectives add pp_slot dummy
scoreboard objectives add puppet_time dummy
scoreboard objectives add manne_hp dummy
scoreboard objectives add manne_full dummy

# Initialise teams
team add blue
team modify blue collisionRule always
team modify blue color blue
team modify blue prefix "[BLUE] "
team modify blue nametagVisibility always
team modify blue seeFriendlyInvisibles true
team add yellow
team modify yellow collisionRule always
team modify yellow color yellow
team modify yellow prefix "[YELLOW] "
team modify yellow nametagVisibility always
team modify yellow seeFriendlyInvisibles true
team add red
team modify red collisionRule always
team modify red color red
team modify red prefix "[RED] "
team modify red nametagVisibility always
team modify red seeFriendlyInvisibles true
team add green
team modify green collisionRule always
team modify green color green
team modify green prefix "[GREEN] "
team modify green nametagVisibility always
team modify green seeFriendlyInvisibles true

team add jug
team modify jug collisionRule never
team modify jug color red
team modify jug nametagVisibility always
team modify jug seeFriendlyInvisibles true
team add runner
team modify runner collisionRule pushOtherTeams
team modify runner color dark_aqua
team modify runner nametagVisibility always
team modify runner seeFriendlyInvisibles true

team add undetectable
team modify undetectable collisionRule never
team modify undetectable color dark_gray
team modify undetectable nametagVisibility never
team modify undetectable seeFriendlyInvisibles false
