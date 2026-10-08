# Ghost
execute as @s[predicate=is_sneaking,predicate=!underwater] run effect give @s invisibility 1 0 true
execute as @s[predicate=is_sneaking,predicate=!underwater] run attribute @s jump_strength modifier add juggernaut:ghost_sneaking_effects -100 add_multiplied_total
execute as @s[predicate=is_sneaking,predicate=!underwater] run function juggernaut:effects/apply_effect {effect:"undetectable",duration:1}

execute as @s[predicate=is_sneaking,predicate=!underwater] run attribute @s sneaking_speed modifier add juggernaut:ghost_sneaking_effects -100 add_multiplied_total
execute as @s[predicate=!is_sneaking,tag=!allow_ghost_invisibility,tag=!has_respawn_protection] at @s run effect clear @s invisibility
execute as @s[predicate=!is_sneaking] at @s run attribute @s jump_strength modifier remove juggernaut:ghost_sneaking_effects
execute as @s[predicate=!is_sneaking] at @s run attribute @s sneaking_speed modifier remove juggernaut:ghost_sneaking_effects

execute as @s[predicate=is_sneaking,predicate=!underwater,tag=!no_ghost_particles] run particle minecraft:ash ~ ~1 ~ 0.3 0.2 0.3 1 1 force @a

# Spectral Cloak (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"ghost",\
    item_model:"minecraft:echo_shard",\
    item_name:{"text": "Spectral Cloak","color": "gray"},\
    description:[[{text: "When used, any", color: "gray"}, {text: " Juggernaut", color: "#FF5555"}, {text: " purple warning particles", color: "gray"}], [{text: "are disabled on the current", color: "gray"}, {text: " replenishment station", color: "#3AC23A"},{text:",",color: "gray"}], [{text: "and you gain", color: "gray"}, {text: " Invisibility", color: "#E0F3FF"}, {text: " for 5 seconds.", color: "gray"}], [{text: "Additionally, you become", color: "gray"}, {text: " Undetectable", color: "#484848"}, {text: " and do not", color: "gray"}], [{text: "spawn sneaking particles for 10 seconds. You", color: "gray"}], [{text: "cannot", color: "gray"}, {text: " replenish", color: "#3AC23A"}, {text: " for the next 12 seconds.", color: "gray"}], [{text: "Cooldown: 45s", color: "dark_gray"}]],\
    ability_id:"spectral_cloak",\
    cooldown:45,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}

# Phase (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"ghost",\
    item_model:"minecraft:ender_pearl",\
    item_name:{"text": "Phase","color": "gray"},\
    description:[[{text: "Teleport", color: "#AA00AA"}, {text: " through a wall with a maximum of 3 blocks", color: "gray"}], [{text: "thickness.", color: "gray"}], [{text: "Cooldown: 45s", color: "dark_gray"}]],\
    ability_id:"phase",\
    cooldown:45,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown1",\
}

scoreboard players set #phase_hit var 0
execute anchored eyes if block ^ ^ ^2 #juggernaut:raycast_permeable if block ^ ^1 ^2 #juggernaut:raycast_permeable run scoreboard players set #phase_hit var 1
execute if score #phase_hit var matches 0 anchored eyes if block ^ ^ ^3 #juggernaut:raycast_permeable if block ^ ^1 ^3 #juggernaut:raycast_permeable run scoreboard players set #phase_hit var 1
execute if score #phase_hit var matches 0 anchored eyes if block ^ ^ ^4 #juggernaut:raycast_permeable if block ^ ^1 ^4 #juggernaut:raycast_permeable run scoreboard players set #phase_hit var 1
execute if entity @s[scores={ability_cooldown1=0}] if score #phase_hit var matches 1 run item modify entity @s hotbar.1 {type:"set_components",components:{item_model:"ender_eye"}}
execute if entity @s[predicate=is_invisible] run item modify entity @s weapon.mainhand {type:"set_components",components:{item_model:"air"}}