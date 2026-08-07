function juggernaut:ability_management/check_ability {\
    player_tag:"jester",\
    item_id:"minecraft:firework_star",\
    item_name:{"text": "Jest","color": "#f528d3"},\
    description:[{"text": "Trigger a random effect from a predefined list!","color": "gray"},{"text": "Cooldown: 30s","color": "dark_gray"}],\
    ability_id:"gamble",\
    cooldown:6,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"jester",\
    item_id:"minecraft:shulker_shell",\
    item_name:{"text": "Peekaboo","color": "#f528d3"},\
    description:[{"text": "Find out what the next three random effects will be in order!","color": "gray"},{"text": "Cooldown: 4s","color": "dark_gray"}],\
    ability_id:"query_rolls",\
    cooldown:4,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown1",\
}