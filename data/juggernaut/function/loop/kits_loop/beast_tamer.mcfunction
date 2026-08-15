execute as @p[tag=beast_tamer] rotated as @s on vehicle run rotate @s ~ ~

execute as @p[tag=beast_tamer] on vehicle if entity @s[tag=!pouncing] at @s run function juggernaut:abilities/beast_tamer/move
execute as @p[tag=beast_tamer] on vehicle if entity @s[tag=pouncing] at @s run function juggernaut:abilities/beast_tamer/pounce_tick

execute as @e[tag=beast_tamer_mount,distance=6..] run kill @s

execute unless predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{}}} run function juggernaut:ability_management/check_ability {\
    player_tag:"beast_tamer",\
    item_id:"minecraft:goat_horn",\
    item_name:{"text": "Summon Garibaldi","color": "dark_aqua"},\
    description:[{"text": "Summons a Goat that you ride.","color": "gray"},{"text": "Cooldown: 30s","color": "dark_gray"}],\
    ability_id:"summon_goat",\
    cooldown:10,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown0",\
}

execute if predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{entity_type:"goat"}}} run function juggernaut:ability_management/check_ability {\
    player_tag:"beast_tamer",\
    item_id:"minecraft:rotten_flesh",\
    item_name:{"text": "Bite","color": "dark_aqua"},\
    description:[{"text": "PLACEHOLDER","color": "gray"},{"text": "Cooldown: XXs","color": "dark_gray"}],\
    ability_id:"goat_bite",\
    cooldown:10,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}

execute if predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{entity_type:"goat"}}} run function juggernaut:ability_management/check_ability {\
    player_tag:"beast_tamer",\
    item_id:"minecraft:goat_horn",\
    item_name:{"text": "Ram","color": "dark_aqua"},\
    description:[{"text": "Makes the goat ram, dealing damage.","color": "gray"},{"text": "Cooldown: 20s","color": "dark_gray"}],\
    ability_id:"goat_ram",\
    cooldown:20,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown0",\
}

execute if predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{}}} run function juggernaut:ability_management/check_ability {\
    player_tag:"beast_tamer",\
    item_id:"minecraft:saddle",\
    item_name:{"text": "Dismount","color": "dark_aqua"},\
    description:[{"text": "Dismount your animal.","color": "gray"},{"text": "Cooldown: 20s","color": "dark_gray"}],\
    ability_id:"dismount",\
    cooldown:20,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"ability_cooldown1",\
}