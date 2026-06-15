kill @e[type=wolf,tag=hunter_wolf]
execute unless entity @a[tag=has_hunters_mark] run tag @r[tag=runner,tag=!has_respawn_time] add hunted
execute if entity @a[tag=has_hunters_mark,tag=!has_respawn_time] as @p[tag=has_hunters_mark,tag=!has_respawn_time] run tag @s add hunted
execute unless entity @a[tag=hunted] as @a[tag=hunter] at @s run particle angry_villager ~ ~0.5 ~ 1 1 1 0 80 force
execute unless entity @a[tag=hunted] run scoreboard players set @s ability_cooldown1 4
execute unless entity @a[tag=hunted] run return fail
execute as @p[tag=hunted] at @s run playsound entity.wolf_big.growl master @a[tag=hunted] ~ ~ ~ 1 1 0.5
execute as @a[tag=hunter] at @s run playsound entity.wolf_big.ambient master @a[tag=hunter] ~ ~ ~ 1 1 0.5
summon minecraft:wolf ~ ~ ~ {CustomName:{"text":"Bloodhound","color":"dark_red","italic":false},CustomNameVisible:true,attributes:[{id:"max_health",base:45},{id:"movement_speed",base:0.5},{id:"follow_range",base:999},{id:"attack_damage",base:1},{id:"scale",base:1.5}],PersistenceRequired:1b,Tags:["hunter_wolf","kill_on_end_game"],Team:"jug"}
execute as @n[type=minecraft:wolf,tag=hunter_wolf] run data modify entity @s anger_end_time set value 9223372036854775807L
execute as @n[type=minecraft:wolf,tag=hunter_wolf] run data modify entity @s angry_at set from entity @p[tag=hunted] UUID
attribute @n[type=minecraft:wolf,tag=hunter_wolf] max_health base set 45
attribute @n[type=minecraft:wolf,tag=hunter_wolf] water_movement_efficiency base set 45
effect give @n[type=minecraft:wolf,tag=hunter_wolf] instant_health 1 252 true
