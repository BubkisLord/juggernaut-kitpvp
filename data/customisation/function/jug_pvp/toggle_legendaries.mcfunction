scoreboard objectives add has_legendaries dummy
scoreboard players add #juggernaut_pvp_customisation has_legendaries 1
execute if score #juggernaut_pvp_customisation has_legendaries matches 2.. run scoreboard players set #juggernaut_pvp_customisation has_legendaries 0
execute if score #juggernaut_pvp_customisation has_legendaries matches 0 run setblock 2057 107 -6 waxed_copper_bulb[lit=false]
execute if score #juggernaut_pvp_customisation has_legendaries matches 1 run setblock 2057 107 -6 waxed_copper_bulb[lit=true]
execute positioned 2057 108 -6 run playsound block.note_block.pling master @a[distance=..10] ~ ~ ~ 1 1