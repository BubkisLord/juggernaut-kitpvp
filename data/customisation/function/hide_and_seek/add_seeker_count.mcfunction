scoreboard objectives add seeker_count dummy
scoreboard players add #hide_and_seek_customisation seeker_count 1
execute if score #hide_and_seek_customisation seeker_count matches 4.. run scoreboard players set #hide_and_seek_customisation seeker_count 1
fill 2053 107 -6 2055 107 -6 waxed_exposed_copper_bulb[lit=false]
execute if score #hide_and_seek_customisation seeker_count matches 1 run setblock 2053 107 -6 waxed_exposed_copper_bulb[lit=true]
execute if score #hide_and_seek_customisation seeker_count matches 2 run setblock 2054 107 -6 waxed_exposed_copper_bulb[lit=true]
execute if score #hide_and_seek_customisation seeker_count matches 3 run setblock 2055 107 -6 waxed_exposed_copper_bulb[lit=true]
execute positioned 2052 107 -6 run playsound block.note_block.pling master @a[distance=..10] ~ ~ ~ 1 1