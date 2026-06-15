# Guide

# Replenish Boost (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"guide",\
    item_id:"minecraft:ender_eye",\
    item_name:{"text": "Replenish Boost","color": "#FFD700"},\
    description:[{"text": "For each runner within 3 blocks, progress replenishment by 12%.","color": "gray"},{"text": "Cooldown: 20s","color": "dark_gray"}],\
    ability_id:"replenish_boost",\
    cooldown:20,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}