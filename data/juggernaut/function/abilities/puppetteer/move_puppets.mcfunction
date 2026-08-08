# Run as the puppeteer at the puppeteer. Keeps this owner's ring of puppets locked in formation
# around the caster, with the caster occupying slot pp_slot so the ring looks self-contained.
scoreboard players operation #pp_link var = @s puppet_id

# Scope this owner's centre marker and puppets.
tag @e[type=marker,tag=puppet_center] remove pp_c
execute as @e[type=marker,tag=puppet_center] if score @s puppet_id = #pp_link var run tag @s add pp_c
tag @e[type=mannequin,tag=puppeteer_puppet] remove pp_owned
execute as @e[type=mannequin,tag=puppeteer_puppet] if score @s puppet_id = #pp_link var run tag @s add pp_owned

# If the centre is somehow missing, end the ability cleanly.
execute unless entity @e[type=marker,tag=pp_c] run function juggernaut:abilities/puppeteer/end_puppets
execute unless entity @e[type=marker,tag=pp_c] run return fail

# Move the centre onto the caster, then face it the same way as the caster (level, no pitch).
tp @e[type=marker,tag=pp_c] ~ ~ ~
data modify entity @n[type=marker,tag=pp_c] Rotation set from entity @s Rotation
data modify entity @n[type=marker,tag=pp_c] Rotation[1] set value 0f

# Offset the centre backwards by the caster's own ring slot, so the caster ends up on the ring.
execute if score @s pp_slot matches 0 run function juggernaut:abilities/puppeteer/move_center {nx:"-2.0",nz:"0.0"}
execute if score @s pp_slot matches 1 run function juggernaut:abilities/puppeteer/move_center {nx:"-1.0",nz:"-1.732"}
execute if score @s pp_slot matches 2 run function juggernaut:abilities/puppeteer/move_center {nx:"1.0",nz:"-1.732"}
execute if score @s pp_slot matches 3 run function juggernaut:abilities/puppeteer/move_center {nx:"2.0",nz:"0.0"}
execute if score @s pp_slot matches 4 run function juggernaut:abilities/puppeteer/move_center {nx:"1.0",nz:"1.732"}
execute if score @s pp_slot matches 5 run function juggernaut:abilities/puppeteer/move_center {nx:"-1.0",nz:"1.732"}

# Place each surviving puppet at its ring slot around the centre.
execute as @e[type=marker,tag=pp_c] at @s rotated as @s positioned ^2.0 ^0 ^0.0 run tp @e[type=mannequin,tag=pp_owned,tag=puppet_s0] ~ ~ ~
execute as @e[type=marker,tag=pp_c] at @s rotated as @s positioned ^1.0 ^0 ^1.732 run tp @e[type=mannequin,tag=pp_owned,tag=puppet_s1] ~ ~ ~
execute as @e[type=marker,tag=pp_c] at @s rotated as @s positioned ^-1.0 ^0 ^1.732 run tp @e[type=mannequin,tag=pp_owned,tag=puppet_s2] ~ ~ ~
execute as @e[type=marker,tag=pp_c] at @s rotated as @s positioned ^-2.0 ^0 ^0.0 run tp @e[type=mannequin,tag=pp_owned,tag=puppet_s3] ~ ~ ~
execute as @e[type=marker,tag=pp_c] at @s rotated as @s positioned ^-1.0 ^0 ^-1.732 run tp @e[type=mannequin,tag=pp_owned,tag=puppet_s4] ~ ~ ~
execute as @e[type=marker,tag=pp_c] at @s rotated as @s positioned ^1.0 ^0 ^-1.732 run tp @e[type=mannequin,tag=pp_owned,tag=puppet_s5] ~ ~ ~

# Face every puppet the same way the caster is looking.
execute as @e[type=mannequin,tag=pp_owned] run data modify entity @s Rotation set from entity @n[type=marker,tag=pp_c] Rotation
