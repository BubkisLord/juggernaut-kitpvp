# Il Krusher

# Crushing Dash (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"il_krusher",\
    item_id:"minecraft:iron_block",\
    item_name:{"text": "Crushing Dash","color": "#c0392b"},\
    description:[{"text": "Charge forward, plowing through any runners in","color": "gray"},{"text": "your path. Each runner hit takes damage and is","color": "gray"},{"text": "knocked back. Stops when it meets a wall.","color": "gray"},{"text": "Cooldown: 8s","color": "dark_gray"}],\
    ability_id:"dash",\
    cooldown:8,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown0",\
}

# Advance the dash while it is active.
execute if entity @s[tag=il_krusher_dashing] run function juggernaut:abilities/il_krusher/dash_tick
