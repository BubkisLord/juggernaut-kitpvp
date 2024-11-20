scoreboard objectives add completable_stations dummy
scoreboard players add #juggernaut_customisation completable_stations 1
execute if score #juggernaut_customisation completable_stations matches 2.. run scoreboard players set #juggernaut_customisation completable_stations 0
execute if score #juggernaut_customisation completable_stations matches 0 run setblock 2051 107 6 waxed_copper_bulb[lit=false]
execute if score #juggernaut_customisation completable_stations matches 1 run setblock 2051 107 6 waxed_copper_bulb[lit=true]
execute positioned 2051 107 6 run playsound block.note_block.pling master @a[distance=..10] ~ ~ ~ 1 1