tag @s add used_camera
execute as @p[tag=eclipse_stalker,tag=finding_camera] run tag @s add using_camera
execute at @p[tag=eclipse_stalker,tag=finding_camera] run summon mannequin ~ ~ ~ {Tags:["eclipse_return_location","kill_on_end_game"],NoGravity:false,Invulnerable:true,immovable:true}
execute at @p[tag=eclipse_stalker,tag=finding_camera] as @n[type=minecraft:mannequin] run data modify entity @s profile.id set from entity @p[tag=eclipse_stalker,tag=finding_camera] UUID
execute as @p[tag=eclipse_stalker,tag=finding_camera] run function juggernaut:abilities/eclipse_stalker/enter_cam_attributes
execute as @p[tag=eclipse_stalker,tag=finding_camera] run tp @s ~ ~ ~ facing ^ ^ ^1000