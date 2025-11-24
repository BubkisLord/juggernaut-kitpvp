# Escapist
# Escape Artist Passive
execute as @a[tag=escapist,tag=in_chase] run effect give @s speed 1 0 true

# Flee Powder (Active)
execute if entity @a[tag=escapist] run function juggernaut:ability_management/check_ability {\
    player_tag:"escapist",\
    item_id:"minecraft:gunpowder",\
    item_name:{"text": "Flee Powder","color": "#646464"},\
    ability_id:"escapist_ability",\
    cooldown:60,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"jug_kit_cooldown",\
}