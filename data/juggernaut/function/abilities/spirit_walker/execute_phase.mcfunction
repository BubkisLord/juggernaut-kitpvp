execute unless entity @n[type=mannequin,tag=phase_shift_destination] run scoreboard players set @s ability_cooldown0 0
function juggernaut:abilities/spirit_walker/summon_mannequin with entity @s
effect give @n[type=mannequin,tag=phase_shift_destination] glowing infinite 0 true
$execute as @n[type=mannequin,tag=phase_shift_destination] run tp @s ^ ^ ^$(teleport_distance) facing ^ ^ ^9999
execute as @n[type=mannequin,tag=phase_shift_destination] at @s unless block ~ ~0.01 ~ #juggernaut:raycast_permeable run team join red @s
execute as @n[type=mannequin,tag=phase_shift_destination] at @s if block ~ ~0.01 ~ #juggernaut:raycast_permeable run team join green @s
execute if entity @s[tag=teleporting] as @n[type=mannequin,tag=phase_shift_destination] at @s if block ~ ~0.01 ~ #juggernaut:raycast_permeable run playsound entity.enderman.teleport master @a ~ ~ ~ 1 0.6
execute if entity @s[tag=teleporting] as @n[type=mannequin,tag=phase_shift_destination] at @s if block ~ ~0.01 ~ #juggernaut:raycast_permeable run tp @p[tag=teleporting] @s
execute if entity @s[tag=teleporting] as @n[type=mannequin,tag=phase_shift_destination] at @s unless block ~ ~0.01 ~ #juggernaut:raycast_permeable run scoreboard players set @p[tag=teleporting] ability_cooldown0 0
execute if entity @s[tag=teleporting] as @n[type=mannequin,tag=phase_shift_destination] at @s if block ~ ~0.01 ~ #juggernaut:raycast_permeable run scoreboard players set @p[tag=teleporting] ability_cooldown0 6000
execute if entity @s[tag=teleporting] run execute as @n[type=mannequin,tag=phase_shift_destination] run kill @s
execute if entity @s[tag=teleporting] run stopwatch remove minecraft:phase_time