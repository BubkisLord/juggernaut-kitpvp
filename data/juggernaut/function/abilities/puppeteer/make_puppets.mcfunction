# Run as the puppeteer at the puppeteer. Scatters a crowd of identical puppets outward from the
# caster's own feet: every puppet spawns inside the caster's hitbox and immediately runs off along
# its own heading, while the caster is flung out along a random heading of their own. Because every
# figure - puppets and caster alike - erupts from the same point on the same tick, there is no swap
# for the juggernaut to watch and no way to tell which runner is the real one.
scoreboard players operation #pp_link var = @s puppet_id

# Clear any pre-existing puppets belonging to this owner.
execute as @e[type=mannequin,tag=puppeteer_puppet] if score @s puppet_id = #pp_link var run kill @s

# Resolve the configured puppet count, clamped to a range the heading maths can actually space out.
scoreboard players set #pp_count var 8
execute if score #puppeteer_config puppet_count matches 1.. run scoreboard players operation #pp_count var = #puppeteer_config puppet_count
execute if score #pp_count var matches ..1 run scoreboard players set #pp_count var 2
execute if score #pp_count var matches 25.. run scoreboard players set #pp_count var 24

# Space the headings evenly around the full circle, starting from the caster's own facing.
scoreboard players set #pp_step var 360
scoreboard players operation #pp_step var /= #pp_count var
execute store result score #pp_yaw var run data get entity @s Rotation[0]

# Captured once here so every puppet can be given the caster's skin and body size as it spawns.
data modify storage juggernaut:puppeteer owner_uuid set from entity @s UUID
execute store result storage juggernaut:puppeteer scale float 0.001 run attribute @s scale get 1000

scoreboard players set #pp_i var 0
function juggernaut:abilities/puppeteer/spawn_puppet_loop

# Link, skin and size every puppet that was just created to this owner.
scoreboard players operation @e[type=mannequin,tag=pp_new_puppet] puppet_id = @s puppet_id
execute as @e[type=mannequin,tag=pp_new_puppet] run data modify entity @s profile.id set from storage juggernaut:puppeteer owner_uuid
execute as @e[type=mannequin,tag=pp_new_puppet] run function juggernaut:abilities/puppeteer/update_scale with storage juggernaut:puppeteer

# Stagger where each puppet starts in its hop cycle, otherwise the whole crowd's first jump lands on
# the same tick and reads instantly as scripted.
execute as @e[type=mannequin,tag=pp_new_puppet] store result score @s puppet_hop run random value -12..0

tag @e[type=mannequin,tag=pp_new_puppet] remove pp_new_puppet

tag @s add has_puppets
scoreboard players set @s puppet_time 600

# Throw the caster clear along a heading of their own, so they leave the spawn point with the crowd
# rather than standing still in the middle of it.
execute store result score #pp_esc var run random value 0..359
execute store result storage juggernaut:puppeteer yaw float 1 run scoreboard players get #pp_esc var
tag @s remove pp_scattered
function juggernaut:abilities/puppeteer/scatter_owner with storage juggernaut:puppeteer
tag @s remove pp_scattered

# Cover the moment of the scatter so nothing is cleanly trackable for a beat.
particle minecraft:cloud ~ ~1 ~ 0.6 1 0.6 0.02 60 force
particle minecraft:poof ~ ~1 ~ 0.5 0.8 0.5 0.05 40 force
playsound minecraft:entity.evoker.cast_spell master @a[distance=..24] ~ ~ ~ 1 1.2
