execute if entity @s[tag=shadow_marked] run kill @e[type=armor_stand,tag=eclipse_return_location]
execute if entity @s[tag=shadow_marked] run tag @p[tag=eclipse_stalker] remove using_camera
execute if entity @s[tag=shadow_marked] run tag @n[tag=used_camera] remove used_camera
execute if entity @s[tag=shadow_marked] as @p[tag=eclipse_stalker] at @s run function juggernaut:abilities/eclipse_stalker/reset_cam_attributes
execute if entity @s[tag=shadow_marked] run kill @n[tag=eclipse_return_location]
execute if entity @s[tag=shadow_marked] run tag @s remove shadow_marked
execute if entity @s[tag=shadow_marked] run tp @p[tag=eclipse_stalker] ^ ^1 ^1 facing ^ ^ ^1000
execute unless entity @s[tag=shadow_marked] run tellraw @p[tag=eclipse_stalker] [{"text": "Target must be shadow marked.","italic": true,"color": "gray"}]