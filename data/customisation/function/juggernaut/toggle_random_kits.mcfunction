scoreboard players add #juggernaut_customisation random_kits 1
execute if score #juggernaut_customisation random_kits matches 2.. run scoreboard players set #juggernaut_customisation random_kits 0
execute if score #juggernaut_customisation random_kits matches 0 run setblock 1994 85 -6 waxed_copper_bulb[lit=false]
execute if score #juggernaut_customisation random_kits matches 1 run setblock 1994 85 -6 waxed_copper_bulb[lit=true]
execute positioned 1994 84 -6 run playsound block.note_block.pling master @a[distance=..10] ~ ~ ~ 1 1