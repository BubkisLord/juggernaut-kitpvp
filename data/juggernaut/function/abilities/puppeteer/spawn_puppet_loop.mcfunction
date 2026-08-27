# Run at the caster. Recurses once per configured puppet. Each pass rolls that puppet its own random
# heading rather than taking the next slot around a circle - evenly spaced headings expand as a
# clean ring, which reads as scripted the moment the juggernaut sees it. Random headings mean the
# crowd breaks up unevenly, some puppets running together and some alone, the way real players would.
execute store result score #pp_yaw var run random value 0..359
execute store result storage juggernaut:puppeteer yaw float 1 run scoreboard players get #pp_yaw var
function juggernaut:abilities/puppeteer/spawn_puppet with storage juggernaut:puppeteer

scoreboard players add #pp_i var 1
execute if score #pp_i var < #pp_count var run function juggernaut:abilities/puppeteer/spawn_puppet_loop
