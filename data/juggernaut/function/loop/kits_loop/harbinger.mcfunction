
execute if entity @a[tag=harbinger] run function juggernaut:ability_management/check_ability {\
    player_tag:"harbinger",\
    item_id:"minecraft:glistering_melon_slice",\
    item_name:{"text": "Martyrs Blessing","color": "gold"},\
    ability_id:"martyrs_blessing",\
    cooldown:60,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown",\
}