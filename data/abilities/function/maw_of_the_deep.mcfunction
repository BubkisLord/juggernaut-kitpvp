particle minecraft:cherry_leaves ~ ~1 ~ 1.3 1 1.3 0.05 200 force
particle minecraft:campfire_cosy_smoke ~ ~1 ~ 0.5 0.7 0.5 0.005 200 force
particle minecraft:campfire_cosy_smoke ~ ~1 ~ 0.5 0.7 0.5 0.05 200 force
tp @s -47.5 59 54.5

# Plays a ding then the ultra rare addition for underwater music. Playing multiple times enhances loudness so it can be heard at all.
playsound block.note_block.bell master @s ~ ~ ~ 3 0.2
playsound block.note_block.bell master @s ~ ~ ~ 3 1.5
playsound ambient.underwater.loop.additions.ultra_rare master @s ~ ~ ~ 3 1 1
playsound ambient.underwater.loop.additions.ultra_rare master @s ~ ~ ~ 3 1 1
playsound ambient.underwater.loop.additions.ultra_rare master @s ~ ~ ~ 3 1 1
playsound ambient.underwater.loop.additions.ultra_rare master @s ~ ~ ~ 3 1 1
playsound ambient.underwater.loop.additions.ultra_rare master @s ~ ~ ~ 3 1 1
playsound ambient.underwater.loop.additions.ultra_rare master @s ~ ~ ~ 3 1 1

execute as @a[tag=pirate] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:iron_sword"}},distance=..3]
give @s iron_sword[item_name={"text":"Maw of the Deep","color":"dark_aqua","italic":false,"bold":false},lore=[{"text":"A great weapon with all power lost to the sea...","color":"dark_gray"}],unbreakable={},enchantments={sharpness:4}]