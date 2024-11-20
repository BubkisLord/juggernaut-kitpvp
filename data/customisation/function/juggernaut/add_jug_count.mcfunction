scoreboard objectives add juggernaut_count dummy
scoreboard players add #juggernaut_customisation juggernaut_count 1
execute if score #juggernaut_customisation juggernaut_count matches 3.. run scoreboard players set #juggernaut_customisation juggernaut_count 0
fill 2055 107 6 2053 107 6 waxed_copper_bulb[lit=false]
execute if score #juggernaut_customisation juggernaut_count matches 0 run setblock 2055 107 6 waxed_copper_bulb[lit=true]
execute if score #juggernaut_customisation juggernaut_count matches 1 run setblock 2054 107 6 waxed_copper_bulb[lit=true]
execute if score #juggernaut_customisation juggernaut_count matches 2 run setblock 2053 107 6 waxed_copper_bulb[lit=true]
execute positioned 2054 108 6 run playsound block.note_block.pling master @a[distance=..10] ~ ~ ~ 1 1