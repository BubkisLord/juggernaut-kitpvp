execute as @a[tag=juggernaut_manager] run tag @s add juggernaut_manager
execute as @a[tag=surv_game_manager] run tag @s add surv_game_manager
scoreboard objectives add var dummy
scoreboard objectives add king_of_the_hill_points dummy
scoreboard objectives add juggernaut_game_time dummy
scoreboard objectives add tick_counter dummy
scoreboard objectives add malevolent_aura_cooldown dummy
scoreboard objectives add replenish_percentage dummy
scoreboard objectives add points dummy
scoreboard objectives add raycast_limit dummy
scoreboard objectives add dispel_progress dummy
scoreboard objectives add damage_dealt minecraft.custom:damage_dealt
scoreboard objectives add temp_progress dummy
scoreboard objectives add borrowed_damage dummy
scoreboard objectives add game_deaths dummy
scoreboard objectives add lives dummy
scoreboard objectives add grace_period dummy
scoreboard objectives add banishment_glyph_cooldown dummy
scoreboard objectives add jug_kit_cooldown dummy
scoreboard objectives add jug_kit_cooldown_2 dummy
scoreboard objectives add replenish_timeout dummy
scoreboard objectives add juggernaut_release_timer dummy
scoreboard objectives add total_replenishment_needed dummy
scoreboard objectives add revealing_tower_cooldown dummy
scoreboard objectives add replenishment_tower_cooldown dummy
scoreboard objectives add health health
scoreboard objectives add replenish_progress dummy
scoreboard objectives add lives_remaining dummy
scoreboard objectives add current_raycast_depth dummy
scoreboard objectives add scout_reveal_timer dummy
scoreboard objectives add replenish_decimal dummy
scoreboard objectives add borrowed_damage_taken minecraft.custom:damage_dealt_resisted
scoreboard objectives add withering_surge_cooldown dummy
scoreboard objectives add temp_max_progress dummy
scoreboard objectives add total_dispelling_needed dummy
scoreboard objectives add damage_taken minecraft.custom:damage_taken
scoreboard objectives add ryujins_wrath dummy
scoreboard objectives add hunt_cooldown dummy
scoreboard objectives add point_kills minecraft.custom:player_kills
scoreboard objectives add killstreak minecraft.custom:player_kills
scoreboard objectives add xpbar xp
scoreboard objectives add seeker_release_timer dummy
scoreboard objectives add hide_and_seek_game_time dummy
scoreboard objectives add seeker_count dummy
scoreboard objectives add aura_sound dummy
scoreboard objectives add ambushDisplay dummy
scoreboard objectives add scattered_steps_duration dummy
scoreboard objectives add bushido_flow dummy
scoreboard objectives add pirateKills dummy
scoreboard objectives add assassinActivate dummy
scoreboard objectives add ambushCounter dummy
scoreboard objectives add kitTokens dummy
scoreboard objectives add kitPurchase dummy
scoreboard objectives add fav1trigger dummy
scoreboard objectives add fav2trigger dummy
scoreboard objectives add fav3trigger dummy
scoreboard objectives add second_counter dummy
scoreboard objectives add blinker_tp_timeout dummy
scoreboard objectives add max_blinker_cooldown dummy
scoreboard objectives add blinker_cooldown_percent dummy
scoreboard objectives add is_sneaking minecraft.custom:sneak_time
scoreboard objectives add jump_time minecraft.custom:jump
scoreboard objectives add damage_absorbed custom:damage_absorbed
scoreboard objectives add turret_cooldown dummy
scoreboard objectives add lobby_clearcount dummy
scoreboard objectives add replenish_counter dummy
scoreboard objectives add seconds dummy
scoreboard objectives add tutorialPurchase dummy
scoreboard objectives add kitsnotunlocked dummy
scoreboard objectives add kitsunlocked dummy
scoreboard objectives add skip_prompt dummy
scoreboard objectives add dummyKills dummy
scoreboard objectives add kitSelect dummy
scoreboard objectives add TokenGain dummy
scoreboard objectives add TokenGainCounter dummy
scoreboard objectives add unlockall dummy
scoreboard objectives add exit_count dummy
scoreboard objectives add replenish_cd dummy
scoreboard objectives add kills playerKillCount
scoreboard objectives add deaths deathCount
scoreboard objectives add bow minecraft.used:bow
scoreboard objectives add crossbow minecraft.used:crossbow
scoreboard objectives add trident minecraft.used:trident
scoreboard objectives add has_respawn_time dummy
scoreboard objectives add healing_progress dummy
scoreboard objectives add healing_needed dummy
scoreboard objectives add healing_percent dummy
scoreboard objectives add is_sprinting minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add is_walking minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add is_crouch_walking minecraft.custom:minecraft.crouch_one_cm
scoreboard objectives add chase_time dummy
scoreboard objectives add sentinel_progress dummy
scoreboard objectives add shadow_mark_cooldown dummy
scoreboard objectives add borrowed_time_remaining dummy
scoreboard objectives add replenish_amount dummy
scoreboard objectives add chase_timeout dummy
scoreboard objectives add brutal_efficiency_cooldown dummy
scoreboard objectives add unyielding_wrath_time dummy
scoreboard objectives add unyielding_wrath_stacks dummy
scoreboard objectives add domination_kills minecraft.custom:player_kills
scoreboard objectives add domination_movement_speed dummy
scoreboard objectives add ticks_spent_replenishing dummy
scoreboard objectives add ticks_spent_buffing dummy
scoreboard objectives add ticks_spent_debuffing dummy
scoreboard objectives add ticks_till_increment dummy
scoreboard objectives add ticks_till_decrement dummy
scoreboard objectives add replenish_buff dummy
scoreboard objectives add replenish_debuff dummy
scoreboard objectives add beacon_of_hope_cooldown dummy
scoreboard objectives add beacon_of_hope_duration dummy
scoreboard objectives add ticks_spent_on_ability_buff dummy
scoreboard objectives add ticks_spent_on_ability_debuff dummy
scoreboard objectives add ticks_spent_on_ability dummy
scoreboard objectives add ticks_till_decrement_ability dummy
scoreboard objectives add ticks_till_increment_ability dummy
scoreboard objectives add ability_debuff dummy
scoreboard objectives add ability_buff dummy
scoreboard objectives add grim_determination_speed dummy
scoreboard objectives add max_health dummy
scoreboard objectives add speed_pot_cooldown dummy
scoreboard objectives add fire_pot_cooldown dummy
scoreboard objectives add strength_pot_cooldown dummy
scoreboard objectives add quit minecraft.custom:minecraft.leave_game
scoreboard objectives add replenish_modifier dummy
scoreboard objectives add debug_mode dummy
scoreboard objectives add replenish_speed dummy
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
scoreboard objectives add tick_speed dummy
scoreboard objectives add runner_count dummy
scoreboard objectives add jug_kit_cooldown_3 dummy
scoreboard objectives add medic_heal_amount dummy

# Juggernaut Kit Statistics
scoreboard objectives add picked_kit_chameleon dummy "Picked Kit - Chameleon"
scoreboard objectives add kills_kit_chameleon dummy "Kills with Chameleon"
scoreboard objectives add global_chameleon_wins dummy "Global Wins with Chameleon"
scoreboard objectives add global_chameleon_losses dummy "Global Losses with Chameleon"

scoreboard objectives add picked_kit_dragon dummy "Picked Kit - Dragon"
scoreboard objectives add kills_kit_dragon dummy "Kills with Dragon"
scoreboard objectives add global_dragon_wins dummy "Global Wins with Dragon"
scoreboard objectives add global_dragon_losses dummy "Global Losses with Dragon"

scoreboard objectives add picked_kit_eclipse_stalker dummy "Picked Kit - Eclipse Stalker"
scoreboard objectives add kills_kit_eclipse_stalker dummy "Kills with Eclipse Stalker"
scoreboard objectives add global_eclipse_stalker_wins dummy "Global Wins with Eclipse Stalker"
scoreboard objectives add global_eclipse_stalker_losses dummy "Global Losses with Eclipse Stalker"

scoreboard objectives add picked_kit_fishmonger dummy "Picked Kit - Fishmonger"
scoreboard objectives add kills_kit_fishmonger dummy "Kills with Fishmonger"
scoreboard objectives add global_fishmonger_wins dummy "Global Wins with Fishmonger"
scoreboard objectives add global_fishmonger_losses dummy "Global Losses with Fishmonger"

scoreboard objectives add picked_kit_hunter dummy "Picked Kit - Hunter"
scoreboard objectives add kills_kit_hunter dummy "Kills with Hunter"
scoreboard objectives add global_hunter_wins dummy "Global Wins with Hunter"
scoreboard objectives add global_hunter_losses dummy "Global Losses with Hunter"

scoreboard objectives add picked_kit_classic_juggernaut dummy "Picked Kit - Classic Juggernaut"
scoreboard objectives add kills_kit_classic_juggernaut dummy "Kills with Classic Juggernaut"
scoreboard objectives add global_classic_juggernaut_wins dummy "Global Wins with Classic Juggernaut"
scoreboard objectives add global_classic_juggernaut_losses dummy "Global Losses with Classic Juggernaut"

scoreboard objectives add picked_kit_knight dummy "Picked Kit - Knight"
scoreboard objectives add kills_kit_knight dummy "Kills with Knight"
scoreboard objectives add global_knight_wins dummy "Global Wins with Knight"
scoreboard objectives add global_knight_losses dummy "Global Losses with Knight"

scoreboard objectives add picked_kit_predator dummy "Picked Kit - Predator"
scoreboard objectives add kills_kit_predator dummy "Kills with Predator"
scoreboard objectives add global_predator_wins dummy "Global Wins with Predator"
scoreboard objectives add global_predator_losses dummy "Global Losses with Predator"

scoreboard objectives add picked_kit_spirit_walker dummy "Picked Kit - Spirit Walker"
scoreboard objectives add kills_kit_spirit_walker dummy "Kills with Spirit Walker"
scoreboard objectives add global_spirit_walker_wins dummy "Global Wins with Spirit Walker"
scoreboard objectives add global_spirit_walker_losses dummy "Global Losses with Spirit Walker"

scoreboard objectives add picked_kit_timekeeper dummy "Picked Kit - Timekeeper"
scoreboard objectives add kills_kit_timekeeper dummy "Kills with Timekeeper"
scoreboard objectives add global_timekeeper_wins dummy "Global Wins with Timekeeper"
scoreboard objectives add global_timekeeper_losses dummy "Global Losses with Timekeeper"

scoreboard objectives add picked_kit_warlock dummy "Picked Kit - Warlock"
scoreboard objectives add kills_kit_warlock dummy "Kills with Warlock"
scoreboard objectives add global_warlock_wins dummy "Global Wins with Warlock"
scoreboard objectives add global_warlock_losses dummy "Global Losses with Warlock"

scoreboard objectives add picked_kit_witch_doctor dummy "Picked Kit - Witch Doctor"
scoreboard objectives add kills_kit_witch_doctor dummy "Kills with Witch Doctor"
scoreboard objectives add global_witch_doctor_wins dummy "Global Wins with Witch Doctor"
scoreboard objectives add global_witch_doctor_losses dummy "Global Losses with Witch Doctor"

# Runner Kit Statistics
scoreboard objectives add picked_kit_engineer dummy "Picked Runner Kit - Engineer"
scoreboard objectives add replenishment_kit_engineer dummy "Replenishment with Engineer"
scoreboard objectives add global_engineer_wins dummy "Global Wins with Engineer"
scoreboard objectives add global_engineer_losses dummy "Global Losses with Engineer"

scoreboard objectives add picked_kit_escapist dummy "Picked Runner Kit - Escapist"
scoreboard objectives add replenishment_kit_escapist dummy "Replenishment with Escapist"
scoreboard objectives add global_escapist_wins dummy "Global Wins with Escapist"
scoreboard objectives add global_escapist_losses dummy "Global Losses with Escapist"

scoreboard objectives add picked_kit_ghost dummy "Picked Runner Kit - Ghost"
scoreboard objectives add replenishment_kit_ghost dummy "Replenishment with Ghost"
scoreboard objectives add global_ghost_wins dummy "Global Wins with Ghost"
scoreboard objectives add global_ghost_losses dummy "Global Losses with Ghost"

scoreboard objectives add picked_kit_guide dummy "Picked Runner Kit - Guide"
scoreboard objectives add replenishment_kit_guide dummy "Replenishment with Guide"
scoreboard objectives add global_guide_wins dummy "Global Wins with Guide"
scoreboard objectives add global_guide_losses dummy "Global Losses with Guide"

scoreboard objectives add picked_kit_medic dummy "Picked Runner Kit - Medic"
scoreboard objectives add replenishment_kit_medic dummy "Replenishment with Medic"
scoreboard objectives add global_medic_wins dummy "Global Wins with Medic"
scoreboard objectives add global_medic_losses dummy "Global Losses with Medic"

scoreboard objectives add picked_kit_rogue dummy "Picked Runner Kit - Rogue"
scoreboard objectives add replenishment_kit_rogue dummy "Replenishment with Rogue"
scoreboard objectives add global_rogue_wins dummy "Global Wins with Rogue"
scoreboard objectives add global_rogue_losses dummy "Global Losses with Rogue"

scoreboard objectives add picked_kit_scout dummy "Picked Runner Kit - Scout"
scoreboard objectives add replenishment_kit_scout dummy "Replenishment with Scout"
scoreboard objectives add global_scout_wins dummy "Global Wins with Scout"
scoreboard objectives add global_scout_losses dummy "Global Losses with Scout"

scoreboard objectives add picked_kit_survivor dummy "Picked Runner Kit - Survivor"
scoreboard objectives add replenishment_kit_survivor dummy "Replenishment with Survivor"
scoreboard objectives add global_survivor_wins dummy "Global Wins with Survivor"
scoreboard objectives add global_survivor_losses dummy "Global Losses with Survivor"

scoreboard objectives add picked_kit_trickster dummy "Picked Runner Kit - Trickster"
scoreboard objectives add replenishment_kit_trickster dummy "Replenishment with Trickster"
scoreboard objectives add global_trickster_wins dummy "Global Wins with Trickster"
scoreboard objectives add global_trickster_losses dummy "Global Losses with Trickster"

team add blue
team add yellow
team add red
team add green
team add jug
team add runner
team add hider
team add seeker
team add test