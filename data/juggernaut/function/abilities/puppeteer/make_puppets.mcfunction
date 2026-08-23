# Run as the puppeteer at the puppeteer. Conjures a ring of six identical puppets that move
# like the caster; the caster occupies one of the six slots so the juggernaut cannot tell which
# figure is real. Each puppet dies to a single hit.
scoreboard players operation #pp_link var = @s puppet_id

# Clear any pre-existing puppets/centre belonging to this owner.
execute as @e[type=mannequin,tag=puppeteer_puppet] if score @s puppet_id = #pp_link var run kill @s
execute as @e[type=marker,tag=puppet_center] if score @s puppet_id = #pp_link var run kill @s

summon marker ~ ~ ~ {Tags:["puppet_center","kill_on_end_game","pp_new_center"]}
scoreboard players operation @n[type=marker,tag=pp_new_center] puppet_id = @s puppet_id
data modify entity @n[type=marker,tag=pp_new_center] Rotation set from entity @s Rotation
data modify entity @n[type=marker,tag=pp_new_center] Rotation[1] set value 0
tag @n[type=marker,tag=pp_new_center] remove pp_new_center

summon mannequin ~ ~ ~ {Tags:["puppeteer_puppet","puppet_s0","kill_on_end_game","pp_new_puppet"],pose:"standing",Health:2f,attributes:[{id:"max_health",base:2}]}
summon mannequin ~ ~ ~ {Tags:["puppeteer_puppet","puppet_s1","kill_on_end_game","pp_new_puppet"],pose:"standing",Health:2f,attributes:[{id:"max_health",base:2}]}
summon mannequin ~ ~ ~ {Tags:["puppeteer_puppet","puppet_s2","kill_on_end_game","pp_new_puppet"],pose:"standing",Health:2f,attributes:[{id:"max_health",base:2}]}
summon mannequin ~ ~ ~ {Tags:["puppeteer_puppet","puppet_s3","kill_on_end_game","pp_new_puppet"],pose:"standing",Health:2f,attributes:[{id:"max_health",base:2}]}
summon mannequin ~ ~ ~ {Tags:["puppeteer_puppet","puppet_s4","kill_on_end_game","pp_new_puppet"],pose:"standing",Health:2f,attributes:[{id:"max_health",base:2}]}
summon mannequin ~ ~ ~ {Tags:["puppeteer_puppet","puppet_s5","kill_on_end_game","pp_new_puppet"],pose:"standing",Health:2f,attributes:[{id:"max_health",base:2}]}

data modify storage juggernaut:puppeteer owner_uuid set from entity @s UUID
scoreboard players operation @e[type=mannequin,tag=pp_new_puppet] puppet_id = @s puppet_id
scoreboard players operation @e[type=text_display,tag=pp_new_puppet] puppet_id = @s puppet_id
execute as @e[type=mannequin,tag=pp_new_puppet] run data modify entity @s profile.id set from storage juggernaut:puppeteer owner_uuid

attribute @s step_height modifier add juggernaut:puppet_owner 0.4 add_value

# Pick which ring slot the caster fills, physically move the caster into it, then remove that puppet.
execute store result score @s pp_slot run random value 0..5

tag @s add pp_owner
execute as @n[type=marker,tag=puppet_center] at @s if score @p[tag=pp_owner] pp_slot matches 0 run tp @p[tag=pp_owner] ^2.0 ^0 ^0.0
execute as @n[type=marker,tag=puppet_center] at @s if score @p[tag=pp_owner] pp_slot matches 1 run tp @p[tag=pp_owner] ^1.0 ^0 ^1.732
execute as @n[type=marker,tag=puppet_center] at @s if score @p[tag=pp_owner] pp_slot matches 2 run tp @p[tag=pp_owner] ^-1.0 ^0 ^1.732
execute as @n[type=marker,tag=puppet_center] at @s if score @p[tag=pp_owner] pp_slot matches 3 run tp @p[tag=pp_owner] ^-2.0 ^0 ^0.0
execute as @n[type=marker,tag=puppet_center] at @s if score @p[tag=pp_owner] pp_slot matches 4 run tp @p[tag=pp_owner] ^-1.0 ^0 ^-1.732
execute as @n[type=marker,tag=puppet_center] at @s if score @p[tag=pp_owner] pp_slot matches 5 run tp @p[tag=pp_owner] ^1.0 ^0 ^-1.732
tag @s remove pp_owner

execute if score @s pp_slot matches 0 as @e[tag=pp_new_puppet,tag=puppet_s0] if score @s puppet_id = #pp_link var run kill @s
execute if score @s pp_slot matches 1 as @e[tag=pp_new_puppet,tag=puppet_s1] if score @s puppet_id = #pp_link var run kill @s
execute if score @s pp_slot matches 2 as @e[tag=pp_new_puppet,tag=puppet_s2] if score @s puppet_id = #pp_link var run kill @s
execute if score @s pp_slot matches 3 as @e[tag=pp_new_puppet,tag=puppet_s3] if score @s puppet_id = #pp_link var run kill @s
execute if score @s pp_slot matches 4 as @e[tag=pp_new_puppet,tag=puppet_s4] if score @s puppet_id = #pp_link var run kill @s
execute if score @s pp_slot matches 5 as @e[tag=pp_new_puppet,tag=puppet_s5] if score @s puppet_id = #pp_link var run kill @s

tag @e[tag=pp_new_puppet] remove pp_new_puppet
tag @s add has_puppets
scoreboard players set @s puppet_time 600

# Place the ring immediately so it does not flash at the caster's feet for a tick.
function juggernaut:abilities/puppeteer/move_puppets
playsound minecraft:entity.evoker.cast_spell master @a[distance=..24] ~ ~ ~ 1 1.2
