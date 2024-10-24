tp @s @r[tag=!ambusher,tag=!lobby.player,tag=!tutorial.player]
execute at @s run particle campfire_cosy_smoke ~ ~-0.3 ~ 1 1 1 0.1 200 force
execute at @s run playsound minecraft:block.ender_chest.open master @a ~ ~ ~ 1.2 0
execute at @s run playsound minecraft:entity.minecart.riding master @a ~ ~ ~ 0.3 0
execute at @s run effect give @a[distance=0..2,tag=!ambusher] slowness 3 1 false
execute at @s run effect give @a[distance=0..2,tag=!ambusher] weakness 1 0 false
execute at @s run effect give @a[distance=0..2,tag=!ambusher] blindness 2 0 false