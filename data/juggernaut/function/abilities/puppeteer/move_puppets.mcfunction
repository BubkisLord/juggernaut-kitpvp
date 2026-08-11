# Run as the puppeteer at the puppeteer. Keeps this owner's ring of puppets locked in formation
# around the caster, with the caster occupying slot pp_slot so the ring looks self-contained.
scoreboard players operation #pp_link var = @s puppet_id

# Scope this owner's centre marker and puppets.
tag @e[type=marker,tag=puppet_center] remove pp_c
execute as @e[type=marker,tag=puppet_center] if score @s puppet_id = #pp_link var run tag @s add pp_c
tag @e[type=mannequin,tag=puppeteer_puppet] remove pp_owned
execute as @e[type=mannequin,tag=puppeteer_puppet] if score @s puppet_id = #pp_link var run tag @s add pp_owned
execute as @e[type=text_display,tag=puppeteer_name_tag] if score @s puppet_id = #pp_link var run tag @s add pp_owned
execute as @e[type=text_display,tag=puppeteer_health_tag] if score @s puppet_id = #pp_link var run tag @s add pp_owned

# If the centre is somehow missing, end the ability cleanly.
execute unless entity @e[type=marker,tag=pp_c] run function juggernaut:abilities/puppeteer/end_puppets
execute unless entity @e[type=marker,tag=pp_c] run return fail

# Move the centre onto the caster, then face it the same way as the caster (level, no pitch).
tp @e[type=marker,tag=pp_c] ~ ~ ~
data modify entity @n[type=mannequin,tag=pp_owned] Rotation set from entity @s Rotation
data modify entity @n[type=mannequin,tag=pp_owned] Rotation[1] set value 0f

execute at @n[type=mannequin,tag=pp_owned,tag=puppet_s0] run tp @n[type=text_display,tag=puppeteer_name_tag,  tag=puppet_s0,distance=..6] ~ ~2.35 ~
execute at @n[type=mannequin,tag=pp_owned,tag=puppet_s0] run tp @n[type=text_display,tag=puppeteer_health_tag,tag=puppet_s0,distance=..6] ~ ~2.1 ~
execute at @n[type=mannequin,tag=pp_owned,tag=puppet_s1] run tp @n[type=text_display,tag=puppeteer_name_tag,  tag=puppet_s1,distance=..6] ~ ~2.35 ~
execute at @n[type=mannequin,tag=pp_owned,tag=puppet_s1] run tp @n[type=text_display,tag=puppeteer_health_tag,tag=puppet_s1,distance=..6] ~ ~2.1 ~
execute at @n[type=mannequin,tag=pp_owned,tag=puppet_s2] run tp @n[type=text_display,tag=puppeteer_name_tag,  tag=puppet_s2,distance=..6] ~ ~2.35 ~
execute at @n[type=mannequin,tag=pp_owned,tag=puppet_s2] run tp @n[type=text_display,tag=puppeteer_health_tag,tag=puppet_s2,distance=..6] ~ ~2.1 ~
execute at @n[type=mannequin,tag=pp_owned,tag=puppet_s3] run tp @n[type=text_display,tag=puppeteer_name_tag,  tag=puppet_s3,distance=..6] ~ ~2.35 ~
execute at @n[type=mannequin,tag=pp_owned,tag=puppet_s3] run tp @n[type=text_display,tag=puppeteer_health_tag,tag=puppet_s3,distance=..6] ~ ~2.1 ~
execute at @n[type=mannequin,tag=pp_owned,tag=puppet_s4] run tp @n[type=text_display,tag=puppeteer_name_tag,  tag=puppet_s4,distance=..6] ~ ~2.35 ~
execute at @n[type=mannequin,tag=pp_owned,tag=puppet_s4] run tp @n[type=text_display,tag=puppeteer_health_tag,tag=puppet_s4,distance=..6] ~ ~2.1 ~
execute at @n[type=mannequin,tag=pp_owned,tag=puppet_s5] run tp @n[type=text_display,tag=puppeteer_name_tag,  tag=puppet_s5,distance=..6] ~ ~2.35 ~
execute at @n[type=mannequin,tag=pp_owned,tag=puppet_s5] run tp @n[type=text_display,tag=puppeteer_health_tag,tag=puppet_s5,distance=..6] ~ ~2.1 ~

function juggernaut:abilities/puppeteer/check_name_tag {puppet:"puppet_s0"}
function juggernaut:abilities/puppeteer/check_name_tag {puppet:"puppet_s1"}
function juggernaut:abilities/puppeteer/check_name_tag {puppet:"puppet_s2"}
function juggernaut:abilities/puppeteer/check_name_tag {puppet:"puppet_s3"}
function juggernaut:abilities/puppeteer/check_name_tag {puppet:"puppet_s4"}
function juggernaut:abilities/puppeteer/check_name_tag {puppet:"puppet_s5"}

tag @s add puppet_owner
execute as @e[type=text_display,tag=puppeteer_name_tag,tag=pp_owned] run data modify entity @s text set value {selector:"@p[tag=puppet_owner]","color":"dark_aqua"}
execute as @e[type=text_display,tag=puppeteer_health_tag,tag=pp_owned] run data modify entity @s text set value [{"score":{name:"@p[tag=puppet_owner]",objective:"health"},color:"white"},{"text":" Health","color": "green"}]
tag @s remove puppet_owner

# Offset the centre backwards by the caster's own ring slot, so the caster ends up on the ring.
execute if score @s pp_slot matches 0 run function juggernaut:abilities/puppeteer/move_center {nx:"-2.0",nz:"0.0"}
execute if score @s pp_slot matches 1 run function juggernaut:abilities/puppeteer/move_center {nx:"-1.0",nz:"-1.732"}
execute if score @s pp_slot matches 2 run function juggernaut:abilities/puppeteer/move_center {nx:"1.0",nz:"-1.732"}
execute if score @s pp_slot matches 3 run function juggernaut:abilities/puppeteer/move_center {nx:"2.0",nz:"0.0"}
execute if score @s pp_slot matches 4 run function juggernaut:abilities/puppeteer/move_center {nx:"1.0",nz:"1.732"}
execute if score @s pp_slot matches 5 run function juggernaut:abilities/puppeteer/move_center {nx:"-1.0",nz:"1.732"}

execute unless entity @s[predicate=is_sneaking] as @e[type=mannequin,tag=pp_owned] run data modify entity @s pose set value "standing"
execute if entity @s[predicate=is_sneaking] as @e[type=mannequin,tag=pp_owned] run data modify entity @s pose set value "crouching"
execute if entity @s[predicate=is_swimming] as @e[type=mannequin,tag=pp_owned] run data modify entity @s pose set value "swimming"

# Place each surviving puppet at its ring slot around the centre.
execute as @e[type=marker,tag=pp_c] at @s rotated as @s positioned ^2.0 ^0 ^0.0 run tp @e[type=mannequin,tag=pp_owned,tag=puppet_s0] ~ ~ ~
execute as @e[type=marker,tag=pp_c] at @s rotated as @s positioned ^1.0 ^0 ^1.732 run tp @e[type=mannequin,tag=pp_owned,tag=puppet_s1] ~ ~ ~
execute as @e[type=marker,tag=pp_c] at @s rotated as @s positioned ^-1.0 ^0 ^1.732 run tp @e[type=mannequin,tag=pp_owned,tag=puppet_s2] ~ ~ ~
execute as @e[type=marker,tag=pp_c] at @s rotated as @s positioned ^-2.0 ^0 ^0.0 run tp @e[type=mannequin,tag=pp_owned,tag=puppet_s3] ~ ~ ~
execute as @e[type=marker,tag=pp_c] at @s rotated as @s positioned ^-1.0 ^0 ^-1.732 run tp @e[type=mannequin,tag=pp_owned,tag=puppet_s4] ~ ~ ~
execute as @e[type=marker,tag=pp_c] at @s rotated as @s positioned ^1.0 ^0 ^-1.732 run tp @e[type=mannequin,tag=pp_owned,tag=puppet_s5] ~ ~ ~

effect give @e[type=mannequin,tag=pp_owned] regeneration 2 30 true

execute as @e[type=mannequin,tag=pp_owned] at @s if block ~ ~-1 ~ #juggernaut:raycast_permeable run tp @s ~ ~-1 ~
execute as @e[type=mannequin,tag=pp_owned] at @s unless block ~ ~ ~ #juggernaut:raycast_permeable run tp @s ~ ~1 ~

tag @s add pp_owner
execute store result storage juggernaut:puppeteer scale float 0.001 run attribute @s scale get 1000
execute as @e[type=mannequin,tag=pp_owned] at @s run function juggernaut:abilities/puppeteer/update_scale with storage juggernaut:puppeteer
execute as @e[type=mannequin,tag=pp_owned] at @s run data modify entity @s Rotation set from entity @p[tag=pp_owner] Rotation
tag @s remove pp_owner

# Face every puppet the same way the caster is looking.
# execute as @e[type=mannequin,tag=pp_owned] run data modify entity @s Rotation set from entity @n[type=marker,tag=pp_c] Rotation
