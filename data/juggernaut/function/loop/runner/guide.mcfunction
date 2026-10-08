# Guide
# Replenish Boost (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"guide",\
    item_model:"minecraft:gold_ingot",\
    item_name:{"text": "Replenish Boost","color": "#FFD700"},\
    description:[[{text: "Instantly progress a", color: "gray"}, {text: " station", color: "#3AC23A"}, {text: " for 20s worth of", color: "gray"}], [{text: "progress.", color: "gray"}], [{text: "Cooldown:40s", color: "dark_gray"}]],\
    ability_id:"replenish_boost",\
    cooldown:40,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}

execute as @a[tag=!guide,tag=in_chase,distance=..32] run effect give @s speed 1 0 true