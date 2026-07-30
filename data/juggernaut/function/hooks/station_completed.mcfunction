execute if entity @a[tag=using_floods_of_rage,tag=!in_chase] as @a[tag=runner,tag=!undetectable] run effect give @s glowing 8 0 true
data modify entity @s CustomNameVisible set value 0b

tag @s add station_completed
tag @s remove haunted_station
execute as @a[tag=runner] at @s run particle firework ~ ~ ~ 3 3 3 0 200 force @a[tag=runner]
execute as @a[tag=runner] at @s run particle firework ~ ~ ~ 0 100 0 0 300 force @a[tag=juggernaut]
execute as @a[tag=runner] at @s run playsound block.end_portal_frame.fill master @s ~ ~ ~ 3 0.4
execute as @a[tag=juggernaut] at @s run playsound entity.ender_dragon.growl master @s ~ ~ ~ 3 0.4
tag @s remove highest_station
tag @s add replenishment.station_deactivated
tag @s remove replenishment.station