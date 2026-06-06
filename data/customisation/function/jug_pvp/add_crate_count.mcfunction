scoreboard objectives add crate_count dummy
scoreboard players add #jug_pvp_customisation crate_count 2
execute if score #jug_pvp_customisation crate_count matches 9.. run scoreboard players set #jug_pvp_customisation crate_count 4
fill 2053 107 -6 2055 107 -6 waxed_copper_bulb[lit=false]
execute if score #jug_pvp_customisation crate_count matches 4 run setblock 2053 107 -6 waxed_copper_bulb[lit=true]
execute if score #jug_pvp_customisation crate_count matches 6 run setblock 2054 107 -6 waxed_copper_bulb[lit=true]
execute if score #jug_pvp_customisation crate_count matches 8 run setblock 2055 107 -6 waxed_copper_bulb[lit=true]
execute positioned 2055 108 -6 run playsound block.note_block.pling master @a[distance=..10] ~ ~ ~ 1 1