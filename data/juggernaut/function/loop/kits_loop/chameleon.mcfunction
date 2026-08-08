execute if entity @s[tag=shapeshifting] run summon area_effect_cloud ~ ~ ~ {Age:0,Duration:10,Tags:["chameleon_breadcrumb","kill_on_end_game"],Radius:0,custom_particle:{type:"dust",scale:0.01,color:[0,0,0]}}
execute if entity @s[tag=shapeshifting] run data modify entity @n[type=area_effect_cloud,tag=chameleon_breadcrumb] Rotation set from entity @s Rotation
execute if entity @s[tag=shapeshifting] run kill @e[type=area_effect_cloud,tag=chameleon_breadcrumb,distance=3..]
execute unless entity @s[tag=shapeshifting] run kill @e[type=area_effect_cloud,tag=chameleon_breadcrumb]
execute unless entity @s[tag=shapeshifting] run kill @e[type=text_display,tag=chameleon_name_tag]
execute unless entity @s[tag=shapeshifting] run kill @e[type=text_display,tag=chameleon_health_tag]

execute if entity @s[tag=shapeshifting] as @n[type=area_effect_cloud,tag=chameleon_breadcrumb,nbt={Age:5}] at @s run tp @n[type=mannequin,tag=chameleon_mannequin,distance=..6] @s
execute unless entity @s[predicate=is_sneaking] run data modify entity @n[type=mannequin,tag=chameleon_mannequin,distance=..6] pose set value "standing"
execute if entity @s[predicate=is_sneaking] run data modify entity @n[type=mannequin,tag=chameleon_mannequin,distance=..6] pose set value "crouching"
execute if entity @s[predicate=is_sneaking] run data modify entity @n[type=text_display,tag=chameleon_name_tag,distance=..6] see_through set value false
execute if entity @s[predicate=is_sneaking] run data modify entity @n[type=text_display,tag=chameleon_health_tag,distance=..6] see_through set value false
execute if entity @s[predicate=!is_sneaking] run data modify entity @n[type=text_display,tag=chameleon_name_tag,distance=..6] see_through set value true
execute if entity @s[predicate=!is_sneaking] run data modify entity @n[type=text_display,tag=chameleon_health_tag,distance=..6] see_through set value true
execute if entity @s[predicate=is_swimming] run data modify entity @n[type=mannequin,tag=chameleon_mannequin,distance=..6] pose set value "swimming"
execute run item replace entity @n[type=mannequin,tag=chameleon_mannequin] weapon.mainhand from entity @p[tag=saved_skin] weapon.mainhand
execute run item replace entity @n[type=mannequin,tag=chameleon_mannequin] weapon.offhand from entity @p[tag=saved_skin] weapon.offhand
execute run item replace entity @n[type=mannequin,tag=chameleon_mannequin] armor.head from entity @p[tag=saved_skin] armor.head
execute run item replace entity @n[type=mannequin,tag=chameleon_mannequin] armor.chest from entity @p[tag=saved_skin] armor.chest
execute run item replace entity @n[type=mannequin,tag=chameleon_mannequin] armor.legs from entity @p[tag=saved_skin] armor.legs
execute run item replace entity @n[type=mannequin,tag=chameleon_mannequin] armor.feet from entity @p[tag=saved_skin] armor.feet
execute at @n[type=mannequin] run tp @n[type=text_display,tag=chameleon_name_tag,distance=..6] ~ ~2.35 ~
execute at @n[type=mannequin] run tp @n[type=text_display,tag=chameleon_health_tag,distance=..6] ~ ~2.1 ~

execute if entity @s[tag=shapeshifting] unless entity @e[type=mannequin,tag=chameleon_mannequin,distance=..6] run function juggernaut:abilities/chameleon/exit_shapeshift
execute as @a[tag=shapeshifting] run function juggernaut:effects/apply_effect {effect:"undetectable",duration:1,color:"gray"}
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

# Hide Chameleon Mainhand
execute if items entity @s hotbar.0 copper_sword run item modify entity @s hotbar.0 {function:"set_components",components:{item_model:"copper_sword"}}
execute if items entity @s hotbar.1 bow run item modify entity @s hotbar.1 {function:"set_components",components:{item_model:"bow"}}
execute if entity @s[tag=shapeshifting] run item modify entity @s weapon.mainhand {function:"set_components",components:{item_model:"air"}}
execute if entity @s[tag=shapeshifting] run attribute @s camera_distance modifier add juggernaut:chameleon_shapeshift 3 add_value
execute if entity @s[tag=!shapeshifting] run attribute @s camera_distance modifier remove juggernaut:chameleon_shapeshift

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
    item_id:"minecraft:copper_ingot",\
    item_name:{"text": "Exit Shapeshift","color": "gray"},\
    description:[{"text": "Exit Shapeshifting mode and return to normal.","color": "gray"},{"text": "Cooldown: 1s","color": "dark_gray"}],\
    ability_id:"exit_shapeshift",\
    cooldown:0,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"ability_cooldown1",\
}

execute if entity @s[tag=!shapeshifting] run item replace entity @s hotbar.3 with copper_nugget[item_name=[{"text": "Exit Shapeshift","color": "gray"},{"text": " | ","color": "dark_gray","bold": true},{"text": "NOT AVAILABLE","color": "red","bold": true}],lore=[{"text": "Cannot exit shapeshift as you are not shapeshifting.","color": "gray"},{"text": "Cooldown: 1s","color": "dark_gray"}]]

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