scoreboard objectives add crate_count dummy
scoreboard players add #survival_customisation crate_count 2
execute if score #survival_customisation crate_count matches 11.. run scoreboard players set #survival_customisation crate_count 0
fill 2006 86 -1 2006 85 1 waxed_oxidized_copper_bulb[lit=false]
execute if score #survival_customisation crate_count matches 0 run setblock 2006 86 -1 waxed_oxidized_copper_bulb[lit=true]
execute if score #survival_customisation crate_count matches 2 run setblock 2006 86 0 waxed_oxidized_copper_bulb[lit=true]
execute if score #survival_customisation crate_count matches 4 run setblock 2006 86 1 waxed_oxidized_copper_bulb[lit=true]
execute if score #survival_customisation crate_count matches 6 run setblock 2006 85 -1 waxed_oxidized_copper_bulb[lit=true]
execute if score #survival_customisation crate_count matches 8 run setblock 2006 85 0 waxed_oxidized_copper_bulb[lit=true]
execute if score #survival_customisation crate_count matches 10 run setblock 2006 85 1 waxed_oxidized_copper_bulb[lit=true]
execute positioned 2006 84 0 run playsound block.note_block.pling master @a[distance=..10] ~ ~ ~ 1 1