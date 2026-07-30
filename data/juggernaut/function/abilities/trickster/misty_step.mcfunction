# execute at @p[tag=juggernaut] run spreadplayers ~ ~ 0 8 under 200 false @s[tag=in_chase]
execute if entity @s[tag=!in_chase] run scoreboard players set @s ability_cooldown0 2
execute if entity @s[tag=!in_chase] run particle angry_villager ~ ~ ~ 0.5 1 0.5 0 60 force @s
execute if entity @s[tag=!in_chase] run return fail
execute store result storage juggernaut:abilities/trickster/misty_step_rotation yaw float 1 run random value 0..359
execute as @p[tag=juggernaut,tag=in_chase] at @s run function juggernaut:abilities/trickster/misty_step_marker with storage juggernaut:abilities/trickster/misty_step_rotation
execute as @n[type=marker,tag=misty_step_marker] at @s run summon marker ^ ^ ^8 {Tags:["misty_step_dest","kill_on_end_game"]}
kill @n[type=marker,tag=misty_step_marker]
execute at @n[type=marker,tag=misty_step_dest] run spreadplayers ~ ~ 0 1 false @s
kill @n[type=marker,tag=misty_step_dest]