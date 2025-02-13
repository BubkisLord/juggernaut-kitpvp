
execute if entity @a[tag=witch_doctor] run function juggernaut:ability_management/check_ability {\
    player_tag:"witch_doctor",\
    item_id:"minecraft:cyan_dye",\
    item_name:'{"text": "Speed","color": "dark_aqua"}',\
    ability_id:"speed_pot",\
    cooldown:60,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"speed_pot_cooldown",\
}

execute if entity @a[tag=witch_doctor] run function juggernaut:ability_management/check_ability {\
    player_tag:"witch_doctor",\
    item_id:"minecraft:red_dye",\
    item_name:'{"text": "Fire Resistance","color": "red"}',\
    ability_id:"fire_pot",\
    cooldown:60,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"fire_pot_cooldown",\
}

execute if entity @a[tag=witch_doctor] run function juggernaut:ability_management/check_ability {\
    player_tag:"witch_doctor",\
    item_id:"minecraft:orange_dye",\
    item_name:'{"text": "Strength","color": "gold"}',\
    ability_id:"strength_pot",\
    cooldown:60,\
    hotbar_slot:"hotbar.4",\
    cooldown_var:"strength_pot_cooldown",\
}

execute if entity @a[tag=witch_doctor] run function juggernaut:ability_management/check_ability {\
    player_tag:"witch_doctor",\
    item_id:"minecraft:ghast_tear",\
    item_name:'{"text": "Enlarge","color": "dark_purple"}',\
    ability_id:"enlarge",\
    cooldown:30,\
    hotbar_slot:"hotbar.6",\
    cooldown_var:"jug_kit_cooldown",\
}

execute if entity @a[tag=witch_doctor] run function juggernaut:ability_management/check_ability {\
    player_tag:"witch_doctor",\
    item_id:"minecraft:ghast_tear",\
    item_name:'{"text": "Reduce","color": "dark_purple"}',\
    ability_id:"reduce",\
    cooldown:20,\
    hotbar_slot:"hotbar.7",\
    cooldown_var:"jug_kit_cooldown_2",\
}