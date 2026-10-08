scoreboard objectives add max_perks_equipped dummy
scoreboard players add #juggernaut_customisation max_perks_equipped 1
scoreboard players operation @a max_perks_equipped = #juggernaut_customisation max_perks_equipped
execute if score #juggernaut_customisation max_perks_equipped matches 3.. run scoreboard players set #juggernaut_customisation max_perks_equipped 0
fill 1994 85 7 1994 85 5 waxed_copper_bulb[lit=false]
execute if score #juggernaut_customisation max_perks_equipped matches 0 run setblock 1994 85 7 waxed_copper_bulb[lit=true]
execute if score #juggernaut_customisation max_perks_equipped matches 1 run setblock 1994 85 6 waxed_copper_bulb[lit=true]
execute if score #juggernaut_customisation max_perks_equipped matches 2 run setblock 1994 85 5 waxed_copper_bulb[lit=true]
execute positioned 1994 84 6 run playsound block.note_block.pling master @a ~ ~ ~ 1 1