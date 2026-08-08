# Run as a puppeteer who has a mannequin. The health scoreboard criterion does not auto-track
# non-player entities, so read the mannequin's current Health straight from its NBT into manne_hp.
# Compared against manne_full (captured at summon) this tells us if the mannequin has taken damage.
scoreboard players operation #pp_link var = @s puppet_id
tag @e[type=mannequin,tag=puppeteer_mannequin] remove pp_target
execute as @e[type=mannequin,tag=puppeteer_mannequin] if score @s puppet_id = #pp_link var run tag @s add pp_target
scoreboard players set @s manne_hp 0
execute store result score @s manne_hp int 1 run data get entity @n[type=mannequin,tag=pp_target] Health
tag @e[type=mannequin,tag=puppeteer_mannequin] remove pp_target
