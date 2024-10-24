execute as @s at @s run effect give @a[distance=0..3,tag=!auramancer] wither 1 3 false
execute as @s at @s run particle minecraft:ash ~ ~ ~ 2 2 2 0.0001 20 force
scoreboard players add @s aura_sound 1