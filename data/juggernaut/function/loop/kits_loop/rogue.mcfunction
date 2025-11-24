# Rogue
# Stealth Expertise (Passive)
execute as @a[tag=rogue,scores={is_sneaking=1}] run attribute @s step_height base set 1
execute as @a[tag=rogue,scores={is_sneaking=0}] run attribute @s step_height base set 0.6

# Smoke Bomb (Active)
execute if entity @a[tag=rogue] run function juggernaut:ability_management/check_ability {\
    player_tag:"rogue",\
    item_id:"minecraft:firework_star",\
    item_name:{"text": "Smoke Bomb","color": "#646464"},\
    ability_id:"smoke_bomb",\
    cooldown:60,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"jug_kit_cooldown",\
}