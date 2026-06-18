execute if items entity @s container.* minecraft:danger_pottery_sherd run tag @s add using_sentinel
execute if items entity @s container.* minecraft:danger_pottery_sherd run clear @s #decorated_pot_sherds
execute if items entity @s container.* minecraft:heart_pottery_sherd run tag @s add using_healer
execute if items entity @s container.* minecraft:heart_pottery_sherd run clear @s #decorated_pot_sherds
execute if items entity @s container.* minecraft:heartbreak_pottery_sherd run tag @s add using_no_caution
execute if items entity @s container.* minecraft:heartbreak_pottery_sherd run clear @s #decorated_pot_sherds
execute if items entity @s container.* minecraft:scrape_pottery_sherd run tag @s add using_blood_pact
execute if items entity @s container.* minecraft:scrape_pottery_sherd run clear @s #decorated_pot_sherds
execute if items entity @s container.* minecraft:burn_pottery_sherd run tag @s add using_second_wind
execute if items entity @s container.* minecraft:burn_pottery_sherd run clear @s #decorated_pot_sherds
execute if items entity @s container.* minecraft:flow_pottery_sherd run tag @s add using_quickened_stealth
execute if items entity @s container.* minecraft:flow_pottery_sherd run clear @s #decorated_pot_sherds
execute if items entity @s container.* minecraft:brewer_pottery_sherd run item replace entity @s hotbar.8 with splash_potion[potion_contents={potion:"strong_healing"},max_stack_size=2] 2 
execute if items entity @s container.* minecraft:brewer_pottery_sherd run clear @s #decorated_pot_sherds
execute if items entity @s container.* minecraft:skull_pottery_sherd run tag @s add using_undying_ties
execute if items entity @s container.* minecraft:skull_pottery_sherd run clear @s #decorated_pot_sherds
execute if items entity @s container.* minecraft:prize_pottery_sherd run tag @s add using_unwavering_strength
execute if items entity @s container.* minecraft:prize_pottery_sherd run clear @s #decorated_pot_sherds
execute if items entity @s container.* minecraft:friend_pottery_sherd run tag @s add using_durable
execute if items entity @s container.* minecraft:friend_pottery_sherd run effect give @s health_boost infinite 1 true
execute if items entity @s container.* minecraft:friend_pottery_sherd run effect give @s regeneration 2 255 true
execute if items entity @s container.* minecraft:friend_pottery_sherd run clear @s #decorated_pot_sherds
execute if items entity @s container.* minecraft:blade_pottery_sherd run tag @s add using_hopeful_sprint
execute if items entity @s container.* minecraft:blade_pottery_sherd run clear @s #decorated_pot_sherds