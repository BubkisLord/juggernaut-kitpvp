tag @s remove in_descent
particle explosion ~ ~ ~ 12 12 12 0 1728 force @a
particle small_flame ~ ~ ~ 12 12 12 0 1728 force @a
playsound entity.generic.explode master @a ~ ~ ~ 1 1
execute as @a[tag=runner,distance=..12] run damage @s 10 in_fire by @s