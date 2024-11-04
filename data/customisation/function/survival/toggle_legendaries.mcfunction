scoreboard objectives add has_legendaries dummy
scoreboard players add #survival_customisation has_legendaries 1
execute if score #survival_customisation has_legendaries matches 2.. run scoreboard players set #survival_customisation has_legendaries 0
execute if score #survival_customisation has_legendaries matches 0 run setblock 2060 107 3 waxed_oxidized_copper_bulb[lit=false]
execute if score #survival_customisation has_legendaries matches 1 run setblock 2060 107 3 waxed_oxidized_copper_bulb[lit=true]
execute positioned 2060 108 3 run playsound block.note_block.pling master @a[distance=..10] ~ ~ ~ 1 1