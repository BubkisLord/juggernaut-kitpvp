execute if entity @a[tag=classic_jug] run function juggernaut:ability_management/check_ability {\
    player_tag:"classic_jug",\
    item_id:"minecraft:lightning_rod",\
    item_name:{"text": "Find Runners","color": "gray"},\
    description:[{"text": "Summons lightning down to all runner's positions.","color": "gray"},{"text": "Cooldown: 60s","color": "dark_gray"}],\
    ability_id:"find_runners",\
    cooldown:60,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"jug_kit_cooldown",\
}