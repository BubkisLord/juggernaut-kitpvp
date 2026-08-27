# Run as the puppeteer. Ticks this owner's scattered puppets. Each puppet steers itself, so all this
# does is scope the owner's own puppets and hand each one a tick of movement.
scoreboard players operation #pp_link var = @s puppet_id

tag @e[type=mannequin,tag=puppeteer_puppet] remove pp_owned
execute as @e[type=mannequin,tag=puppeteer_puppet] if score @s puppet_id = #pp_link var run tag @s add pp_owned

execute as @e[type=mannequin,tag=pp_owned] at @s run function juggernaut:abilities/puppeteer/drive_puppet

# Keeps chip damage from thinning the crowd early - only a proper hit should drop a puppet.
effect give @e[type=mannequin,tag=pp_owned] regeneration 2 30 true

tag @e[type=mannequin,tag=puppeteer_puppet] remove pp_owned
