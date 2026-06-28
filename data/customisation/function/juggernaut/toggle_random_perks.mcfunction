scoreboard objectives add random_perks dummy
scoreboard players add #juggernaut_customisation random_perks 1
execute if score #juggernaut_customisation random_perks matches 2.. run scoreboard players set #juggernaut_customisation random_perks 0
execute if score #juggernaut_customisation random_perks matches 0 run setblock 2048 87 -8 waxed_copper_bulb[lit=false]
execute if score #juggernaut_customisation random_perks matches 1 run setblock 2048 87 -8 waxed_copper_bulb[lit=true]
execute positioned 2048 86 -8 run playsound block.note_block.pling master @a[distance=..10] ~ ~ ~ 1 1