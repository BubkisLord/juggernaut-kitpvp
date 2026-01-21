# Rogue
# Stealth Expertise (Passive)
execute as @a[tag=rogue,scores={is_sneaking=1}] run attribute @s step_height base set 1
execute as @a[tag=rogue,scores={is_sneaking=0}] run attribute @s step_height base set 0.6

# Smoke Bomb (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"rogue",\
    item_id:"minecraft:firework_star",\
    item_name:{"text": "Smoke Bomb","color": "#646464"},\
    description:[{"text": "Create a smoke cloud that obscures vision","color": "gray"},{"text": "and become invisible for 6 seconds.","color": "gray"},{"text": "Cooldown: 1m","color": "dark_gray"}],\
    ability_id:"smoke_bomb",\
    cooldown:60,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"jug_kit_cooldown",\
}

# Backstep (active)
function juggernaut:ability_management/check_ability {\
    player_tag:"rogue",\
    item_id:"minecraft:rabbit_foot",\
    item_name:{"text": "Backstep","color": "#646464"},\
    description:[{"text": "Create a spark around you","color": "gray"},{"text": "and teleport directly behind the juggernaut.","color": "gray"},{"text": "Cooldown: 1m","color": "dark_gray"}],\
    ability_id:"backstep",\
    cooldown:60,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown_2",\
}