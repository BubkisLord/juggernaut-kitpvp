# Guide
# Guidance (Passive)
execute as @a[tag=guide,scores={is_sprinting=1..}] at @s if entity @a[tag=runner,distance=1..8,scores={is_sprinting=1..}] run effect give @a[tag=runner,distance=..8] speed 1 0 true

# Replenish Boost (Active)
execute if entity @a[tag=guide] run function juggernaut:ability_management/check_ability {\
    player_tag:"guide",\
    item_id:"minecraft:ender_eye",\
    item_name:{"text": "Replenish Boost","color": "#FFD700"},\
    description:[{"text": "For each runner within 3 blocks, progress replenishment by 3%.","color": "gray"},{"text": "Cannot be used if the juggernaut is within 12 blocks","color": "gray"},{"text": "Cooldown: 50s","color": "dark_gray"}],\
    ability_id:"replenish_boost",\
    cooldown:50,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"jug_kit_cooldown",\
}