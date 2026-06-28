# Revealing Powder (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"scout",\
    item_id:"minecraft:glowstone_dust",\
    item_name:{"text": "Revealing Powder","color": "gold"},\
    description:[{"text": "Reveal all juggernauts for 12 seconds.","color": "gray"},{"text": "Cooldown: 25s","color": "dark_gray"}],\
    ability_id:"reveal_jugs",\
    cooldown:25,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown0",\
}