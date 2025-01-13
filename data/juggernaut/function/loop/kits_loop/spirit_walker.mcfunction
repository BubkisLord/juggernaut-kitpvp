execute if entity @a[tag=spirit_walker] run function juggernaut:ability_management/check_ability {\
    player_tag:"spirit_walker",\
    item_id:"minecraft:amethyst_shard",\
    item_name:'{"text": "Phase Shift","color": "#577ebe"}',\
    ability_id:"phase_shift",\
    cooldown:5,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown",\
}