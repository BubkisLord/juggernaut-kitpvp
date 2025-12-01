execute if entity @s[tag=!using_camera] run return fail

tag @e[type=armor_stand,tag=camera,tag=!used_camera,limit=1,sort=random] add used_camera
tag @n[type=armor_stand] remove used_camera