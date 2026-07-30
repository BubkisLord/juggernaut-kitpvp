execute if entity @s[nbt={SelectedItem:{id:"minecraft:ender_eye"}}] run function juggernaut:raycasts/raycast {\
    player_tag:"phantom",\
    raycast_id:"check_haunt_target",\
    target_tag:"replenishment.station",\
    hit_distance:3,\
    raycast_limit:250,\
    collides_with_blocks:0,\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"phantom",\
    item_id:"minecraft:echo_shard",\
    item_name:{"text": "Reap","color": "#5e556e"},\
    description:[{"text": "Deal damage to a runner you are looking at,","color": "gray"},{"text": "making them glowing for 12 seconds.","color": "gray"},{"text": "Works through walls.","color": "gray"},{"text": "Cooldown: 7s","color": "dark_gray"}],\
    ability_id:"reap",\
    cooldown:12,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown0",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"phantom",\
    item_id:"minecraft:ender_eye",\
    item_name:{"text": "Haunt Station","color": "#5e556e"},\
    description:[\
        {"text": "Apparate at a replenishment station that you","color": "gray"},\
        {"text": "are looking at. Hold out the item and look","color": "gray"},\
        {"text": "at a replenishment station. When it is a valid","color": "gray"},\
        {"text": "teleport it will change color.","color": "gray"},\
        {"text": "Cooldown: 40s","color": "dark_gray"}\
    ],\
    ability_id:"tp_station",\
    cooldown:40,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"ability_cooldown1",\
}

# function juggernaut:ability_management/check_ability {\
#     player_tag:"phantom",\
#     item_id:"minecraft:iron_nugget",\
#     item_name:{"text": "Blink","color": "#5e556e"},\
#     description:[\
#         {"text": "Move forward 5 blocks. Works through walls.","color": "gray"},\
#         {"text": "Cooldown: 10s","color": "dark_gray"}\
#     ],\
#     ability_id:"blink",\
#     cooldown:10,\
#     hotbar_slot:"hotbar.3",\
#     cooldown_var:"ability_cooldown2",\
# }
