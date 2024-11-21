# Chain Hunter
execute if entity @a[tag=chain_hunter] run function juggernaut:ability_management/check_ability {\
    player_tag:"chain_hunter",\
    item_id:"minecraft:chain",\
    item_name:'{"text": "Summon Chain Shot","color": "gray"}',\
    ability_id:"chain_shot",\
    cooldown:20,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown",\
}

execute if entity @a[tag=chain_hunter] run function juggernaut:ability_management/check_ability {\
    player_tag:"chain_hunter",\
    item_id:"minecraft:ghast_tear",\
    item_name:'{"text": "Chain Pull","color": "gray"}',\
    ability_id:"chain_pull",\
    cooldown:20,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"jug_kit_cooldown_2",\
}



# Witch Doctor
execute if entity @a[tag=witchdoctor] run function juggernaut:ability_management/check_ability {\
    player_tag:"witchdoctor",\
    item_id:"minecraft:cyan_dye",\
    item_name:'{"text": "Speed","color": "dark_aqua"}',\
    ability_id:"speed_pot",\
    cooldown:60,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"speed_pot_cooldown",\
}

execute if entity @a[tag=witchdoctor] run function juggernaut:ability_management/check_ability {\
    player_tag:"witchdoctor",\
    item_id:"minecraft:red_dye",\
    item_name:'{"text": "Fire Resistance","color": "red"}',\
    ability_id:"fire_pot",\
    cooldown:60,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"fire_pot_cooldown",\
}

execute if entity @a[tag=witchdoctor] run function juggernaut:ability_management/check_ability {\
    player_tag:"witchdoctor",\
    item_id:"minecraft:orange_dye",\
    item_name:'{"text": "Strength","color": "gold"}',\
    ability_id:"strength_pot",\
    cooldown:60,\
    hotbar_slot:"hotbar.4",\
    cooldown_var:"strength_pot_cooldown",\
}

execute if entity @a[tag=witchdoctor] run function juggernaut:ability_management/check_ability {\
    player_tag:"witchdoctor",\
    item_id:"minecraft:ghast_tear",\
    item_name:'{"text": "Enlarge","color": "dark_purple"}',\
    ability_id:"enlarge",\
    cooldown:30,\
    hotbar_slot:"hotbar.6",\
    cooldown_var:"jug_kit_cooldown",\
}

execute if entity @a[tag=witchdoctor] run function juggernaut:ability_management/check_ability {\
    player_tag:"witchdoctor",\
    item_id:"minecraft:ghast_tear",\
    item_name:'{"text": "Reduce","color": "dark_purple"}',\
    ability_id:"reduce",\
    cooldown:20,\
    hotbar_slot:"hotbar.7",\
    cooldown_var:"jug_kit_cooldown_2",\
}



# Spirit Walker
execute if entity @a[tag=spirit_walker] run function juggernaut:ability_management/check_ability {\
    player_tag:"spirit_walker",\
    item_id:"minecraft:amethyst_shard",\
    item_name:'{"text": "Phase Shift","color": "#577ebe"}',\
    ability_id:"phase_shift",\
    cooldown:30,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown",\
}



# Hunter
execute if entity @a[tag=jug_hunter] run function juggernaut:ability_management/check_ability {\
    player_tag:"jug_hunter",\
    item_id:"minecraft:target",\
    item_name:'{"text": "Mark Prey","color": "dark_red"}',\
    ability_id:"mark_prey",\
    cooldown:5,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"jug_kit_cooldown",\
}

execute if entity @a[tag=jug_hunter] run function juggernaut:ability_management/check_ability {\
    player_tag:"jug_hunter",\
    item_id:"minecraft:vault",\
    item_name:'{"text": "Pursue Prey","color": "dark_red"}',\
    ability_id:"pursue_prey",\
    cooldown:35,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"jug_kit_cooldown",\
}



# Warlock
execute if entity @a[tag=warlock] run function juggernaut:ability_management/check_ability {\
    player_tag:"warlock",\
    item_id:"minecraft:red_dye",\
    item_name:'{"text": "Spawn Malevolent Aura","color": "dark_red"}',\
    ability_id:"malevolent_aura",\
    cooldown:20,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"malevolent_aura_cooldown",\
}

execute if entity @a[tag=warlock] run function juggernaut:ability_management/check_ability {\
    player_tag:"warlock",\
    item_id:"minecraft:cyan_dye",\
    item_name:'{"text": "Spawn Banishment Glyph","color": "dark_aqua"}',\
    ability_id:"banishment_glyph",\
    cooldown:30,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"banishment_glyph_cooldown",\
}

execute if entity @a[tag=warlock] run function juggernaut:ability_management/check_ability {\
    player_tag:"warlock",\
    item_id:"minecraft:black_dye",\
    item_name:'{"text": "Spawn Withering Surge","color": "dark_gray"}',\
    ability_id:"withering_surge",\
    cooldown:40,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"withering_surge_cooldown",\
}



# Eclipse Stalker
execute if entity @a[tag=eclipse_stalker,tag=!using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:'{"text": "Place Camera","color": "#FFD700"}',\
    ability_id:"place_cam",\
    cooldown:4,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown",\
}

execute if entity @a[tag=eclipse_stalker,tag=!using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:'{"text": "Use Camera","color": "#FFD700"}',\
    ability_id:"use_cam",\
    cooldown:2,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"jug_kit_cooldown_2",\
}

execute if entity @a[tag=eclipse_stalker,tag=using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:'{"text": "Change Camera","color": "#FFD700"}',\
    ability_id:"switch_cam",\
    cooldown:1,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown_2",\
}

execute if entity @a[tag=eclipse_stalker,tag=using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:'{"text": "Leave Camera","color": "#FFD700"}',\
    ability_id:"leave_cam",\
    cooldown:30,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"jug_kit_cooldown_2",\
}

execute if entity @a[tag=eclipse_stalker,tag=using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:'{"text": "Kill Camera","color": "#FFD700"}',\
    ability_id:"kill_cam",\
    cooldown:2,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"jug_kit_cooldown_2",\
}

execute if entity @a[tag=eclipse_stalker,tag=using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:magma_cream",\
    item_name:'{"text": "Shadow Mark","color": "#cc3c3c"}',\
    ability_id:"mark_enemy",\
    cooldown:5,\
    hotbar_slot:"hotbar.5",\
    cooldown_var:"shadow_mark_cooldown",\
}

execute if entity @a[tag=eclipse_stalker,tag=using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:fire_charge",\
    item_name:'{"text": "Materialise","color": "#aa0000"}',\
    ability_id:"materialise",\
    cooldown:5,\
    hotbar_slot:"hotbar.6",\
    cooldown_var:"shadow_mark_cooldown",\
}
