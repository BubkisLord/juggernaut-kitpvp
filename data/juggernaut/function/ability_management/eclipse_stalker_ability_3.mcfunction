execute if entity @s[tag=!using_camera] run return fail

tag @s remove using_camera
tag @n[type=armor_stand] remove used_camera
function juggernaut:stalker_leave_camera
tp @s @n[type=area_effect_cloud,tag=eclipse_return_location]
kill @e[type=area_effect_cloud,tag=eclipse_return_location]