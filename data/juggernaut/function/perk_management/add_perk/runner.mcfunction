function juggernaut:perk_management/give_runner_perks

# Deny equipping if perk already equipped
$execute if entity @s[tag=using_$(perk_id)] run playsound block.note_block.didgeridoo ui @s ~ ~ ~ 1.2
$execute if entity @s[tag=using_$(perk_id)] run particle angry_villager ~ ~ ~ 0.3 0.5 0.3 0 10
$execute if entity @s[tag=using_$(perk_id)] run clear @s #decorated_pot_sherds
$execute if entity @s[tag=using_$(perk_id)] run tellraw @s [{"text": "Could not equip ","color":"white",bold:false},{"text": "$(perk_name)","color":"aqua",bold:true},{"text": " Perk.\n","color":"white",bold:false},{"text": "Reason:\n",bold:true},{"text": "You have already equipped this perk.","color":"white",bold:false}]
$execute if entity @s[tag=using_$(perk_id)] run return fail

# Deny equipping if already at max perks
execute if score @s perks_enabled >= #juggernaut_customisation max_perks_equipped at @s run playsound block.note_block.didgeridoo ui @s ~ ~ ~ 1.2
execute if score @s perks_enabled >= #juggernaut_customisation max_perks_equipped at @s run particle angry_villager ~ ~ ~ 0.3 0.5 0.3 0 10
execute if score @s perks_enabled >= #juggernaut_customisation max_perks_equipped at @s run clear @s #decorated_pot_sherds
$execute if score @s perks_enabled >= #juggernaut_customisation max_perks_equipped at @s run tellraw @s [{"text": "Could not equip ","color":"white",bold:false},{"text": "$(perk_name)","color":"aqua",bold:true},{"text": " Perk.\n","color":"white",bold:false},{"text": "Reason:\n","color":"aqua",bold:true},{"text": "You have already equipped the maximum amount of perks.","color":"white",bold:false}]
execute if score @s perks_enabled >= #juggernaut_customisation max_perks_equipped run return fail

# Successfully equip perk
$tag @s add using_$(perk_id)
$tellraw @a[tag=runner] [{"selector":"@s"},{"text":": "},{"text": "Equipped ","color":"white",bold:false},{"text": "$(perk_name)","color":"aqua",bold:true},{"text": " Perk","color":"white",bold:false}]
execute at @s run playsound block.note_block.chime ui @s ~ ~ ~ 1.2 0.8
execute at @s run particle happy_villager ~ ~ ~ 0.3 0.5 0.3 0 100
scoreboard players add @s perks_enabled 1
clear @s #decorated_pot_sherds