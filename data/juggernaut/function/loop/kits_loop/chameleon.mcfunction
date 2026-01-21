execute as @a[tag=chameleon] at @s run tp @n[type=mannequin,tag=chameleon_mannequin,distance=..6] ~ ~ ~ facing ^ ^ ^999999999999999
execute as @a[tag=chameleon] at @s if entity @s[scores={is_sneaking=0}] run data modify entity @n[type=mannequin,tag=chameleon_mannequin,distance=..6] pose set value "standing"
execute as @a[tag=chameleon] at @s if entity @s[scores={is_sneaking=1..}] run data modify entity @n[type=mannequin,tag=chameleon_mannequin,distance=..6] pose set value "crouching"
execute as @a[tag=chameleon] at @s if block ~ ~ ~ water if entity @s[scores={is_sneaking=0}] run data modify entity @n[type=mannequin,tag=chameleon_mannequin,distance=..6] pose set value "swimming"
execute as @a[tag=chameleon] at @s run item replace entity @n[type=mannequin,tag=chameleon_mannequin] weapon.mainhand from entity @p[tag=saved_skin] weapon.mainhand
execute as @a[tag=chameleon] at @s run item replace entity @n[type=mannequin,tag=chameleon_mannequin] weapon.offhand from entity @p[tag=saved_skin] weapon.offhand
execute as @a[tag=chameleon] at @s run item replace entity @n[type=mannequin,tag=chameleon_mannequin] armor.head from entity @p[tag=saved_skin] armor.head
execute as @a[tag=chameleon] at @s run item replace entity @n[type=mannequin,tag=chameleon_mannequin] armor.chest from entity @p[tag=saved_skin] armor.chest
execute as @a[tag=chameleon] at @s run item replace entity @n[type=mannequin,tag=chameleon_mannequin] armor.legs from entity @p[tag=saved_skin] armor.legs
execute as @a[tag=chameleon] at @s run item replace entity @n[type=mannequin,tag=chameleon_mannequin] armor.feet from entity @p[tag=saved_skin] armor.feet
execute as @a[tag=chameleon] at @s run tp @n[type=text_display,tag=chameleon_name_tag,distance=..6] ~ ~2.35 ~
execute as @a[tag=chameleon] at @s run tp @n[type=text_display,tag=chameleon_health_tag,distance=..6] ~ ~2.1 ~

execute as @a[tag=chameleon] at @s unless entity @e[type=mannequin,tag=chameleon_mannequin,distance=..6] run function juggernaut:abilities/chameleon/exit_shapeshift
execute as @a[tag=shapeshifting] run function juggernaut:effects/apply_effect_silent {effect:"undetectable",duration:1,color:"gray"}
execute as @e[type=text_display,tag=chameleon_health_tag] at @s run data modify entity @s text set value [\
  {\
    "score":{\
      "name":"@p[tag=saved_skin]",\
      "objective":"health"\
    },\
    "color":"white"\
  },\
  {\
    "text":" Health",\
    "color":"green"\
  }\
]


function juggernaut:ability_management/check_ability {\
    player_tag:"chameleon",\
    item_id:"minecraft:player_head",\
    item_name:{"text": "Clone Player","color": "gray"},\
    description:[{"text": "DESCRIPTION","color": "gray"},{"text": "Cooldown: 10s","color": "dark_gray"}],\
    ability_id:"clone_player",\
    cooldown:10,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"jug_kit_cooldown",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"chameleon",\
    item_id:"minecraft:player_head",\
    item_name:{"text": "Shapeshift","color": "gray"},\
    description:[{"text": "DESCRIPTION","color": "gray"},{"text": "Cooldown: 60s","color": "dark_gray"}],\
    ability_id:"shapeshift",\
    cooldown:60,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"jug_kit_cooldown_2",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"chameleon",\
    item_id:"minecraft:player_head",\
    item_name:{"text": "Randomised Shapeshift","color": "gray"},\
    description:[{"text": "Shapeshift into a random runner in the game.","color": "gray"},{"text": "Cooldown: 45s","color": "dark_gray"}],\
    ability_id:"shapeshift_random",\
    cooldown:45,\
    hotbar_slot:"hotbar.4",\
    cooldown_var:"jug_kit_cooldown_2",\
}

execute as @a[tag=chameleon,tag=shapeshifting] run function juggernaut:ability_management/check_ability {\
    player_tag:"chameleon",\
    item_id:"minecraft:player_head",\
    item_name:{"text": "Exit Shapeshift","color": "gray"},\
    description:[{"text": "DESCRIPTION","color": "gray"},{"text": "Cooldown: 10s","color": "dark_gray"}],\
    ability_id:"exit_shapeshift",\
    cooldown:1,\
    hotbar_slot:"hotbar.5",\
    cooldown_var:"jug_kit_cooldown_3",\
}

execute as @a[tag=chameleon,tag=!shapeshifting] run function juggernaut:ability_management/check_ability {\
    player_tag:"chameleon",\
    item_id:"minecraft:barrier",\
    item_name:{"text": "Exit Shapeshift","color": "gray","strikethrough":true},\
    description:[{"text": "Cannot exit shapeshift right now - you aren't shapeshifting!","color": "gray"},{"text": "Cooldown: 10s","color": "dark_gray"}],\
    ability_id:"",\
    cooldown:1,\
    hotbar_slot:"hotbar.5",\
    cooldown_var:"jug_kit_cooldown_3",\
}