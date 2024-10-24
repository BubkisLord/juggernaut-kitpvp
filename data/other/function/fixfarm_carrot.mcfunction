execute at @s run setblock ~ ~-1 ~ farmland[moisture=7]
execute at @s run setblock ~ ~ ~ carrots[age=7]
kill @e[type=item,nbt={Item:{id:"minecraft:carrot"}}]