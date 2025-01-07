
# Hunter
# Ambush Ability
execute as @a[tag=jug_hunter,tag=is_hunting] at @s run particle witch ~ ~0.5 ~ 1 1 1 0.00001 3 force

execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run tp @r[tag=jug_hunter,tag=is_hunting] @s

execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run tag @a[tag=jug_hunter,tag=is_hunting] remove is_hunting
execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run tag @a[tag=has_hunters_mark] remove has_hunters_mark
execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run execute as @a[tag=jug_hunter,tag=is_hunting] at @s run particle campfire_cosy_smoke ~ ~0.5 ~ 1 1 1 0.00001 100 force
execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run execute as @a[tag=jug_hunter,tag=is_hunting] at @s run playsound entity.enderman.teleport master @a[distance=..20] ~ ~ ~
execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var = #0 var run kill @s

execute as @a[tag=has_hunters_mark,tag=!has_respawn_time,tag=!is_undetectable] at @s run particle minecraft:trial_spawner_detection ~ ~-0.5 ~ 1 1.5 1 0 4 force @a[tag=jug_hunter]