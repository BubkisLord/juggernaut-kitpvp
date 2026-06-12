execute unless entity @n[type=mannequin,tag=phase_shift_destination] run scoreboard players set @s jug_kit_cooldown 0
execute unless entity @n[type=mannequin,tag=phase_shift_destination] run summon mannequin ~ ~ ~ {Tags:["kill_on_end_game","phase_shift_destination"],Invulnerable:1b,pose:"standing"}
data modify entity @n[type=mannequin,tag=phase_shift_destination] profile.id set from entity @s UUID
effect give @n[type=mannequin,tag=phase_shift_destination] glowing infinite 0 true
$execute as @n[type=mannequin,tag=phase_shift_destination] run tp @s ^ ^ ^$(teleport_distance) facing ^ ^ ^9999
execute as @n[type=mannequin,tag=phase_shift_destination] at @s unless block ~ ~0.5 ~ #juggernaut:raycast_permeable run team join red @s
execute as @n[type=mannequin,tag=phase_shift_destination] at @s if block ~ ~0.5 ~ #juggernaut:raycast_permeable run team join green @s
execute if entity @s[tag=teleporting] as @n[type=mannequin,tag=phase_shift_destination] at @s if block ~ ~0.5 ~ #juggernaut:raycast_permeable run playsound entity.enderman.teleport master @a[distance=..20] ~ ~ ~ 1 0.6
execute if entity @s[tag=teleporting] as @n[type=mannequin,tag=phase_shift_destination] at @s if block ~ ~0.5 ~ #juggernaut:raycast_permeable run tp @p[tag=teleporting] @s
execute if entity @s[tag=teleporting] as @n[type=mannequin,tag=phase_shift_destination] at @s unless block ~ ~0.5 ~ #juggernaut:raycast_permeable run scoreboard players set @p[tag=teleporting] jug_kit_cooldown 0
execute if entity @s[tag=teleporting] as @n[type=mannequin,tag=phase_shift_destination] at @s if block ~ ~0.5 ~ #juggernaut:raycast_permeable run scoreboard players set @p[tag=teleporting] jug_kit_cooldown 3
execute if entity @s[tag=teleporting] run execute as @n[type=mannequin,tag=phase_shift_destination] run kill @s
execute if entity @s[tag=teleporting] run stopwatch remove minecraft:phase_time