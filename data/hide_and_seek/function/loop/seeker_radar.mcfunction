tp @n[type=armor_stand,tag=seeker_radar] ~ ~ ~ facing entity @s
execute as @n[type=armor_stand,tag=seeker_radar] at @s run particle dust{color:[1,0,0],scale:1} ^ ^ ^3 0 0 0 0 3 force @a[tag=seeker]
execute as @n[type=armor_stand,tag=seeker_radar] at @s run particle dust{color:[1,0.5,0],scale:1} ^ ^ ^3 0 0 0 0 3 force @a[tag=seeker]
execute as @n[type=armor_stand,tag=seeker_radar] at @s run particle dust{color:[1,1,0],scale:1} ^ ^ ^3 0 0 0 0 3 force @a[tag=seeker]
execute as @n[type=armor_stand,tag=seeker_radar] at @s run particle dust{color:[0,1,0],scale:1} ^ ^ ^3 0 0 0 0 3 force @a[tag=seeker]
execute as @n[type=armor_stand,tag=seeker_radar] at @s run particle dust{color:[0,0,1],scale:1} ^ ^ ^3 0 0 0 0 3 force @a[tag=seeker]
execute as @n[type=armor_stand,tag=seeker_radar] at @s run particle dust{color:[0.5,0,1],scale:1} ^ ^ ^3 0 0 0 0 3 force @a[tag=seeker]