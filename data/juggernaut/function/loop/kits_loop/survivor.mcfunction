execute as @a[tag=survivor] run function juggernaut:ability_management/check_ability {\
    player_tag:"survivor",\
    item_id:"minecraft:snowball",\
    item_name:{"text":"Ice Bomb","color":"#A4D1EA"},\
    description:[\
                {"text": "Throw at a Juggernaut to freeze them!","color": "gray"},\
                {"text":"Cooldown: 45s","color":"dark_gray"}],\
    ability_id:"snowball",\
    cooldown:45,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}

execute as @a[tag=survivor] run function juggernaut:ability_management/check_ability {\
    player_tag:"survivor",\
    item_id:"minecraft:gold_nugget",\
    item_name:{"text":"Toughen Up","color":"#A4D1EA"},\
    description:[\
                {"text": "Grants you extra health for 4 seconds.","color": "gray"},\
                {"text":"Cooldown: 30s","color":"dark_gray"}],\
    ability_id:"toughen_up",\
    cooldown:30,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown1",\
}

# Survivor effect
execute as @a[tag=survivor] at @s as @e[type=snowball,distance=..3] run tag @s add ice_bomb
execute as @e[type=snowball,tag=ice_bomb] at @s run particle electric_spark ~ ~ ~ 1 1 1 0.00001 60 force
execute as @e[type=snowball,tag=ice_bomb] at @s run effect give @a[tag=juggernaut,distance=..2] slowness 8 255 true
