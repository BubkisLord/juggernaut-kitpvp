execute if score #juggernaut_customisation random_perks matches 0 if items entity @s container.* minecraft:danger_pottery_sherd run function juggernaut:perk_management/add_perk/runner {perk_id:"sentinel",perk_name:"Sentinel"}
execute if score #juggernaut_customisation random_perks matches 0 if items entity @s container.* minecraft:heart_pottery_sherd run function juggernaut:perk_management/add_perk/runner {perk_id:"healer",perk_name:"Healer"}
execute if score #juggernaut_customisation random_perks matches 0 if items entity @s container.* minecraft:heartbreak_pottery_sherd run function juggernaut:perk_management/add_perk/runner {perk_id:"no_caution",perk_name:"No Time for Caution"}
execute if score #juggernaut_customisation random_perks matches 0 if items entity @s container.* minecraft:scrape_pottery_sherd run function juggernaut:perk_management/add_perk/runner {perk_id:"blood_pact",perk_name:"Blood Pact"}
execute if score #juggernaut_customisation random_perks matches 0 if items entity @s container.* minecraft:burn_pottery_sherd run function juggernaut:perk_management/add_perk/runner {perk_id:"second_wind",perk_name:"Second Wind"}
execute if score #juggernaut_customisation random_perks matches 0 if items entity @s container.* minecraft:flow_pottery_sherd run function juggernaut:perk_management/add_perk/runner {perk_id:"quickened_stealth",perk_name:"Quickened Stealth"}
execute if score #juggernaut_customisation random_perks matches 0 if items entity @s container.* minecraft:brewer_pottery_sherd run function juggernaut:perk_management/add_perk/runner {perk_id:"healthy_preparation",perk_name:"Healthy Preparation"}
execute if score #juggernaut_customisation random_perks matches 0 if items entity @s container.* minecraft:skull_pottery_sherd run function juggernaut:perk_management/add_perk/runner {perk_id:"undying_ties",perk_name:"Undying Ties"}
execute if score #juggernaut_customisation random_perks matches 0 if items entity @s container.* minecraft:prize_pottery_sherd run function juggernaut:perk_management/add_perk/runner {perk_id:"unwavering_strength",perk_name:"Unwavering Strength"}
execute if score #juggernaut_customisation random_perks matches 0 if items entity @s container.* minecraft:friend_pottery_sherd run function juggernaut:perk_management/add_perk/runner {perk_id:"durable",perk_name:"Durable"}
execute if score #juggernaut_customisation random_perks matches 0 if items entity @s container.* minecraft:blade_pottery_sherd run function juggernaut:perk_management/add_perk/runner {perk_id:"hopeful_sprint",perk_name:"Hopeful Sprint"}
execute if score #juggernaut_customisation random_perks matches 0 if items entity @s container.* minecraft:plenty_pottery_sherd run function juggernaut:perk_management/add_perk/runner {perk_id:"determination",perk_name:"Determination"}
execute if score #juggernaut_customisation random_perks matches 0 if items entity @s container.* minecraft:miner_pottery_sherd run function juggernaut:perk_management/add_perk/runner {perk_id:"lightweight",perk_name:"Lightweight"}
execute if score #juggernaut_customisation random_perks matches 0 if items entity @s container.* minecraft:howl_pottery_sherd run function juggernaut:perk_management/add_perk/runner {perk_id:"teeny_weeny",perk_name:"Teeny Weeny"}

execute if items entity @s container.* end_crystal[item_name={"text": "Get Random Perks","color": "red"}] run function juggernaut:perk_management/equip_random/runner
execute if items entity @s container.* end_crystal[item_name={"text": "Get Random Perks","color": "red"}] run clear @s end_crystal[item_name={"text": "Get Random Perks","color": "red"}]

execute if items entity @s container.* barrier[item_name={"text":"Reset Perk Selection","color":"red"}] run function juggernaut:perk_management/remove_perks
execute if items entity @s container.* barrier[item_name={"text":"Reset Perk Selection","color":"red"}] at @s run playsound block.note_block.cow_bell ui @s ~ ~ ~
execute if items entity @s container.* barrier[item_name={"text":"Reset Perk Selection","color":"red"}] at @s run particle witch ~ ~ ~ 0.3 0.5 0.3 0 100
execute if items entity @s container.* barrier[item_name={"text":"Reset Perk Selection","color":"red"}] if score #juggernaut_customisation random_perks matches 1 run scoreboard players add @s perk_rerolls 1
execute if items entity @s container.* barrier[item_name={"text":"Reset Perk Selection","color":"red"}] run function juggernaut:perk_management/give_runner_perks
execute if items entity @s container.* barrier[item_name={"text":"Reset Perk Selection","color":"red"}] run clear @s barrier[item_name={"text":"Reset Perk Selection","color":"red"}]
