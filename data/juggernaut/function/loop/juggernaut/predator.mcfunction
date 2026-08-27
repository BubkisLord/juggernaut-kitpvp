# Predator Functionality
execute if entity @s[predicate=is_invisible] run particle ash ~ ~1 ~ 0.25 0.5 0.25 0.0001 50 force @a[tag=!predator,distance=..20]

execute if entity @s[predicate=is_invisible] run function juggernaut:effects/apply_effect {effect:"undetectable",duration:1,color:"gray"}
execute if entity @s[predicate=is_invisible] run attribute @s movement_speed modifier add juggernaut:predator_move_spd 0.3 add_multiplied_base
execute if entity @s[predicate=!is_invisible] run attribute @s movement_speed modifier remove juggernaut:predator_move_spd

function juggernaut:ability_management/check_ability {\
    player_tag:"predator",\
    item_model:"minecraft:blaze_powder",\
    item_name:{"text": "Stalk","color": "#b5ee4a"},\
    description:[{"text": "Become invisible for 30 seconds,","color": "gray"},{"text": "triggering your passive invisibility buffs.","color": "gray"},{"text": "Cooldown: 40s","color": "dark_gray"}],\
    ability_id:"stalk",\
    cooldown:40,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown0",\
}
