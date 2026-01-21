# Eclipse Stalker
execute as @e[type=armor_stand,tag=camera,tag=!used_camera] at @s run particle white_smoke ~ ~0.2 ~ 0.25 0.25 0.25 0 10 force @a
execute as @e[type=armor_stand,tag=used_camera] at @s run particle dust{scale:2,color:13514037} ~ ~0.2 ~ 0.25 0.25 0.25 0 20 force @a[tag=runner]
execute as @e[type=armor_stand,tag=used_camera] at @s run particle dust{scale:0.4,color:13514037} ~ ~0.2 ~ 0.25 0.25 0.25 0 20 force @a[tag=eclipse_stalker]

execute if entity @e[type=armor_stand,tag=camera] as @e[type=armor_stand,tag=camera] at @s unless block ~ ~0.2 ~ #air run tp @s ~ ~0.1 ~

execute as @a[tag=using_camera] at @s as @n[type=armor_stand,tag=used_camera] at @s positioned ~ ~0.2 ~ run tp @p[tag=using_camera] ~ ~ ~
execute as @a[tag=shadow_marked] at @s run particle flame ~ ~0.5 ~ 1.5 1.5 1.5 0 1 force @a[tag=juggernaut]

execute if entity @a[tag=eclipse_stalker] as @a[tag=eclipse_stalker] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:{"text": "Place Camera","color": "#FFD700"},\
    description:[{"text": "Place a camera where you are looking. (Max 6 Cameras)","color": "gray"},{"text": "Cooldown: 2s","color": "dark_gray"}],\
    ability_id:"place_cam",\
    cooldown:2,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown",\
}

execute if entity @a[tag=eclipse_stalker,tag=!using_camera] as @a[tag=eclipse_stalker,tag=!using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:{"text": "Use Camera","color": "#FFD700"},\
    description:[{"text": "Enter the camera that you are currently looking at.","color": "gray"},{"text": "Cooldown: 2s","color": "dark_gray"}],\
    ability_id:"use_cam",\
    cooldown:2,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"jug_kit_cooldown_2",\
}

execute if entity @a[tag=eclipse_stalker,tag=using_camera] as @a[tag=eclipse_stalker,tag=using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:{"text": "Switch to Camera","color": "#FFD700"},\
    description:[{"text": "Leave the current camera and switch to the camera you are looking at.","color": "gray"},{"text": "Your original position will not change.","color": "gray"},{"text": "Cooldown: 2s","color": "dark_gray"}],\
    ability_id:"switch_to_cam",\
    cooldown:2,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"jug_kit_cooldown_2",\
}

execute if entity @a[tag=eclipse_stalker,tag=using_camera] as @a[tag=eclipse_stalker,tag=using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:{"text": "Kill Camera","color": "#FFD700"},\
    description:[{"text": "Remove the current camera and return to original position. (Max 6 Cameras)","color": "gray"},{"text": "Cooldown: 1s","color": "dark_gray"}],\
    ability_id:"kill_cam",\
    cooldown:1,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"jug_kit_cooldown_2",\
}

execute if entity @a[tag=eclipse_stalker,tag=!using_camera] as @a[tag=eclipse_stalker,tag=!using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:{"text": "Destroy Camera","color": "#FFD700"},\
    description:[{"text": "Destroy the camera you are currently looking at.","color": "gray"},{"text": "Cooldown: 1s","color": "dark_gray"}],\
    ability_id:"destroy_cam",\
    cooldown:1,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"jug_kit_cooldown_2",\
}

execute if entity @a[tag=eclipse_stalker,tag=using_camera] as @a[tag=eclipse_stalker,tag=using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:{"text": "Switch to Random Camera","color": "#FFD700"},\
    description:[{"text": "Leave the current camera view and return to original position.","color": "gray"},{"text": "Cooldown: 2s","color": "dark_gray"}],\
    ability_id:"switch_cam",\
    cooldown:0,\
    hotbar_slot:"hotbar.4",\
    cooldown_var:"jug_kit_cooldown_2",\
}

execute if entity @a[tag=eclipse_stalker,tag=!using_camera] as @a[tag=eclipse_stalker,tag=!using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:{"text": "Destroy Random Camera","color": "#FFD700"},\
    description:[{"text": "Remove a random existing camera. (Max 6 cameras)","color": "gray"},{"text": "Cooldown: 1s","color": "dark_gray"}],\
    ability_id:"destroy_random_cam",\
    cooldown:1,\
    hotbar_slot:"hotbar.4",\
    cooldown_var:"jug_kit_cooldown_2",\
}

execute if entity @a[tag=eclipse_stalker,tag=using_camera] as @a[tag=eclipse_stalker,tag=using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:{"text": "Leave Camera","color": "#FFD700"},\
    description:[{"text": "Leave the current camera view and return to original position.","color": "gray"},{"text": "Cooldown: 2s","color": "dark_gray"}],\
    ability_id:"leave_cam",\
    cooldown:2,\
    hotbar_slot:"hotbar.5",\
    cooldown_var:"jug_kit_cooldown_2",\
}

execute if entity @a[tag=eclipse_stalker,tag=!using_camera] as @a[tag=eclipse_stalker,tag=!using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:{"text": "Destroy Closest Camera","color": "#FFD700"},\
    description:[{"text": "Remove the closest current camera to you. (Max 6 cameras)","color": "gray"},{"text": "Cooldown: 0s","color": "dark_gray"}],\
    ability_id:"kill_closest_cam",\
    cooldown:0,\
    hotbar_slot:"hotbar.5",\
    cooldown_var:"jug_kit_cooldown_2",\
}

execute if entity @a[tag=eclipse_stalker,tag=using_camera] unless entity @a[tag=shadow_marked] as @a[tag=eclipse_stalker,tag=using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:magma_cream",\
    item_name:{"text": "Shadow Mark","color": "#cc3c3c"},\
    description:[{"text": "Mark the runner you are currently looking at.","color": "gray"},{"text": "Cooldown: 5s","color": "dark_gray"}],\
    ability_id:"mark_enemy",\
    cooldown:5,\
    hotbar_slot:"hotbar.6",\
    cooldown_var:"shadow_mark_cooldown",\
}

execute if entity @a[tag=eclipse_stalker] if entity @a[tag=shadow_marked] as @a[tag=eclipse_stalker] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:ender_eye",\
    item_name:{"text": "Teleport to Player","color": "#FFD700"},\
    description:[{"text": "Teleport to the runner you are currently looking at.","color": "gray"},{"text": "A runner must already be marked to be teleported to.","color": "gray"},{"text": "Cooldown: 6s","color": "dark_gray"}],\
    ability_id:"materialise",\
    cooldown:6,\
    hotbar_slot:"hotbar.6",\
    cooldown_var:"shadow_mark_cooldown",\
}

execute if entity @a[tag=eclipse_stalker,tag=!using_camera] unless entity @a[tag=shadow_marked] as @a[tag=eclipse_stalker,tag=!using_camera] run function juggernaut:ability_management/check_ability {\
    player_tag:"eclipse_stalker",\
    item_id:"minecraft:barrier",\
    item_name:{"text": "Use Camera to Mark","color": "#FFD700"},\
    description:[{"text": "You cannot mark a player outside of a camera,","color": "gray"},{"text": "and you have no marked players.","color": "gray"},{"text": "Cooldown: 0s","color": "dark_gray"}],\
    ability_id:"",\
    cooldown:0,\
    hotbar_slot:"hotbar.6",\
    cooldown_var:"shadow_mark_cooldown",\
}
