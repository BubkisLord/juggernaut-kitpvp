scoreboard objectives add crate_count dummy
scoreboard players add #survival_customisation crate_count 2
execute if score #survival_customisation crate_count matches 11.. run scoreboard players set #survival_customisation crate_count 0
fill 2060 88 -4 2060 87 -2 waxed_oxidized_copper_bulb[lit=false]
execute if score #survival_customisation crate_count matches 0 run setblock 2060 88 -4 waxed_oxidized_copper_bulb[lit=true]
execute if score #survival_customisation crate_count matches 2 run setblock 2060 88 -3 waxed_oxidized_copper_bulb[lit=true]
execute if score #survival_customisation crate_count matches 4 run setblock 2060 88 -2 waxed_oxidized_copper_bulb[lit=true]
execute if score #survival_customisation crate_count matches 6 run setblock 2060 87 -4 waxed_oxidized_copper_bulb[lit=true]
execute if score #survival_customisation crate_count matches 8 run setblock 2060 87 -3 waxed_oxidized_copper_bulb[lit=true]
execute if score #survival_customisation crate_count matches 10 run setblock 2060 87 -2 waxed_oxidized_copper_bulb[lit=true]
execute positioned 2060 86 -3 run playsound block.note_block.pling master @a[distance=..10] ~ ~ ~ 1 1