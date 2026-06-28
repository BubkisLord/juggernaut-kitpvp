# Ghost
execute as @a[tag=ghost,scores={is_sneaking=1}] at @s unless block ~ ~ ~ #juggernaut:underwater_permeables run effect give @s invisibility 1 0 true
execute as @a[tag=ghost,scores={is_sneaking=1}] at @s unless block ~ ~ ~ #juggernaut:underwater_permeables run attribute @s jump_strength modifier add juggernaut:ghost_sneaking_effects -100 add_multiplied_total
execute as @a[tag=ghost,scores={is_sneaking=1}] at @s unless block ~ ~ ~ #juggernaut:underwater_permeables run function juggernaut:effects/apply_effect_silent {effect:"undetectable",duration:1}

execute as @a[tag=ghost,scores={is_sneaking=1}] at @s unless block ~ ~ ~ #juggernaut:underwater_permeables run attribute @s sneaking_speed modifier add juggernaut:ghost_sneaking_effects -100 add_multiplied_total
execute as @a[tag=ghost,scores={is_sneaking=0},tag=!spectral_cloak_active,tag=!has_respawn_time] at @s run effect clear @s invisibility
execute as @a[tag=ghost,scores={is_sneaking=0}] at @s run attribute @s jump_strength modifier remove juggernaut:ghost_sneaking_effects
execute as @a[tag=ghost,scores={is_sneaking=0}] at @s run attribute @s sneaking_speed modifier remove juggernaut:ghost_sneaking_effects

execute as @a[tag=ghost,scores={is_sneaking=1}] at @s unless block ~ ~ ~ #juggernaut:underwater_permeables run particle minecraft:ash ~ ~1 ~ 0.3 0.2 0.3 1 1 force @a

# Spectral Cloak (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"ghost",\
    item_id:"minecraft:echo_shard",\
    item_name:{"text": "Spectral Cloak","color": "gray"},\
    description:[{"text": "Gain invisibility, become undetectable, and stop being able to replenish for 5 seconds","color": "gray"},{"text": "Cooldown: 50s","color": "dark_gray"}],\
    ability_id:"spectral_cloak",\
    cooldown:50,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}