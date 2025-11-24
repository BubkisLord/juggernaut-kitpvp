
execute if entity @a[tag=trickster] run function juggernaut:ability_management/check_ability {\
    player_tag:"trickster",\
    item_id:"minecraft:amethyst_shard",\
    item_name:{"text": "Misty Step","color": "dark_aqua"},\
    ability_id:"misty_step",\
    cooldown:25,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"jug_kit_cooldown",\
}

execute if entity @a[tag=trickster] run function juggernaut:ability_management/check_ability {\
    player_tag:"trickster",\
    item_id:"minecraft:prismarine_crystals",\
    item_name:{"text": "False Detection","color": "dark_purple"},\
    ability_id:"false_detection",\
    cooldown:120,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown_2",\
}