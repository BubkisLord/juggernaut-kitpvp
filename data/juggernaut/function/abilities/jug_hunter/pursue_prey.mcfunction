execute unless entity @a[tag=has_hunters_mark] run particle angry_villager ~ ~0.5 ~ 1 1 1 0 80 force
execute unless entity @a[tag=has_hunters_mark] run scoreboard players set @s jug_kit_cooldown_2 4
execute unless entity @a[tag=has_hunters_mark] run return fail
execute as @a[tag=has_hunters_mark,limit=1,sort=furthest] at @s run summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,NoGravity:true,CustomNameVisible:false,Tags:[hunter_remnant]}
execute as @e[type=armor_stand,tag=hunter_remnant] at @s run particle flame ~ ~1 ~ 1 0.5 1 0 8 force @a
execute as @e[type=armor_stand,tag=hunter_remnant] run scoreboard players set @s var 3
tag @s add is_hunting