# Macro: summon a single puppet at the caster's feet facing $(yaw). Gravity is disabled because
# drive_puppet does the falling itself in whole-block steps.
#
# The heading has to be applied with data modify after the summon rather than through the summon's
# own Rotation field, which does not stick on a mannequin - summon_mannequin works around the same
# thing the same way. Set it in the NBT alone and every puppet ends up on yaw 0, walking off in one
# direction together. Pitch is pinned to 0 so the forward step always runs level with the ground.
$summon mannequin ~ ~ ~ {Tags:["puppeteer_puppet","kill_on_end_game","pp_new_puppet","pp_spawning"],pose:"standing",Health:2f,attributes:[{id:"max_health",base:2}],NoGravity:1b}
$data modify entity @e[type=mannequin,tag=pp_spawning,limit=1] Rotation set value [$(yaw)f,0f]
tag @e[type=mannequin,tag=pp_spawning] remove pp_spawning
