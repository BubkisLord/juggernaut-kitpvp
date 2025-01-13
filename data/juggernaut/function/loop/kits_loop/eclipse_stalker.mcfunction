# Eclipse Stalker
execute as @e[type=armor_stand,tag=camera] at @s run particle white_smoke ~ ~ ~ 0.25 0.25 0.25 0 10 force @a

execute as @a[tag=using_camera] at @s as @n[type=armor_stand,tag=used_camera] at @s run tp @p[tag=using_camera] ~ ~ ~
execute as @a[tag=shadow_marked] at @s run particle flame ~ ~0.5 ~ 1.5 1.5 1.5 0 1 force @a[tag=juggernaut]


execute if entity @a[tag=eclipse_stalker,tag=!using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:'{"text": "Place Camera","color": "#FFD700"}',\
    ability_id:"place_cam",\
    cooldown:4,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown",\
}

execute if entity @a[tag=eclipse_stalker,tag=!using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:'{"text": "Use Camera","color": "#FFD700"}',\
    ability_id:"use_cam",\
    cooldown:2,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"jug_kit_cooldown_2",\
}

execute if entity @a[tag=eclipse_stalker,tag=using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:'{"text": "Change Camera","color": "#FFD700"}',\
    ability_id:"switch_cam",\
    cooldown:1,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown_2",\
}

execute if entity @a[tag=eclipse_stalker,tag=using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:'{"text": "Leave Camera","color": "#FFD700"}',\
    ability_id:"leave_cam",\
    cooldown:30,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"jug_kit_cooldown_2",\
}

execute if entity @a[tag=eclipse_stalker,tag=using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:'{"text": "Kill Camera","color": "#FFD700"}',\
    ability_id:"kill_cam",\
    cooldown:2,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"jug_kit_cooldown_2",\
}

execute if entity @a[tag=eclipse_stalker,tag=using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:magma_cream",\
    item_name:'{"text": "Shadow Mark","color": "#cc3c3c"}',\
    ability_id:"mark_enemy",\
    cooldown:5,\
    hotbar_slot:"hotbar.5",\
    cooldown_var:"shadow_mark_cooldown",\
}

execute if entity @a[tag=eclipse_stalker,tag=using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:fire_charge",\
    item_name:'{"text": "Materialise","color": "#aa0000"}',\
    ability_id:"materialise",\
    cooldown:5,\
    hotbar_slot:"hotbar.6",\
    cooldown_var:"shadow_mark_cooldown",\
}