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
scoreboard objectives add sneak_time minecraft.custom:sneak_time
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
scoreboard objectives add chase_time dummy
scoreboard objectives add sentinel_progress dummy
scoreboard objectives add shadow_mark_cooldown dummy
scoreboard objectives add borrowed_time_remaining dummy
scoreboard objectives add replenish_amount dummy

team add blue
team add red
team add green
team add jug
team add runner
team add hider
team add seeker