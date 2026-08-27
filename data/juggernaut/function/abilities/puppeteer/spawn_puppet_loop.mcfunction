# Run at the caster. Recurses once per configured puppet, advancing the heading by one even step
# each pass so the crowd fans out across the whole circle no matter how many puppets there are.
execute store result storage juggernaut:puppeteer yaw float 1 run scoreboard players get #pp_yaw var
function juggernaut:abilities/puppeteer/spawn_puppet with storage juggernaut:puppeteer

scoreboard players operation #pp_yaw var += #pp_step var
scoreboard players add #pp_i var 1
execute if score #pp_i var < #pp_count var run function juggernaut:abilities/puppeteer/spawn_puppet_loop
