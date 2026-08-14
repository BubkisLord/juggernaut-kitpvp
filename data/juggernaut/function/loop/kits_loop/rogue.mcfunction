# Rogue
# Stealth Expertise (Passive)
# Sneaking step height is set to 1.0625 here as carpets are 0.0625 blocks high, and rogue should be able to shift down carpeted blocks.
execute as @a[tag=rogue,predicate=is_sneaking] run attribute @s step_height base set 1.0625
execute as @a[tag=rogue,predicate=!is_sneaking] run attribute @s step_height base set 0.6
execute as @a[tag=rogue,predicate=is_crouch_walking] run attribute @s movement_speed modifier add minecraft:sprinting 0.3 add_multiplied_base

# Smoke Bomb (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"rogue",\
    item_id:"minecraft:firework_star",\
    item_name:{"text": "Smoke Bomb","color": "#646464"},\
    description:[{"text": "Create a smoke cloud that obscures vision","color": "gray"},{"text": "and become invisible for 6 seconds.","color": "gray"},{"text": "Cooldown: 60s","color": "dark_gray"}],\
    ability_id:"smoke_bomb",\
    cooldown:60,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}

# Backstep (active)
function juggernaut:ability_management/check_ability {\
    player_tag:"rogue",\
    item_id:"minecraft:rabbit_foot",\
    item_name:{"text": "Backstep","color": "#646464"},\
    description:[{"text": "Create a spark around you","color": "gray"},{"text": "and teleport directly behind the juggernaut.","color": "gray"},{"text": "Cooldown: 30s","color": "dark_gray"}],\
    ability_id:"backstep",\
    cooldown:30,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown1",\
}