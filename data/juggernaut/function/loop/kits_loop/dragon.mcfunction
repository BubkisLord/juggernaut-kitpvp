execute as @a[tag=dragon,tag=is_floating] at @s if block ~ ~-5 ~ #juggernaut:non-surface_blocks run attribute @s gravity base set 0.01
execute as @a[tag=dragon,tag=is_floating] at @s unless block ~ ~-5 ~ #juggernaut:non-surface_blocks run attribute @s gravity base set -0.015
execute as @a[tag=dragon,tag=is_floating] at @s if block ~ ~-6 ~ #juggernaut:non-surface_blocks unless block ~ ~-5 ~ #juggernaut:non-surface_blocks run attribute @s gravity base set 0
execute as @a[tag=dragon,tag=is_floating] at @s unless block ~ ~-0.75 ~ #juggernaut:non-surface_blocks run attribute @s gravity base set 0.08
execute as @a[tag=dragon,tag=is_floating] if entity @s[scores={is_sneaking=1}] run attribute @s gravity base set 0.01
execute as @a[tag=dragon,tag=!is_floating] run attribute @s gravity base set -0.01
execute as @a[tag=dragon,tag=!is_floating] if entity @s[scores={is_sneaking=1}] run attribute @s gravity base set 0.02

execute as @a[tag=dragon] run effect give @s resistance 1 0 true

execute as @a[tag=dragon] if entity @s[tag=is_floating] run function juggernaut:ability_management/check_ability {\
    player_tag:"dragon",\
    item_id:"minecraft:feather",\
    item_name:{"text": "Switch to Flight","color": "dark_red"},\
    description:[{"text": "Switch to manual flight mode instead of floating mode.","color": "gray"},{"text": "Cooldown: 0s","color": "dark_gray"}],\
    ability_id:"start_flight",\
    cooldown:0,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}

execute as @a[tag=dragon] unless entity @s[tag=is_floating] run function juggernaut:ability_management/check_ability {\
    player_tag:"dragon",\
    item_id:"minecraft:phantom_membrane",\
    item_name:{"text": "Switch to Floating","color": "dark_red"},\
    description:[{"text": "Switch to automated floating mode instead of flight mode.","color": "gray"},{"text": "Cooldown: 0s","color": "dark_gray"}],\
    ability_id:"start_floating",\
    cooldown:0,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}

execute as @a[tag=dragon] run function juggernaut:ability_management/check_ability {\
    player_tag:"dragon",\
    item_id:"minecraft:dragon_breath",\
    item_name:{"text": "Shoot Dragon Breath","color": "dark_red"},\
    description:[{"text": "Shoot a stream of dragon breath at your target.","color": "gray"},{"text": "Cooldown: 2s","color": "dark_gray"}],\
    ability_id:"dragon_breath",\
    cooldown:2,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown1",\
}

execute as @a[tag=dragon] run function juggernaut:ability_management/check_ability {\
    player_tag:"dragon",\
    item_id:"minecraft:dragon_breath",\
    item_name:{"text": "Charged Breath Attack","color": "dark_red"},\
    description:[{"text": "Release a powerful burst of dragon breath. Takes 4 seconds to charge.","color": "gray"},{"text": "Cooldown: 30s","color": "dark_gray"}],\
    ability_id:"strong_dragon_breath",\
    cooldown:30,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"ability_cooldown2",\
}
