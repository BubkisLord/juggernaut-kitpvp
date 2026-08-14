# Escapist
# Escape Artist Passive
execute if entity @s[tag=in_chase,predicate=is_sprinting] run effect give @s speed 1 0 true

# Escapist Invis Particles
execute if entity @s[predicate=is_invisible,tag=!has_respawn_protection] at @s run particle entity_effect{color:[1,1,1,0.9]} ~ ~ ~ 0.5 1 0.5 0 1 force

# Flee Powder (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"escapist",\
    item_id:"minecraft:gunpowder",\
    item_name:{"text": "Flee Powder","color": "#646464"},\
    description:[{"text": "Gain speed 2 for 8s and invisibility for 10s.","color": "gray"},{"text": "Cooldown: 60s","color": "dark_gray"}],\
    ability_id:"escapist_ability",\
    cooldown:60,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}