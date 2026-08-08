# Run as the puppeteer at the puppeteer. Picks the mannequin back up if within 3 blocks.

# Tag this owner's mannequin.
scoreboard players operation #pp_link var = @s puppet_id
tag @e[type=mannequin,tag=puppeteer_mannequin] remove pp_target
execute as @e[type=mannequin,tag=puppeteer_mannequin] if score @s puppet_id = #pp_link var run tag @s add pp_target

# Must be within 3 blocks of the mannequin to pick it up, otherwise refund the cooldown.
execute unless entity @e[type=mannequin,tag=pp_target,distance=..3] run scoreboard players set @s ability_cooldown0 0
execute unless entity @e[type=mannequin,tag=pp_target,distance=..3] run return fail

# Pick it up: removing the mannequin here (before the death-link check) does NOT kill the puppeteer.
tag @s remove has_mannequin
kill @e[type=mannequin,tag=pp_target]
tag @e[type=mannequin,tag=puppeteer_mannequin] remove pp_target
playsound minecraft:entity.item.pickup master @a[distance=..24] ~ ~ ~ 1 0.8
particle minecraft:cloud ~ ~1 ~ 0.3 1 0.3 0.01 20 force
