# Guide
execute if entity @a[tag=guide] run function juggernaut:ability_management/check_ability {\
    player_tag:"guide",\
    item_id:"minecraft:ender_eye",\
    item_name:'{"text": "Replenish Boost","color": "#FFD700"}',\
    ability_id:"replenish_boost",\
    cooldown:50,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"jug_kit_cooldown",\
}



# Escapist
execute if entity @a[tag=escapist] run function juggernaut:ability_management/check_ability {\
    player_tag:"escapist",\
    item_id:"minecraft:gunpowder",\
    item_name:'{"text": "Flee Powder","color": "#646464"}',\
    ability_id:"escapist_ability",\
    cooldown:60,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"jug_kit_cooldown",\
}



# Rogue
execute if entity @a[tag=rogue] run function juggernaut:ability_management/check_ability {\
    player_tag:"rogue",\
    item_id:"minecraft:firework_star",\
    item_name:'{"text": "Smoke Bomb","color": "#646464"}',\
    ability_id:"smoke_bomb",\
    cooldown:60,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"jug_kit_cooldown",\
}



# Medic
execute if entity @a[tag=medic] run function juggernaut:ability_management/check_ability {\
    player_tag:"medic",\
    item_id:"minecraft:nether_star",\
    item_name:'{"text": "Rescue","color": "#A4D1EA"}',\
    ability_id:"rescue",\
    cooldown:120,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"jug_kit_cooldown",\
}

execute if entity @a[tag=medic] run function juggernaut:ability_management/check_ability {\
    player_tag:"medic",\
    item_id:"minecraft:glistering_melon_slice",\
    item_name:'{"text": "Heal","color": "#dbbe2d"}',\
    ability_id:"heal",\
    cooldown:60,\
    hotbar_slot:"hotbar.4",\
    cooldown_var:"jug_kit_cooldown_2",\
}



# Scout
execute if entity @a[tag=scout] run function juggernaut:ability_management/check_ability {\
    player_tag:"scout",\
    item_id:"minecraft:glowstone_dust",\
    item_name:'{"text": "Revealing Powder","color": "gold"}',\
    ability_id:"reveal_jugs",\
    cooldown:25,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown",\
}



# Survivor
# execute if entity @a[tag=survivor] run function juggernaut:ability_management/check_ability {\
#     player_tag:"survivor",\
#     item_id:"minecraft:stone",\
#     item_name:'{"text": "Resistance Stone","color": "#A4D1EA"}',\
#     ability_id:0,\
#     cooldown:60,\
#     hotbar_slot:"hotbar.1",\
#     cooldown_var:"jug_kit_cooldown",\
# }



# Engineer
execute if entity @a[tag=engineer] run function juggernaut:ability_management/check_ability {\
    player_tag:"engineer",\
    item_id:"minecraft:gold_block",\
    item_name:'{"text": "Spawn Revealing Tower","color": "gold"}',\
    ability_id:"revealing_tower",\
    cooldown:90,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"revealing_tower_cooldown",\
}

execute if entity @a[tag=engineer] run function juggernaut:ability_management/check_ability {\
    player_tag:"engineer",\
    item_id:"minecraft:lime_dye",\
    item_name:'{"text": "Spawn Replenishment Tower","color": "green"}',\
    ability_id:"replenishment_tower",\
    cooldown:60,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"replenishment_tower_cooldown",\
}

execute if entity @a[tag=engineer] run function juggernaut:ability_management/check_ability {\
    player_tag:"engineer",\
    item_id:"minecraft:bone",\
    item_name:'{"text": "Spawn Turret","color": "gray"}',\
    ability_id:"turret_tower",\
    cooldown:90,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"turret_cooldown",\
}

execute if entity @a[tag=engineer] run function juggernaut:ability_management/check_ability {\
    player_tag:"engineer",\
    item_id:"minecraft:clock",\
    item_name:'{"text": "Borrowed Time","color": "gold"}',\
    ability_id:"borrowed_time",\
    cooldown:120,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"jug_kit_cooldown",\
}



# Ghost
execute if entity @a[tag=jug_ghost] run function juggernaut:ability_management/check_ability {\
    player_tag:"jug_ghost",\
    item_id:"minecraft:echo_shard",\
    item_name:'{"text": "Spectral Cloak","color": "gray"}',\
    ability_id:"spectral_cloak",\
    cooldown:50,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"jug_kit_cooldown",\
}



# Harbinger
execute if entity @a[tag=harbinger] run function juggernaut:ability_management/check_ability {\
    player_tag:"harbinger",\
    item_id:"minecraft:glistering_melon_slice",\
    item_name:'{"text": "Martyr\'s Blessing","color": "gold"}',\
    ability_id:"martyrs_blessing",\
    cooldown:60,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown",\
}



# Beacon of Hope
execute if entity @a[tag=using_beacon_of_hope] run function juggernaut:ability_management/check_ability {\
    player_tag:"using_beacon_of_hope",\
    item_id:"minecraft:beacon",\
    item_name:'{"text": "Beacon of Hope","color": "aqua"}',\
    ability_id:"beacon_of_hope",\
    cooldown:999999,\
    hotbar_slot:"hotbar.8",\
    cooldown_var:"beacon_of_hope_cooldown",\
}