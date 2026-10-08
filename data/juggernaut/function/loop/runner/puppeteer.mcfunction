# Puppeteer
scoreboard players operation #pp_link var = @s puppet_id
execute as @e[type=mannequin,tag=encore_mannequin] if score @s puppet_id = #pp_link var run tag @s add owned_puppet

execute unless entity @s[tag=has_mannequin] run function juggernaut:ability_management/check_ability {\
    player_tag:"puppeteer",\
    item_model:"minecraft:armor_stand",\
    item_name:{text: "Summon Mannequin",color: "#cfc7ba"},\
    description:[[{text: "Summon a mannequin clone of you. It is able to", color: "gray"}], [{text: "replenish", color: "#3AC23A"}, {text: " at 60% speed. If the mannequin dies,", color: "gray"}], [{text: "you die.", color: "gray"}], [{text: "Cooldown: 15s", color: "dark_gray"}]],\
    ability_id:"summon_mannequin",\
    cooldown:120,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}

scoreboard players operation #pp_link var = @s puppet_id
tag @e[type=mannequin,tag=puppeteer_mannequin] remove pp_owned
execute as @e[type=mannequin,tag=puppeteer_mannequin] if score @s puppet_id = #pp_link var run tag @s add pp_owned
execute if entity @s[tag=has_mannequin] if entity @e[type=mannequin,tag=puppeteer_mannequin,tag=pp_owned,distance=..6] run function juggernaut:ability_management/check_ability {\
    player_tag:"puppeteer",\
    item_model:"minecraft:lead",\
    item_name:{text: "Pickup Mannequin",color: "#cfc7ba"},\
    description:[[{text: "Pick up your placed mannequin within 6 blocks.", color: "gray"}], [{text: "Cooldown: 15s", color: "dark_gray"}]],\
    ability_id:"pickup_mannequin",\
    cooldown:15,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}

execute if entity @s[tag=has_mannequin] unless entity @e[type=mannequin,tag=puppeteer_mannequin,tag=pp_owned,distance=..6] run function juggernaut:ability_management/check_ability {\
    player_tag:"puppeteer",\
    item_model:"minecraft:blaze_powder",\
    item_name:{text: "Unbind Mannequin",color: "#cfc7ba"},\
    description:[[{text: "Unbind", color: "#cfc7ba"}, {text: " your mannequin, destroying it without killing you.", color: "gray"}], [{text: "You will not be able to place your mannequin again for an extended duration.", color: "gray"}], [{text: "Cooldown: 2m", color: "dark_gray"}]],\
    ability_id:"unbind_mannequin",\
    cooldown:120,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}

execute if entity @s[tag=has_mannequin] run function juggernaut:ability_management/check_ability {\
    player_tag:"puppeteer",\
    item_model:"minecraft:resin_brick",\
    item_name:{text: "Swap",color: "#cfc7ba"},\
    description:[[{text: "Swap", color: "#cfc7ba"}, {text: " places with your mannequin.", color: "gray"}], [{text: "Cooldown: 1s", color: "dark_gray"}]],\
    ability_id:"swap_mannequin",\
    cooldown:1,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown1",\
}

execute unless entity @s[tag=performing] run function juggernaut:ability_management/check_ability {\
    player_tag:"puppeteer",\
    item_model:"minecraft:writable_book",\
    item_name:{text: "Perform",color: "#cfc7ba"},\
    description:[[{text: "Perform", color: "#cfc7ba"}, {text: " for 20s, creating a path for your encore to emulate later.", color: "gray"}], [{text: "Cooldown: 20s", color: "dark_gray"}]],\
    ability_id:"perform",\
    cooldown:20,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"ability_cooldown2",\
}

execute if entity @s[tag=performing] run function juggernaut:ability_management/check_ability {\
    player_tag:"puppeteer",\
    item_model:"minecraft:written_book",\
    item_name:{text: "End Performance",color: "#cfc7ba"},\
    description:[[{text: "End your performance prematurely.", color: "gray"}], [{text: "Cooldown: 0s", color: "dark_gray"}]],\
    ability_id:"end_perform",\
    cooldown:1,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"ability_cooldown3",\
}

execute unless entity @s[tag=performing] unless entity @e[type=mannequin,tag=encore_mannequin,tag=owned_puppet] run function juggernaut:ability_management/check_ability {\
    player_tag:"puppeteer",\
    item_model:"minecraft:knowledge_book",\
    item_name:{text: "Encore",color: "#cfc7ba"},\
    description:[[{text: "Make a ventriloquist dummy follow the path you made during your performance.", color: "gray"}], [{text: "Cooldown: 30s", color: "dark_gray"}]],\
    ability_id:"encore",\
    cooldown:30,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"ability_cooldown4",\
}

# function juggernaut:ability_management/check_ability {\
#     player_tag:"phantom",\
#     item_model:"minecraft:",\
#     item_name:{"text": "Haunt Station","color": "#5e556e"},\
#     description:[[{text: "Apparate at a", color: "gray"}, {text: " replenishment station", color: "#3AC23A"}, {text: " that you are", color: "gray"}], [{text: "looking at. Hold out the item and look at a", color: "gray"}], [{text: "replenishment station", color: "#3AC23A"}, {text: " . When it is a valid", color: "gray"}], [{text: "teleport", color: "#AA00AA"}, {text: " it will change color.", color: "gray"}], [{text: "Cooldown: 40s", color: "dark_gray"}]],\
#     ability_id:"tp_station",\
#     cooldown:40,\
#     hotbar_slot:"hotbar.5",\
#     cooldown_var:"ability_cooldown5",\
# }

# execute if entity @s[nbt={SelectedItem:{id:"minecraft:iron_nugget",components:{"minecraft:custom_data":{kit:"phantom",ability_id:""}}}}] run function juggernaut:raycasts/raycast {\
#     player_tag:"phantom",\
#     raycast_id:"check_haunt_target",\
#     target_tag:"replenishment.station",\
#     hit_distance:3,\
#     raycast_limit:250,\
#     collides_with_blocks:0,\
# }

execute if entity @s[tag=!has_mannequin,tag=!spectator] run item replace entity @s hotbar.1 with brick[item_name=[{text: "Swap",color: "#cfc7ba"},{text: " | ",color: "dark_gray","bold": true},{text: "NOT AVAILABLE",color: "red","bold": true}],lore=[{text: "Cannot swap without a mannequin.",color: "gray"},{text: "Cooldown: 1s",color: "dark_gray"}]]
execute if entity @s[tag=performing,tag=!spectator] run item replace entity @s hotbar.3 with knowledge_book[item_name=[{text: "Encore",color: "#cfc7ba"},{text: " | ",color: "dark_gray","bold": true},{text: "NOT AVAILABLE",color: "red","bold": true}],lore=[{text: "Cannot use encore mid-performance.",color: "gray"},{text: "Cooldown: 30s",color: "dark_gray"}]]
execute unless entity @s[tag=performing,tag=!spectator] if entity @e[type=mannequin,tag=encore_mannequin,tag=owned_puppet] run item replace entity @s hotbar.3 with knowledge_book[item_name=[{text: "Encore",color: "#cfc7ba"},{text: " | ",color: "dark_gray","bold": true},{text: "NOT AVAILABLE",color: "red","bold": true}],lore=[{text: "There is already an encore active.",color: "gray"},{text: "Cooldown: 30s",color: "dark_gray"}]]

execute if entity @s[tag=performing] run summon marker ~ ~ ~ {Tags:["performance_path","kill_on_end_game"],NoGravity:true,data:{"age":0}}
data modify entity @n[type=marker,tag=performance_path,nbt={data:{age:0}}] Rotation set from entity @s Rotation

execute store result storage juggernaut:encore age int 1 run scoreboard players get @n[type=mannequin,tag=encore_mannequin] start_performance_tick
execute as @n[type=mannequin,tag=encore_mannequin,tag=owned_puppet] at @s run function juggernaut:abilities/puppeteer/update_encore_location with storage juggernaut:encore
execute as @n[type=mannequin,tag=encore_mannequin,tag=owned_puppet] run tag @s remove owned_puppet
scoreboard players add @s start_performance_tick 1

# Bound Soul passive: if the summoned mannequin has been destroyed, the puppeteer dies too.
execute if entity @s[tag=has_mannequin] run function juggernaut:abilities/puppeteer/check_mannequin_alive

# The mannequin passively replenishes the nearest station
execute if entity @s[tag=has_mannequin] run function juggernaut:abilities/puppeteer/mannequin_replenish

# data modify entity @n[type=wandering_trader,tag=mannequin_pather,tag=owned_trader] wander_target set from entity @s Pos