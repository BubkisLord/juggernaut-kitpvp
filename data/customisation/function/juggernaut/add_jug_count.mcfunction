scoreboard objectives add juggernaut_count dummy
scoreboard players add #juggernaut_customisation juggernaut_count 1
execute store result score #playercount var run list
execute if score #juggernaut_customisation juggernaut_count >= #playercount var run scoreboard players set #juggernaut_customisation juggernaut_count 1
execute if score #juggernaut_customisation juggernaut_count matches 7.. run scoreboard players set #juggernaut_customisation juggernaut_count 1
fill 1994 86 1 1994 85 -1 waxed_copper_bulb[lit=false]
execute if score #juggernaut_customisation juggernaut_count matches 1 run setblock 1994 86 1 waxed_copper_bulb[lit=true]
execute if score #juggernaut_customisation juggernaut_count matches 2 run setblock 1994 86 0 waxed_copper_bulb[lit=true]
execute if score #juggernaut_customisation juggernaut_count matches 3 run setblock 1994 86 -1 waxed_copper_bulb[lit=true]
execute if score #juggernaut_customisation juggernaut_count matches 4 run setblock 1994 85 1 waxed_copper_bulb[lit=true]
execute if score #juggernaut_customisation juggernaut_count matches 5 run setblock 1994 85 0 waxed_copper_bulb[lit=true]
execute if score #juggernaut_customisation juggernaut_count matches 6 run setblock 1994 85 -1 waxed_copper_bulb[lit=true]
execute positioned 1994 84 0 run playsound block.note_block.pling master @a[distance=..10] ~ ~ ~ 1 1