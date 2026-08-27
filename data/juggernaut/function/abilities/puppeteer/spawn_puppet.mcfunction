# Macro: summon a single puppet at the caster's feet facing $(yaw). Pitch is pinned to 0 so the
# forward step in drive_puppet always runs level with the ground, and gravity is disabled because
# drive_puppet does the falling itself in whole-block steps.
$summon mannequin ~ ~ ~ {Tags:["puppeteer_puppet","kill_on_end_game","pp_new_puppet"],pose:"standing",Health:2f,attributes:[{id:"max_health",base:2}],Rotation:[$(yaw)f,0f],NoGravity:1b}
