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

team add blue
team add red
team add green
team add jug
team add runner