# Run as the puppeteer at the puppeteer. Swaps places with the linked mannequin.

# Tag this owner's mannequin.
scoreboard players operation #pp_link var = @s puppet_id
tag @e[type=mannequin,tag=puppeteer_mannequin] remove pp_target
execute as @e[type=mannequin,tag=puppeteer_mannequin] if score @s puppet_id = #pp_link var run tag @s add pp_target

# No mannequin summoned - refund and fail.
execute unless entity @e[type=mannequin,tag=pp_target] run scoreboard players set @s ability_cooldown1 4000
execute unless entity @e[type=mannequin,tag=pp_target] run playsound block.note_block.didgeridoo ui @s ~ ~ ~ 1.2
execute unless entity @e[type=mannequin,tag=pp_target] run particle angry_villager ~ ~ ~ 1 0.6 1 0 80
execute unless entity @e[type=mannequin,tag=pp_target] run return fail

# Perform the swap using marker armor stands (same technique as the trickster/chameleon swaps).
execute as @e[type=mannequin,tag=pp_target] at @s run summon armor_stand ~ ~ ~ {Tags:["pp_swap_target","kill_on_end_game"],Invisible:1b,Invulnerable:1b,Marker:1b}
execute at @s run summon armor_stand ~ ~ ~ {Tags:["pp_swap_origin","kill_on_end_game"],Invisible:1b,Invulnerable:1b,Marker:1b}
tp @s @n[type=armor_stand,tag=pp_swap_target]
execute as @e[type=mannequin,tag=pp_target] run tp @s @n[type=armor_stand,tag=pp_swap_origin]
kill @e[type=armor_stand,tag=pp_swap_origin]
kill @e[type=armor_stand,tag=pp_swap_target]

# Heal the mannequin back to full so a single past hit does not leave swap permanently available.
data modify entity @n[type=mannequin,tag=pp_target] Health set value 200f

tag @e[type=mannequin,tag=puppeteer_mannequin] remove pp_target
playsound minecraft:entity.enderman.teleport master @a[distance=..24] ~ ~ ~ 1 1.2
particle minecraft:portal ~ ~1 ~ 0.4 1 0.4 0.1 30 force
