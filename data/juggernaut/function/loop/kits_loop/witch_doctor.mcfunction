execute as @a[tag=runner,tag=!spectator] unless entity @s[nbt={active_effects:[{id:"minecraft:invisibility"}]}] if score @s health matches 1.. if score @s lives_remaining matches 1.. at @s run summon area_effect_cloud ~ ~ ~ {Duration:20,Tags:["kill_on_end_game"],custom_particle:{type:"minecraft:dust",color:[1.0,0.0,0.0],scale:1.0},Radius:0.5f}


function juggernaut:ability_management/check_ability {\
    player_tag:"witch_doctor",\
    item_id:"minecraft:cyan_dye",\
    item_name:{"text": "Speed","color": "dark_aqua"},\
    description:[{"text": "Grants a speed boost for a short duration.","color": "gray"},{"text": "Cooldown: 60s","color": "dark_gray"}],\
    ability_id:"speed_pot",\
    cooldown:60,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"speed_pot_cooldown",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"witch_doctor",\
    item_id:"minecraft:red_dye",\
    item_name:{"text": "Fire Resistance","color": "red"},\
    description:[{"text": "Grants fire resistance for a short duration.","color": "gray"},{"text": "Cooldown: 60s","color": "dark_gray"}],\
    ability_id:"fire_pot",\
    cooldown:60,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"fire_pot_cooldown",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"witch_doctor",\
    item_id:"minecraft:orange_dye",\
    item_name:{"text": "Strength","color": "gold"},\
    description:[{"text": "Grants a strength boost for a short duration.","color": "gray"},{"text": "Cooldown: 60s","color": "dark_gray"}],\
    ability_id:"strength_pot",\
    cooldown:60,\
    hotbar_slot:"hotbar.4",\
    cooldown_var:"strength_pot_cooldown",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"witch_doctor",\
    item_id:"minecraft:ghast_tear",\
    item_name:{"text": "Enlarge","color": "dark_purple"},\
    description:[{"text": "Increases size of all runners within 8 blocks.","color": "gray"},{"text": "They are given:","color": "gray"},{"text": "  - Increased Step Height (+1 block)","color": "gray"},{"text": "  - Decreased Movement Speed (-30%)","color": "gray"},{"text": "  - Increased Jump Height (+31%)","color": "gray"},{"text": "  - Increased Safe Fall Distance (+1 block)","color": "gray"},{"text": "","color": "gray"},{"text": "Lasts for 10 seconds.","color": "gray"},{"text": "Cooldown: 30s","color": "dark_gray"}],\
    ability_id:"enlarge",\
    cooldown:30,\
    hotbar_slot:"hotbar.6",\
    cooldown_var:"jug_kit_cooldown",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"witch_doctor",\
    item_id:"minecraft:ghast_tear",\
    item_name:{"text": "Reduce","color": "dark_purple"},\
    description:[{"text": "Decreases your size.","color": "gray"},{"text": "You are given:","color": "gray"},{"text": "  - Increased Movement Speed (+10%)","color": "gray"},{"text": "  - Decreased Step Height (-0.1 block)","color": "gray"},{"text": "","color": "gray"},{"text": "Lasts for 10 seconds.","color": "gray"},{"text": "Cooldown: 20s","color": "dark_gray"}],\
    ability_id:"reduce",\
    cooldown:20,\
    hotbar_slot:"hotbar.7",\
    cooldown_var:"jug_kit_cooldown_2",\
}