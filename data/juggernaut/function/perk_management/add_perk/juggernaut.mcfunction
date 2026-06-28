function juggernaut:perk_management/give_juggernaut_perks

# Deny equipping if perk already equipped
$execute if entity @s[tag=using_$(perk_id)] run playsound block.note_block.didgeridoo ui @s ~ ~ ~ 1.2
$execute if entity @s[tag=using_$(perk_id)] run particle angry_villager ~ ~ ~ 0.3 0.5 0.3 0 10
$execute if entity @s[tag=using_$(perk_id)] run clear @s #trim_materials
$execute if entity @s[tag=using_$(perk_id)] run tellraw @s [{"text": "Could not equip ","color":"white",bold:false},{"text": "$(perk_name)","color":"red",bold:true},{"text": " Perk.\n","color":"white",bold:false},{"text": "Reason:\n",bold:true},{"text": "You have already equipped this perk.","color":"white",bold:false}]
$execute if entity @s[tag=using_$(perk_id)] run return fail

# Deny equipping if already at max perks
execute if score @s perks_enabled >= #1 var at @s run playsound block.note_block.didgeridoo ui @s ~ ~ ~ 1.2
execute if score @s perks_enabled >= #1 var at @s run particle angry_villager ~ ~ ~ 0.3 0.5 0.3 0 10
execute if score @s perks_enabled >= #1 var at @s run clear @s #trim_materials
$execute if score @s perks_enabled >= #1 var at @s run tellraw @s [{"text": "Could not equip ","color":"white",bold:false},{"text": "$(perk_name)","color":"red",bold:true},{"text": " Perk.\n","color":"white",bold:false},{"text": "Reason:\n","color":"red",bold:true},{"text": "You have already equipped the maximum amount of perks.","color":"white",bold:false}]
execute if score @s perks_enabled >= #1 var run return fail

# Successfully equip perk
$tag @s add using_$(perk_id)
$tellraw @a[tag=juggernaut] [{"selector":"@s"},{"text":": "},{"text": "Equipped ","color":"white",bold:false},{"text":"$(perk_name)","color":"red",bold:true},{"text": " Perk","color":"white",bold:false}]
execute at @s run playsound block.note_block.chime ui @s ~ ~ ~ 1.2 0.8
execute at @s run particle happy_villager ~ ~ ~ 0.3 0.5 0.3 0 100
scoreboard players add @s perks_enabled 1
clear @s #trim_materials