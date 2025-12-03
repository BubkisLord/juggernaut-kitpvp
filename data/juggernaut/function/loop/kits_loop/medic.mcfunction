# Medic

# Rescue (Active)
execute if entity @a[tag=medic] run function juggernaut:ability_management/check_ability {\
    player_tag:"medic",\
    item_id:"minecraft:nether_star",\
    item_name:{"text": "Rescue","color": "#A4D1EA"},\
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
    ability_id:"heal",\
    cooldown:60,\
    hotbar_slot:"hotbar.4",\
    cooldown_var:"jug_kit_cooldown_2",\
}