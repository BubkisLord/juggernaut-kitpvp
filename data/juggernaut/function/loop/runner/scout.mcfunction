# Revealing Powder (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"scout",\
    item_model:"minecraft:glowstone_dust",\
    item_name:{text: "Revealing Powder",color: "gold"},\
    description:[[{text: "Reveal all", color: "gray"}, {text: " Juggernauts", color: "#FF5555"}, {text: " for 12 seconds.", color: "gray"}], [{text: "Cooldown: 25s", color: "dark_gray"}]],\
    ability_id:"reveal_jugs",\
    cooldown:25,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown0",\
}

execute if predicate is_sneaking run effect give @s slow_falling 1 0 true
execute if predicate is_sneaking if block ~ ~-2 ~ #juggernaut:raycast_permeable run attribute @s air_drag_modifier base set 0
execute unless predicate is_sneaking run attribute @s air_drag_modifier base reset
execute unless block ~ ~-2 ~ #juggernaut:raycast_permeable run attribute @s air_drag_modifier base reset