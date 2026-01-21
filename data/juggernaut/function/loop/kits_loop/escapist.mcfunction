# Escapist
# Escape Artist Passive
execute as @a[tag=escapist,tag=in_chase,scores={is_sprinting=1..}] run effect give @s speed 1 0 true

# Flee Powder (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"escapist",\
    item_id:"minecraft:gunpowder",\
    item_name:{"text": "Flee Powder","color": "#646464"},\
    description:[{"text": "Gain speed 2 for 8s and invisibility for 10s.","color": "gray"},{"text": "Cooldown: 1m","color": "dark_gray"}],\
    ability_id:"escapist_ability",\
    cooldown:60,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"jug_kit_cooldown",\
}