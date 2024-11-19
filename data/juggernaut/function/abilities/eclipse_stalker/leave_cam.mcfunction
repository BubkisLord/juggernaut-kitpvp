kill @e[type=item]
tag @s remove using_camera
tag @e[tag=used_camera] remove used_camera
execute as @e[tag=camera,distance=3..,limit=1,sort=random] run tag @s add used_camera
tag @s add using_camera
function juggernaut:stalker_leave_camera