execute if score @s perks_enabled >= #juggernaut_customisation max_perks_equipped run return fail

scoreboard players set #roll var 0
execute store result score #roll var run random value 0..16

execute if score #roll var matches 0 if entity @s[tag=using_predatory_instincts] run function juggernaut:perk_management/equip_random/juggernaut
execute if score #roll var matches 0 unless entity @s[tag=using_predatory_instincts] run function juggernaut:perk_management/add_perk/juggernaut {perk_id:"predatory_instincts",perk_name:"Predatory Instincts"}

execute if score #roll var matches 1 if entity @s[tag=using_unyielding_wrath] run function juggernaut:perk_management/equip_random/juggernaut
execute if score #roll var matches 1 unless entity @s[tag=using_unyielding_wrath] run function juggernaut:perk_management/add_perk/juggernaut {perk_id:"unyielding_wrath",perk_name:"Unyielding Wrath"}

execute if score #roll var matches 2 if entity @s[tag=using_domination] run function juggernaut:perk_management/equip_random/juggernaut
execute if score #roll var matches 2 unless entity @s[tag=using_domination] run function juggernaut:perk_management/add_perk/juggernaut {perk_id:"domination",perk_name:"Domination"}

execute if score #roll var matches 3 if entity @s[tag=using_brutal_efficiency] run function juggernaut:perk_management/equip_random/juggernaut
execute if score #roll var matches 3 unless entity @s[tag=using_brutal_efficiency] run function juggernaut:perk_management/add_perk/juggernaut {perk_id:"brutal_efficiency",perk_name:"Brutal Efficiency"}

execute if score #roll var matches 4 if entity @s[tag=using_rapid_brutality] run function juggernaut:perk_management/equip_random/juggernaut
execute if score #roll var matches 4 unless entity @s[tag=using_rapid_brutality] run function juggernaut:perk_management/add_perk/juggernaut {perk_id:"rapid_brutality",perk_name:"Rapid Brutality"}

execute if score #roll var matches 5 if entity @s[tag=using_floods_of_rage] run function juggernaut:perk_management/equip_random/juggernaut
execute if score #roll var matches 5 unless entity @s[tag=using_floods_of_rage] run function juggernaut:perk_management/add_perk/juggernaut {perk_id:"floods_of_rage",perk_name:"Floods of Rage"}

execute if score #roll var matches 6 if entity @s[tag=using_pressure_point] run function juggernaut:perk_management/equip_random/juggernaut
execute if score #roll var matches 6 unless entity @s[tag=using_pressure_point] run function juggernaut:perk_management/add_perk/juggernaut {perk_id:"pressure_point",perk_name:"Pressure Point"}

execute if score #roll var matches 7 if entity @s[tag=using_overwhelming_presence] run function juggernaut:perk_management/equip_random/juggernaut
execute if score #roll var matches 7 unless entity @s[tag=using_overwhelming_presence] run function juggernaut:perk_management/add_perk/juggernaut {perk_id:"overwhelming_presence",perk_name:"Overwhelming Presence"}

execute if score #roll var matches 8 if entity @s[tag=using_bane_of_solitude] run function juggernaut:perk_management/equip_random/juggernaut
execute if score #roll var matches 8 unless entity @s[tag=using_bane_of_solitude] run function juggernaut:perk_management/add_perk/juggernaut {perk_id:"bane_of_solitude",perk_name:"Bane of Solitude"}

execute if score #roll var matches 9 if entity @s[tag=using_crippling_defeat] run function juggernaut:perk_management/equip_random/juggernaut
execute if score #roll var matches 9 unless entity @s[tag=using_crippling_defeat] run function juggernaut:perk_management/add_perk/juggernaut {perk_id:"crippling_defeat",perk_name:"Crippling Defeat"}

execute if score #roll var matches 10 if entity @s[tag=using_waiting_game] run function juggernaut:perk_management/equip_random/juggernaut
execute if score #roll var matches 10 unless entity @s[tag=using_waiting_game] run function juggernaut:perk_management/add_perk/juggernaut {perk_id:"waiting_game",perk_name:"Waiting Game"}

execute if score #roll var matches 11 if entity @s[tag=using_adept_stalker] run function juggernaut:perk_management/equip_random/juggernaut
execute if score #roll var matches 11 unless entity @s[tag=using_adept_stalker] run function juggernaut:perk_management/add_perk/juggernaut {perk_id:"adept_stalker",perk_name:"Adept Stalker"}

execute if score #roll var matches 12 if entity @s[tag=using_insidious] run function juggernaut:perk_management/equip_random/juggernaut
execute if score #roll var matches 12 unless entity @s[tag=using_insidious] run function juggernaut:perk_management/add_perk/juggernaut {perk_id:"insidious",perk_name:"Insidious"}

execute if score #roll var matches 13 if entity @s[tag=using_hunters_instinct] run function juggernaut:perk_management/equip_random/juggernaut
execute if score #roll var matches 13 unless entity @s[tag=using_hunters_instinct] run function juggernaut:perk_management/add_perk/juggernaut {perk_id:"hunters_instinct",perk_name:"Hunter's Instinct"}

execute if score #roll var matches 14 if entity @s[tag=using_fury] run function juggernaut:perk_management/equip_random/juggernaut
execute if score #roll var matches 14 unless entity @s[tag=using_fury] run function juggernaut:perk_management/add_perk/juggernaut {perk_id:"fury",perk_name:"Fury"}

execute if score #roll var matches 15 if entity @s[tag=using_oppression] run function juggernaut:perk_management/equip_random/juggernaut
execute if score #roll var matches 15 unless entity @s[tag=using_oppression] run function juggernaut:perk_management/add_perk/juggernaut {perk_id:"oppression",perk_name:"Oppression"}

execute if score #roll var matches 16 if entity @s[tag=using_deep_cuts] run function juggernaut:perk_management/equip_random/juggernaut
execute if score #roll var matches 16 unless entity @s[tag=using_deep_cuts] run function juggernaut:perk_management/add_perk/juggernaut {perk_id:"deep_cuts",perk_name:"Deep Cuts"}

execute if score @s perks_enabled < #1 var run function juggernaut:perk_management/equip_random/juggernaut