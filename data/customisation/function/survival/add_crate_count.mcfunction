scoreboard objectives add crate_count dummy
scoreboard players add #survival_customisation crate_count 2
execute if score #survival_customisation crate_count matches 9.. run scoreboard players set #survival_customisation crate_count 4
fill 2060 107 1 2060 107 -1 waxed_oxidized_copper_bulb[lit=false]
execute if score #survival_customisation crate_count matches 4 run setblock 2060 107 -1 waxed_oxidized_copper_bulb[lit=true]
execute if score #survival_customisation crate_count matches 6 run setblock 2060 107 0 waxed_oxidized_copper_bulb[lit=true]
execute if score #survival_customisation crate_count matches 8 run setblock 2060 107 1 waxed_oxidized_copper_bulb[lit=true]
execute positioned 2060 108 0 run playsound block.note_block.pling master @a[distance=..10] ~ ~ ~ 1 1