scoreboard players add #juggernaut_customisation random_perks 1
execute if score #juggernaut_customisation random_perks matches 2.. run scoreboard players set #juggernaut_customisation random_perks 0
execute if score #juggernaut_customisation random_perks matches 0 run setblock 1994 85 -5 waxed_copper_bulb[lit=false]
execute if score #juggernaut_customisation random_perks matches 1 run setblock 1994 85 -5 waxed_copper_bulb[lit=true]
execute positioned 1994 84 -5 run playsound block.note_block.pling master @a[distance=..10] ~ ~ ~ 1 1