function juggernaut:ability_management/check_ability {\
    player_tag:"survivor",\
    item_model:"minecraft:snowball",\
    item_name:{text: "Ice Bomb",color: "#a4d1ea"},\
    description:[[{text: "Shoots a blast of ice. If it a Juggernaut, they are slowed.", color: "gray"}], [{text: "Cooldown: 45s", color: "dark_gray"}]],\
    ability_id:"ice_bomb",\
    cooldown:45,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"survivor",\
    item_model:"minecraft:gold_nugget",\
    item_name:{text: "Toughen Up",color: "#A4D1EA"},\
    description:[[{text: "Grants you extra", color: "gray"}, {text: " health", color: "#dbbe2d"}, {text: " for 4 seconds.", color: "gray"}], [{text: "Cooldown: 30s", color: "dark_gray"}]],\
    ability_id:"toughen_up",\
    cooldown:30,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown1",\
}
