execute at @s run setblock ~ ~-1 ~ farmland[moisture=7]
execute at @s run setblock ~ ~ ~ potatoes[age=7]
kill @e[type=item,nbt={Item:{id:"minecraft:poisonous_potato"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:potato"}}]