function juggernaut:ability_management/check_ability {\
    player_tag:"chain_hunter",\
    item_id:"minecraft:chain",\
    item_name:{"text": "Summon Chain Shot","color": "gray"},\
    description:[{"text": "Summons a chain shot that damages and slows enemies.","color": "gray"},{"text": "Cooldown: 20s","color": "dark_gray"}],\
    ability_id:"chain_shot",\
    cooldown:20,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"chain_hunter",\
    item_id:"minecraft:ghast_tear",\
    item_name:{"text": "Chain Pull","color": "gray"},\
    description:[{"text": "Pulls the runner you're looking at towards you.","color": "gray"},{"text": "Cooldown: 20s","color": "dark_gray"}],\
    ability_id:"chain_pull",\
    cooldown:20,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"jug_kit_cooldown_2",\
}