scoreboard objectives add round_robin dummy
scoreboard players add #juggernaut_customisation round_robin 1
execute if score #juggernaut_customisation round_robin matches 2.. run scoreboard players set #juggernaut_customisation round_robin 0
execute if score #juggernaut_customisation round_robin matches 0 run setblock 2048 87 -10 waxed_copper_bulb[lit=false]
execute if score #juggernaut_customisation round_robin matches 1 run setblock 2048 87 -10 waxed_copper_bulb[lit=true]
execute positioned 2048 86 -10 run playsound block.note_block.pling master @a ~ ~ ~ 1 1