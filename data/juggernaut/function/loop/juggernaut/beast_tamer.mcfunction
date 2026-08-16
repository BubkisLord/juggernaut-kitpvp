execute as @a[tag=beast_tamer] rotated as @s on vehicle run rotate @s ~ ~

execute as @a[tag=beast_tamer] on vehicle if entity @s[tag=!pouncing] at @s run function juggernaut:abilities/beast_tamer/move
execute as @a[tag=beast_tamer] on vehicle if entity @s[tag=pouncing] at @s run function juggernaut:abilities/beast_tamer/pounce_tick

execute as @e[tag=beast_tamer_mount,distance=6..] run kill @s

execute as @e[type=dolphin,tag=beast_tamer_mount] at @s unless block ~ ~ ~ #juggernaut:underwater_permeables run function juggernaut:effects/apply_effect {effect:"fatigued",duration:1}
execute on vehicle at @s as @a[tag=runner,distance=..2] run damage @s 1 in_fire by @n[type=blaze,tag=beast_tamer_mount]

execute if predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{entity_type:"dolphin"}}} run effect give @s water_breathing 1 0 true

execute unless predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{}}} run item replace entity @s hotbar.0 with stick[enchantments={sharpness:4}]

execute if predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{}}} run scoreboard players set @s ability_cooldown0 300

execute unless predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{}}} run function juggernaut:ability_management/check_ability {\
    player_tag:"beast_tamer",\
    item_model:"minecraft:goat_horn",\
    item_name:{"text": "Summon Garibaldi","color": "dark_aqua"},\
    description:[{"text": "Summons a Goat that you ride.","color": "gray"},{"text": "Cooldown: 30s","color": "dark_gray"}],\
    ability_id:"summon_goat",\
    cooldown:1,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown0",\
}

execute unless predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{}}} run function juggernaut:ability_management/check_ability {\
    player_tag:"beast_tamer",\
    item_model:"minecraft:prismarine_shard",\
    item_name:{"text": "Summon Dario","color": "dark_aqua"},\
    description:[{"text": "Summons a Dolphin that you ride.","color": "gray"},{"text": "Cooldown: 30s","color": "dark_gray"}],\
    ability_id:"summon_dolphin",\
    cooldown:1,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"ability_cooldown0",\
}

execute unless predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{}}} run function juggernaut:ability_management/check_ability {\
    player_tag:"beast_tamer",\
    item_model:"minecraft:blaze_powder",\
    item_name:{"text": "Summon Boris","color": "dark_aqua"},\
    description:[{"text": "Summons a Blaze that you ride.","color": "gray"},{"text": "Cooldown: 30s","color": "dark_gray"}],\
    ability_id:"summon_blaze",\
    cooldown:1,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"ability_cooldown0",\
}

execute if predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{}}} run item replace entity @s hotbar.3 with air

execute if predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{entity_type:"goat"}}} run function juggernaut:ability_management/check_ability {\
    player_tag:"beast_tamer",\
    item_model:"minecraft:rotten_flesh",\
    item_name:{"text": "Bite","color": "dark_aqua"},\
    description:[{"text": "Damages a Runner in front of you but fatigues Garibaldi for some time!","color": "gray"},{"text": "Cooldown: XXs","color": "dark_gray"}],\
    ability_id:"goat_bite",\
    cooldown:4,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown1",\
}

execute if predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{entity_type:"goat"}}} run function juggernaut:ability_management/check_ability {\
    player_tag:"beast_tamer",\
    item_model:"minecraft:goat_horn",\
    item_name:{"text": "Ram","color": "dark_aqua"},\
    description:[{"text": "Makes the goat ram, dealing damage.","color": "gray"},{"text": "Cooldown: 20s","color": "dark_gray"}],\
    ability_id:"goat_ram",\
    cooldown:8,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown2",\
}

execute if predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{entity_type:"dolphin"}}} run function juggernaut:ability_management/check_ability {\
    player_tag:"beast_tamer",\
    item_model:"minecraft:prismarine_crystals",\
    item_name:{"text": "Echolocate","color": "dark_aqua"},\
    description:[{"text": "Makes the goat ram, dealing damage.","color": "gray"},{"text": "Cooldown: 20s","color": "dark_gray"}],\
    ability_id:"echolocate",\
    cooldown:5,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown3",\
}

execute if predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{entity_type:"dolphin"}}} run function juggernaut:ability_management/check_ability {\
    player_tag:"beast_tamer",\
    item_model:"minecraft:prismarine_shard",\
    item_name:{"text": "Charge","color": "dark_aqua"},\
    description:[{"text": "Makes the goat ram, dealing damage.","color": "gray"},{"text": "Cooldown: 20s","color": "dark_gray"}],\
    ability_id:"dolphin_charge",\
    cooldown:7,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown3",\
}

execute if predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{entity_type:"blaze"}}} run function juggernaut:ability_management/check_ability {\
    player_tag:"beast_tamer",\
    item_model:"minecraft:blaze_powder",\
    item_name:{"text": "Flight","color": "dark_aqua"},\
    description:[{"text": "Allows Boris to ascend to new heights.","color": "gray"},{"text": "Cooldown: 20s","color": "dark_gray"}],\
    ability_id:"blaze_flight",\
    cooldown:30,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown4",\
}

execute if predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{entity_type:"blaze"}}} run function juggernaut:ability_management/check_ability {\
    player_tag:"beast_tamer",\
    item_model:"minecraft:fire_charge",\
    item_name:{"text": "Brexit","color": "dark_aqua"},\
    description:[{"text": "Shoots a massive fireball of doom and destruction for all to see!","color": "gray"},{"text": "Cooldown: 20s","color": "dark_gray"}],\
    ability_id:"fireball",\
    cooldown:20,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown5",\
}

execute if predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{}}} run function juggernaut:ability_management/check_ability {\
    player_tag:"beast_tamer",\
    item_model:"minecraft:saddle",\
    item_name:{"text": "Dismount","color": "dark_aqua"},\
    description:[{"text": "Dismount your animal.","color": "gray"},{"text": "Cooldown: 20s","color": "dark_gray"}],\
    ability_id:"dismount",\
    cooldown:1,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"ability_cooldown6",\
}