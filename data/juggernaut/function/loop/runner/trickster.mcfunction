function juggernaut:ability_management/check_ability {\
    player_tag:"trickster",\
    item_model:"minecraft:amethyst_shard",\
    item_name:{"text": "Misty Step","color": "dark_aqua"},\
    description:[[{text: "Teleport", color: "#AA00AA"}, {text: " to a random position within 12 blocks of", color:"gray"}], [{text: "the", color: "gray"}, {text: " Juggernaut", color: "#FF5555"}, {text: ". Prioritises the highest block at", color: "gray"}], [{text: "your destination. Only usable in chase.",color: "gray"}],\
        {"text": "Cooldown: 25s","color": "dark_gray"}],\
    ability_id:"misty_step",\
    cooldown:25,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"trickster",\
    item_model:"minecraft:popped_chorus_fruit",\
    item_name:{"text": "Player Swap","color": "dark_purple"},\
    description:[[{text: "Swap", color: "#cfc7ba"}, {text: " with a", color: "gray"}, {text: " Runner", color: "#00AAAA"}, {text: " in chase. If no", color: "gray"}, {text: " Runners", color: "#00AAAA"}, {text: " are in", color: "gray"}], [{text: "chase,", color: "gray"}, {text: " swap", color: "#cfc7ba"}, {text: " with the furthest", color: "gray"}, {text: " Runner", color: "#00AAAA"}, {text: " . If there", color: "gray"}], [{text: "are no", color: "gray"}, {text: " Runners", color: "#00AAAA"}, {text: " , you will", color: "gray"}, {text: " teleport", color: "#AA00AA"}, {text: " to the closest",color: "gray"}], [{text: "Replenishment Station", color: "#3AC23A"}, {text: " instead.", color: "gray"}],\
        {"text": "Cooldown: 75s","color": "dark_gray"}\
    ],\
    ability_id:"player_swap",\
    cooldown:75,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown1",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"trickster",\
    item_model:"minecraft:prismarine_crystals",\
    item_name:{"text": "False Detection","color": "dark_purple"},\
    description:[[{text: "Make the", color: "gray"}, {text: " Juggernaut", color: "#FF5555"}, {text: " see", color: "gray"}, {text: " stations", color: "#3AC23A"}, {text: " as if they were", color: "gray"}], [{text: "being actively worked on for 10s.", color: "gray"}],{"text": "Cooldown: 1m 40s","color": "dark_gray"}],\
    ability_id:"false_detection",\
    cooldown:100,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"ability_cooldown2",\
}