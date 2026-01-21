# Ghost
execute as @a[tag=jug_ghost,scores={is_sneaking=1}] at @s run effect give @s invisibility 1 0 true
execute as @a[tag=jug_ghost,scores={is_sneaking=1}] at @s run attribute @s jump_strength base set 0
execute as @a[tag=jug_ghost,scores={is_sneaking=1},tag=in_chase] at @s run function juggernaut:effects/apply_effect_silent {effect:"undetectable",duration:1}

execute as @a[tag=jug_ghost,scores={is_sneaking=1}] at @s run attribute @s sneaking_speed base set 0
execute as @a[tag=jug_ghost,scores={is_sneaking=0},tag=!is_not_replenishing,tag=!has_respawn_time] at @s run effect clear @s invisibility
execute as @a[tag=jug_ghost,scores={is_sneaking=0}] at @s run attribute @s jump_strength base set 0.42
execute as @a[tag=jug_ghost,scores={is_sneaking=0}] at @s run attribute @s sneaking_speed base set 0.3

execute as @a[tag=jug_ghost,scores={is_sneaking=1}] at @s run particle minecraft:ash ~ ~1 ~ 0.3 0.2 0.3 1 1 force @a

# Spectral Cloak (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"jug_ghost",\
    item_id:"minecraft:echo_shard",\
    item_name:{"text": "Spectral Cloak","color": "gray"},\
    description:[{"text": "Gain invisibility, become undetectable, and stop being able to replenish for 5 seconds","color": "gray"},{"text": "Cooldown: 50s","color": "dark_gray"}],\
    ability_id:"spectral_cloak",\
    cooldown:50,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"jug_kit_cooldown",\
}