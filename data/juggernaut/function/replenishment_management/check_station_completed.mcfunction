tag @s add station_completed
function juggernaut:hooks/station_completed
execute if entity @a[tag=using_shared_resolve,distance=..3] as @a[tag=runner,distance=..3] run function juggernaut:effects/apply_effect {effect:"undetectable",duration:20,color:"gray"}
execute if entity @a[tag=using_shared_resolve,distance=..3] as @a[tag=runner,distance=..3] run effect give @s resistance 4 1 true
execute if entity @a[tag=using_shared_resolve,distance=..3] as @a[tag=runner,distance=..3] run effect give @s speed 4 1 true
execute as @a[tag=runner] at @s run particle firework ~ ~ ~ 3 3 3 0 200 force @a[tag=runner]
execute as @a[tag=runner] at @s run particle firework ~ ~ ~ 0 100 0 0 300 force @a[tag=juggernaut]
execute as @a[tag=runner] at @s run playsound block.end_portal_frame.fill master @s ~ ~ ~ 3 0.4
execute as @a[tag=juggernaut] at @s run playsound entity.ender_dragon.growl master @s ~ ~ ~ 3 0.4
tag @s add replenishment.station_deactivated
tag @s remove replenishment.station