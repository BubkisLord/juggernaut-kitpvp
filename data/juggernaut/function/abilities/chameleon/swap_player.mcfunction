execute unless entity @a[tag=saved_skin] run tag @r[tag=runner] add saved_skin
execute as @p[tag=saved_skin] at @s run effect give @s minecraft:resistance 20 255 true
execute as @p[tag=saved_skin] at @s run summon armor_stand ~ ~ ~ {Tags:["swap_target", "kill_on_end_game"],Invisible:1b,Invulnerable:1b,Marker:1b,NoGravity:1b}
execute as @p[tag=chameleon] at @s run summon armor_stand ~ ~ ~ {Tags:["swap_origin", "kill_on_end_game"],Invisible:1b,Invulnerable:1b,Marker:1b,NoGravity:1b}
execute as @p[tag=saved_skin] run tp @s @n[type=armor_stand,tag=swap_origin]
execute as @p[tag=chameleon] run tp @s @n[type=armor_stand,tag=swap_target]
execute as @e[tag=chameleon_mannequin] run tp @s @n[type=armor_stand,tag=swap_target]
execute as @e[tag=chameleon_health_tag] run tp @s @n[type=armor_stand,tag=swap_target]
execute as @e[tag=chameleon_name_tag] run tp @s @n[type=armor_stand,tag=swap_target]
kill @e[type=armor_stand,tag=swap_origin]
kill @e[type=armor_stand,tag=swap_target]