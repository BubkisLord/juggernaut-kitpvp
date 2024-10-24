effect give @s slowness 5 255 false
effect give @s resistance 5 255 false
effect give @s blindness 5 255 false
effect give @s weakness 5 255 false
effect give @s glowing 5 255 false
execute at @s run particle ash ~0 ~0.5 ~0 1 1 1 0.001 30 force
execute at @s run playsound minecraft:block.anvil.land master @a ~ ~ ~ 1 1.2
execute at @s run playsound minecraft:block.beacon.deactivate master @a ~ ~ ~ 1 0
kill @e[nbt={Item:{id:"minecraft:clock"}},distance=..3]