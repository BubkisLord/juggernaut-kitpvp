# Run as the puppeteer, positioned at the puppeteer. Summons the linked mannequin.
# Only one mannequin at a time - guarded by the has_mannequin tag in the loop registration.

# Summon the mannequin. It is a stationary decoy with lots of health that can still be damaged.
summon mannequin ~ ~ ~ {Tags:["puppeteer_mannequin","kill_on_end_game","pp_new_mannequin"],pose:"standing",Health:200f,attributes:[{id:"max_health",base:200}],Rotation:[0f,0f]}
data modify entity @n[type=mannequin,tag=pp_new_mannequin] Rotation set from entity @s Rotation

# Bail out if for some reason the mannequin was not created (keeps the tag state consistent).
execute unless entity @n[type=mannequin,tag=pp_new_mannequin] run scoreboard players set @s ability_cooldown0 0
execute unless entity @n[type=mannequin,tag=pp_new_mannequin] run return fail

# Make the mannequin wear the puppeteer's skin and link it to this owner.
data modify entity @n[type=mannequin,tag=pp_new_mannequin] profile.id set from entity @s UUID
scoreboard players operation @n[type=mannequin,tag=pp_new_mannequin] puppet_id = @s puppet_id

# Record the mannequin's full health as a baseline for the swap "took damage" check. Reading it
# from NBT means this works whether or not the max_health attribute above actually applied.
scoreboard players set @s manne_full 0
execute store result score @s manne_full int 1 run data get entity @n[type=mannequin,tag=pp_new_mannequin] Health
scoreboard players operation @s manne_hp = @s manne_full

tag @n[type=mannequin,tag=pp_new_mannequin] remove pp_new_mannequin

tag @s add has_mannequin
playsound minecraft:block.wood.place master @a[distance=..24] ~ ~ ~ 1 0.6
particle minecraft:cloud ~ ~1 ~ 0.3 1 0.3 0.01 20 force
