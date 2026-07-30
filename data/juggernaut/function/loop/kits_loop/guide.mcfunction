# Guide
# Replenish Boost (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"guide",\
    item_id:"minecraft:gold_ingot",\
    item_name:{"text": "Replenish Boost","color": "#FFD700"},\
    description:[{"text": "Instantly progress a station for 20s worth of progress.","color": "gray"},{"text": "Cooldown: 40s","color": "dark_gray"}],\
    ability_id:"replenish_boost",\
    cooldown:40,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}