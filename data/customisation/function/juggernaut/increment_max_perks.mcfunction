scoreboard objectives add max_perks_equipped dummy
scoreboard players add #juggernaut_customisation max_perks_equipped 1
execute if score #juggernaut_customisation max_perks_equipped matches 3.. run scoreboard players set #juggernaut_customisation max_perks_equipped 0
fill 2048 87 4 2048 87 2 waxed_copper_bulb[lit=false]
execute if score #juggernaut_customisation max_perks_equipped matches 0 run setblock 2048 87 4 waxed_copper_bulb[lit=true]
execute if score #juggernaut_customisation max_perks_equipped matches 1 run setblock 2048 87 3 waxed_copper_bulb[lit=true]
execute if score #juggernaut_customisation max_perks_equipped matches 2 run setblock 2048 87 2 waxed_copper_bulb[lit=true]
execute positioned 2048 86 3 run playsound block.note_block.pling master @a ~ ~ ~ 1 1