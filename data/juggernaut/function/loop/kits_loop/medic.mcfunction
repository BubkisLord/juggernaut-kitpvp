# Medic

# Rescue (Active)
execute if entity @a[tag=medic] run function juggernaut:ability_management/check_ability {\
    player_tag:"medic",\
    item_id:"minecraft:nether_star",\
    item_name:{"text": "Rescue","color": "#A4D1EA"},\
    description:[{"text": "Teleport to another runner.","color": "gray"},{"text": "If there are no other runners, teleport to a spawn point.","color": "gray"},{"text": "Cannot be used if the juggernaut is within 20 blocks.","color": "gray"},{"text": "Cooldown: 2m","color": "dark_gray"}],\
    ability_id:"rescue",\
    cooldown:120,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"jug_kit_cooldown",\
}

# Heal (Active)
execute if entity @a[tag=medic] run function juggernaut:ability_management/check_ability {\
    player_tag:"medic",\
    item_id:"minecraft:glistering_melon_slice",\
    item_name:{"text": "Heal","color": "#dbbe2d"},\
    description:[{"text": "Heal all runners within 8 blocks.","color": "gray"},{"text": "Cooldown: 1m","color": "dark_gray"}],\
    ability_id:"heal",\
    cooldown:60,\
    hotbar_slot:"hotbar.4",\
    cooldown_var:"jug_kit_cooldown_2",\
}