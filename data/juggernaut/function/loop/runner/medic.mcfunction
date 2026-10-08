# Medic
execute as @a[tag=medic] at @s run effect give @a[tag=runner,distance=0.01..5] regeneration 1 0 true

# Rescue (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"medic",\
    item_model:"minecraft:nether_star",\
    item_name:{"text": "Rescue",color: "#A4D1EA"},\
    description:[[{text: "Teleport", color: "#AA00AA"}, {text: " to another", color: "gray"}, {text: " Runner", color: "#00AAAA"}, {text: ". If there are no other", color: "gray"}], [{text: "Runners", color: "#00AAAA"}, {text: ",", color: "gray"}, {text: " teleport", color: "#AA00AA"}, {text: " to a spawn point. Cannot be", color: "gray"}], [{text: "used if the", color: "gray"}, {text: " Juggernaut", color: "#FF5555"}, {text: " is within 20 blocks.", color: "gray"}], [{text: "Cooldown: 60s", color: "dark_gray"}]],\
    ability_id:"rescue",\
    cooldown:60,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}

# Heal (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"medic",\
    item_model:"minecraft:glistering_melon_slice",\
    item_name:{"text": "Heal",color: "#dbbe2d"},\
    description:[[{text: "Heal", color: "#dbbe2d"}, {text: " all other", color: "gray"}, {text: " Runners", color: "#00AAAA"}, {text: " within 8 blocks, and reset", color: "gray"}], [{text: "all remaining ability cooldowns.", color: "gray"}], [{text: "Cooldown: 60s", color: "dark_gray"}]],\
    ability_id:"heal",\
    cooldown:60,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown1",\
}