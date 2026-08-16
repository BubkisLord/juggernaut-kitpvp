execute store result storage juggernaut:loop/runner/windrunner movement_speed float 1 run attribute @p[tag=juggernaut] movement_speed base get
function juggernaut:abilities/windrunner/set_movement_speed with storage juggernaut:loop/runner/windrunner

function juggernaut:ability_management/check_ability {\
    player_tag:"windrunner",\
    item_model:"minecraft:magma_cream",\
    item_name:{"text": "Risky Business","color": "dark_aqua"},\
    description:[{"text": "Gives the juggernaut speed but doubles your replenishment for 10 seconds.","color": "gray"},{"text": "Cooldown: 40s","color": "dark_gray"}],\
    ability_id:"risky_business",\
    cooldown:40,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}