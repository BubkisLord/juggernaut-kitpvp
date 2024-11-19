execute if entity @s[tag=!using_camera] run return fail

kill @n[type=armor_stand,tag=used_camera]
function juggernaut:abilities/eclipse_stalker/leave_cam