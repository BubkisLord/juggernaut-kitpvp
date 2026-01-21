execute unless score #game_state var matches 20..39 as @e[type=item,nbt=!{Tags:["DisplayItem"]}] at @s run data merge entity @s {PickupDelay:0}
execute unless score #game_state var matches 20..39 as @e[type=item,nbt=!{Tags:["DisplayItem"]}] at @s run data modify entity @s Owner set from entity @p UUID
execute unless score #game_state var matches 20..39 run kill @e[type=item,nbt={OnGround:1b},nbt=!{Tags:["DisplayItem"]}]
kill @e[type=arrow,nbt={inGround:1b}]
kill @e[type=spectral_arrow,nbt={inGround:1b}]
execute as @e[type=item,nbt={Item:{id:"minecraft:wheat"}}] run function other:fixfarm_wheat
execute as @e[type=item,nbt={Item:{id:"minecraft:potato"}}] run function other:fixfarm_potato
execute as @e[type=item,nbt={Item:{id:"minecraft:carrot"}}] run function other:fixfarm_carrot