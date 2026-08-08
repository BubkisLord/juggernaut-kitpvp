# Run as the puppetteer at the puppetteer. Conjures a ring of six identical puppets that move
# like the caster; the caster occupies one of the six slots so the juggernaut cannot tell which
# figure is real. Each puppet dies to a single hit.
scoreboard players operation #pp_link var = @s puppet_id

# Clear any pre-existing puppets/centre belonging to this owner.
execute as @e[type=mannequin,tag=puppetteer_puppet] if score @s puppet_id = #pp_link var run kill @s
execute as @e[type=marker,tag=puppet_center] if score @s puppet_id = #pp_link var run kill @s

# Anchor marker that the ring is built around (linked to this owner).
summon marker ~ ~ ~ {Tags:["puppet_center","kill_on_end_game","pp_new_center"]}
scoreboard players operation @n[type=marker,tag=pp_new_center] puppet_id = @s puppet_id
tag @n[type=marker,tag=pp_new_center] remove pp_new_center

# Spawn the six puppets. Position does not matter - the loop places them each tick. They wear the
# caster's skin. NoGravity means they never take fall damage, so 1 health is safe: any hit at all
# one-shots them, but a fall can't.
summon mannequin ~ ~ ~ {Tags:["puppetteer_puppet","puppet_s0","kill_on_end_game","pp_new_puppet"],NoGravity:1b,pose:"standing",Health:1f}
summon mannequin ~ ~ ~ {Tags:["puppetteer_puppet","puppet_s1","kill_on_end_game","pp_new_puppet"],NoGravity:1b,pose:"standing",Health:1f}
summon mannequin ~ ~ ~ {Tags:["puppetteer_puppet","puppet_s2","kill_on_end_game","pp_new_puppet"],NoGravity:1b,pose:"standing",Health:1f}
summon mannequin ~ ~ ~ {Tags:["puppetteer_puppet","puppet_s3","kill_on_end_game","pp_new_puppet"],NoGravity:1b,pose:"standing",Health:1f}
summon mannequin ~ ~ ~ {Tags:["puppetteer_puppet","puppet_s4","kill_on_end_game","pp_new_puppet"],NoGravity:1b,pose:"standing",Health:1f}
summon mannequin ~ ~ ~ {Tags:["puppetteer_puppet","puppet_s5","kill_on_end_game","pp_new_puppet"],NoGravity:1b,pose:"standing",Health:1f}

data modify storage juggernaut:puppetteer owner_uuid set from entity @s UUID
scoreboard players operation @e[type=mannequin,tag=pp_new_puppet] puppet_id = @s puppet_id
execute as @e[type=mannequin,tag=pp_new_puppet] run data modify entity @s profile.id set from storage juggernaut:puppetteer owner_uuid

# Pick which ring slot the caster fills, then remove that slot's puppet (the caster "swaps" into it).
execute store result score @s pp_slot run random value 0..5
execute if score @s pp_slot matches 0 as @e[type=mannequin,tag=pp_new_puppet,tag=puppet_s0] if score @s puppet_id = #pp_link var run kill @s
execute if score @s pp_slot matches 1 as @e[type=mannequin,tag=pp_new_puppet,tag=puppet_s1] if score @s puppet_id = #pp_link var run kill @s
execute if score @s pp_slot matches 2 as @e[type=mannequin,tag=pp_new_puppet,tag=puppet_s2] if score @s puppet_id = #pp_link var run kill @s
execute if score @s pp_slot matches 3 as @e[type=mannequin,tag=pp_new_puppet,tag=puppet_s3] if score @s puppet_id = #pp_link var run kill @s
execute if score @s pp_slot matches 4 as @e[type=mannequin,tag=pp_new_puppet,tag=puppet_s4] if score @s puppet_id = #pp_link var run kill @s
execute if score @s pp_slot matches 5 as @e[type=mannequin,tag=pp_new_puppet,tag=puppet_s5] if score @s puppet_id = #pp_link var run kill @s

tag @e[type=mannequin,tag=pp_new_puppet] remove pp_new_puppet
tag @s add has_puppets
scoreboard players set @s puppet_time 600

# Place the ring immediately so it does not flash at the caster's feet for a tick.
function juggernaut:abilities/puppetteer/move_puppets
playsound minecraft:entity.evoker.cast_spell master @a[distance=..24] ~ ~ ~ 1 1.2
