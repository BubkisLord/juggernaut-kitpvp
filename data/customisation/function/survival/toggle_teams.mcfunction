scoreboard objectives add teams_mode dummy
scoreboard players add #survival_customisation teams_mode 1
execute if score #survival_customisation teams_mode matches 2.. run scoreboard players set #survival_customisation teams_mode 0
execute if score #survival_customisation teams_mode matches 0 run setblock 2060 87 -9 waxed_oxidized_copper_bulb[lit=false]
execute if score #survival_customisation teams_mode matches 1 run setblock 2060 87 -9 waxed_oxidized_copper_bulb[lit=true]
execute positioned 2060 86 -9 run playsound block.note_block.pling master @a[distance=..10] ~ ~ ~ 1 1