kill @e[type=item]
tag @s remove using_camera
tag @e[tag=used_camera] remove used_camera
tp @s @n[type=area_effect_cloud,tag=eclipse_return_location]
kill @e[type=area_effect_cloud,tag=eclipse_return_location]
function juggernaut:abilities/eclipse_stalker/reset_cam_attributes