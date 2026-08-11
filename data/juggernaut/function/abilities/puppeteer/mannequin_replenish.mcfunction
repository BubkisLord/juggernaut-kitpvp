# Run as a puppeteer who has a mannequin summoned. The mannequin passively replenishes the
# nearest station at 60% efficiency (the puppeteer's own rate, including their perks).
execute unless score #game_state var matches 11 run return fail

# Tag this owner's mannequin.
scoreboard players operation #pp_link var = @s puppet_id
tag @e[type=mannequin,tag=puppeteer_mannequin] remove pp_target
execute as @e[type=mannequin,tag=puppeteer_mannequin] if score @s puppet_id = #pp_link var run tag @s add pp_target

# Only replenish when the mannequin sits next to a station, no juggernaut is looming, and the
# station is not banished. Runs as the puppeteer (for perks) at the mannequin (for position).
execute at @e[type=mannequin,tag=pp_target] if entity @e[type=armor_stand,tag=replenishment.station,distance=..3] unless entity @a[tag=juggernaut,distance=..12,tag=!undetectable] unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..24] run function juggernaut:replenishment_management/try_replenish

tag @e[type=mannequin,tag=puppeteer_mannequin] remove pp_target