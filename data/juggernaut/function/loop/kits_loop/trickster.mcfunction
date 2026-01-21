function juggernaut:ability_management/check_ability {\
    player_tag:"trickster",\
    item_id:"minecraft:amethyst_shard",\
    item_name:{"text": "Misty Step","color": "dark_aqua"},\
    description:[{"text": "Teleport randomly to a position within 8 blocks of the juggernaut.","color": "gray"},{"text": "Prioritises the highest points possible. Only usable in chase.","color": "gray"},{"text": "Cooldown: 25s","color": "dark_gray"}],\
    ability_id:"misty_step",\
    cooldown:25,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"jug_kit_cooldown",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"trickster",\
    item_id:"minecraft:prismarine_crystals",\
    item_name:{"text": "False Detection","color": "dark_purple"},\
    description:[{"text": "Make all replenishment stations look as if they are active to the juggernaut.","color": "gray"},{"text": "Cooldown: 2m","color": "dark_gray"}],\
    ability_id:"false_detection",\
    cooldown:120,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown_2",\
}