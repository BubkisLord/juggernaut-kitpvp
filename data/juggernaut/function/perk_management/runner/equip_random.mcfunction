execute if score @s perks_enabled >= #juggernaut_customisation max_perks_equipped run return fail

scoreboard players set #roll var 0
execute store result score #roll var run random value 0..17

execute if score #roll var matches 0 if entity @s[tag=using_sentinel] run function juggernaut:perk_management/runner/equip_random
execute if score #roll var matches 0 unless entity @s[tag=using_sentinel] run function juggernaut:perk_management/runner/add_perk {perk_id:"sentinel",perk_name:"Sentinel"}

execute if score #roll var matches 1 if entity @s[tag=using_healer] run function juggernaut:perk_management/runner/equip_random
execute if score #roll var matches 1 unless entity @s[tag=using_healer] run function juggernaut:perk_management/runner/add_perk {perk_id:"healer",perk_name:"Healer"}

execute if score #roll var matches 2 if entity @s[tag=using_no_caution] run function juggernaut:perk_management/runner/equip_random
execute if score #roll var matches 2 unless entity @s[tag=using_no_caution] run function juggernaut:perk_management/runner/add_perk {perk_id:"no_caution",perk_name:"No Time for Caution"}

execute if score #roll var matches 3 if entity @s[tag=using_blood_pact] run function juggernaut:perk_management/runner/equip_random
execute if score #roll var matches 3 unless entity @s[tag=using_blood_pact] run function juggernaut:perk_management/runner/add_perk {perk_id:"blood_pact",perk_name:"Blood Pact"}

execute if score #roll var matches 4 if entity @s[tag=using_second_wind] run function juggernaut:perk_management/runner/equip_random
execute if score #roll var matches 4 unless entity @s[tag=using_second_wind] run function juggernaut:perk_management/runner/add_perk {perk_id:"second_wind",perk_name:"Second Wind"}

execute if score #roll var matches 5 if entity @s[tag=using_quickened_stealth] run function juggernaut:perk_management/runner/equip_random
execute if score #roll var matches 5 unless entity @s[tag=using_quickened_stealth] run function juggernaut:perk_management/runner/add_perk {perk_id:"quickened_stealth",perk_name:"Quickened Stealth"}

execute if score #roll var matches 6 if entity @s[tag=using_healthy_preparation] run function juggernaut:perk_management/runner/equip_random
execute if score #roll var matches 6 unless entity @s[tag=using_healthy_preparation] run function juggernaut:perk_management/runner/add_perk {perk_id:"healthy_preparation",perk_name:"Healthy Preparation"}

execute if score #roll var matches 7 if entity @s[tag=using_undying_ties] run function juggernaut:perk_management/runner/equip_random
execute if score #roll var matches 7 unless entity @s[tag=using_undying_ties] run function juggernaut:perk_management/runner/add_perk {perk_id:"undying_ties",perk_name:"Undying Ties"}

execute if score #roll var matches 8 if entity @s[tag=using_unwavering_strength] run function juggernaut:perk_management/runner/equip_random
execute if score #roll var matches 8 unless entity @s[tag=using_unwavering_strength] run function juggernaut:perk_management/runner/add_perk {perk_id:"unwavering_strength",perk_name:"Unwavering Strength"}

execute if score #roll var matches 9 if entity @s[tag=using_durable] run function juggernaut:perk_management/runner/equip_random
execute if score #roll var matches 9 unless entity @s[tag=using_durable] run function juggernaut:perk_management/runner/add_perk {perk_id:"durable",perk_name:"Durable"}

execute if score #roll var matches 10 if entity @s[tag=using_hopeful_sprint] run function juggernaut:perk_management/runner/equip_random
execute if score #roll var matches 10 unless entity @s[tag=using_hopeful_sprint] run function juggernaut:perk_management/runner/add_perk {perk_id:"hopeful_sprint",perk_name:"Hopeful Sprint"}

execute if score #roll var matches 11 if entity @s[tag=using_determination] run function juggernaut:perk_management/runner/equip_random
execute if score #roll var matches 11 unless entity @s[tag=using_determination] run function juggernaut:perk_management/runner/add_perk {perk_id:"determination",perk_name:"Determination"}

execute if score #roll var matches 12 if entity @s[tag=using_teeny_weeny] run function juggernaut:perk_management/runner/equip_random
execute if score #roll var matches 12 unless entity @s[tag=using_teeny_weeny] run function juggernaut:perk_management/runner/add_perk {perk_id:"teeny_weeny",perk_name:"Teeny Weeny"}

execute if score #roll var matches 13 if entity @s[tag=using_lightweight] run function juggernaut:perk_management/runner/equip_random
execute if score #roll var matches 13 unless entity @s[tag=using_lightweight] run function juggernaut:perk_management/runner/add_perk {perk_id:"lightweight",perk_name:"Lightweight"}

execute if score #roll var matches 14 if entity @s[tag=using_tailgater] run function juggernaut:perk_management/runner/equip_random
execute if score #roll var matches 14 unless entity @s[tag=using_tailgater] run function juggernaut:perk_management/runner/add_perk {perk_id:"tailgater",perk_name:"Tailgater"}

execute if score #roll var matches 15 if entity @s[tag=using_overclock] run function juggernaut:perk_management/runner/equip_random
execute if score #roll var matches 15 unless entity @s[tag=using_overclock] run function juggernaut:perk_management/runner/add_perk {perk_id:"overclock",perk_name:"Overclock"}

execute if score #roll var matches 16 if entity @s[tag=using_optimised] run function juggernaut:perk_management/runner/equip_random
execute if score #roll var matches 16 unless entity @s[tag=using_optimised] run function juggernaut:perk_management/runner/add_perk {perk_id:"optimised",perk_name:"Optimised"}

execute if score #roll var matches 17 if entity @s[tag=using_any_means] run function juggernaut:perk_management/runner/equip_random
execute if score #roll var matches 17 unless entity @s[tag=using_any_means] run function juggernaut:perk_management/runner/add_perk {perk_id:"any_means",perk_name:"Any Means Necessary"}

execute if score @s perks_enabled < #juggernaut_customisation max_perks_equipped run function juggernaut:perk_management/runner/equip_random