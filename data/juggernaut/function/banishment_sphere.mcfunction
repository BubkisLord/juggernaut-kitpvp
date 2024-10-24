function juggernaut:banishment_circle
tp @s ~ ~ ~ ~ ~-9
execute unless entity @s[x_rotation=90] at @s run function juggernaut:banishment_sphere