execute run tp @n[type=mannequin,tag=chameleon_mannequin,distance=..6] ~ ~ ~ facing ^ ^ ^999999999999999
execute if entity @s[scores={is_sneaking=0}] run data modify entity @n[type=mannequin,tag=chameleon_mannequin,distance=..6] pose set value "standing"
execute if entity @s[scores={is_sneaking=1..}] run data modify entity @n[type=mannequin,tag=chameleon_mannequin,distance=..6] pose set value "crouching"
execute if block ~ ~ ~ water if entity @s[scores={is_sneaking=0}] run data modify entity @n[type=mannequin,tag=chameleon_mannequin,distance=..6] pose set value "swimming"
execute run item replace entity @n[type=mannequin,tag=chameleon_mannequin] weapon.mainhand from entity @p[tag=saved_skin] weapon.mainhand
execute run item replace entity @n[type=mannequin,tag=chameleon_mannequin] weapon.offhand from entity @p[tag=saved_skin] weapon.offhand
execute run item replace entity @n[type=mannequin,tag=chameleon_mannequin] armor.head from entity @p[tag=saved_skin] armor.head
execute run item replace entity @n[type=mannequin,tag=chameleon_mannequin] armor.chest from entity @p[tag=saved_skin] armor.chest
execute run item replace entity @n[type=mannequin,tag=chameleon_mannequin] armor.legs from entity @p[tag=saved_skin] armor.legs
execute run item replace entity @n[type=mannequin,tag=chameleon_mannequin] armor.feet from entity @p[tag=saved_skin] armor.feet
execute run tp @n[type=text_display,tag=chameleon_name_tag,distance=..6] ~ ~2.35 ~
execute run tp @n[type=text_display,tag=chameleon_health_tag,distance=..6] ~ ~2.1 ~

execute if entity @s[tag=shapeshifting] unless entity @e[type=mannequin,tag=chameleon_mannequin,distance=..6] run function juggernaut:abilities/chameleon/exit_shapeshift
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

effect give @s resistance 1 0 true

execute if entity @s[tag=!shapeshifting] run function juggernaut:ability_management/check_ability {\
    player_tag:"chameleon",\
    item_id:"minecraft:player_head",\
    item_name:{"text": "Shapeshift","color": "gray"},\
    description:[{"text": "Shapeshift into the last player you were shapeshifting as, or a random player if none are found.","color": "gray"},{"text": "Cooldown: 20s","color": "dark_gray"}],\
    ability_id:"shapeshift",\
    cooldown:20,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"ability_cooldown0",\
}

execute if entity @s[tag=shapeshifting] run function juggernaut:ability_management/check_ability {\
    player_tag:"chameleon",\
    item_id:"minecraft:player_head",\
    item_name:{"text": "Randomise Shapeshift Target","color": "gray"},\
    description:[{"text": "Switch shapeshift target to another player.","color": "gray"},{"text": "Cooldown: 20s","color": "dark_gray"}],\
    ability_id:"shapeshift_change",\
    cooldown:5,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"ability_cooldown0",\
}

execute if entity @s[tag=shapeshifting] run function juggernaut:ability_management/check_ability {\
    player_tag:"chameleon",\
    item_id:"minecraft:red_dye",\
    item_name:{"text": "Exit Shapeshift","color": "gray"},\
    description:[{"text": "Exit Shapeshifting mode and return to normal.","color": "gray"},{"text": "Cooldown: 1s","color": "dark_gray"}],\
    ability_id:"exit_shapeshift",\
    cooldown:0,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"ability_cooldown1",\
}

execute if entity @s[tag=!shapeshifting] run item replace entity @s hotbar.3 with red_dye[item_name={"text": "Exit Shapeshift","color": "gray"},lore=[{"text": "Cannot exit shapeshift as you are not shapeshifting.","color": "gray"},{"text": "Cooldown: 1s","color": "dark_gray"}]]

function juggernaut:ability_management/check_ability {\
    player_tag:"chameleon",\
    item_id:"minecraft:clock",\
    item_name:{"text": "Swap with Runner","color": "gray"},\
    description:[{"text": "Swap positions with your current shapeshift target.","color": "gray"},{"text": "Cooldown: 30s","color": "dark_gray"}],\
    ability_id:"swap_player",\
    cooldown:30,\
    hotbar_slot:"hotbar.4",\
    cooldown_var:"ability_cooldown2",\
}