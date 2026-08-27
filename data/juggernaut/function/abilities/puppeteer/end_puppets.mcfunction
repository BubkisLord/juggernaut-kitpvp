# Run as the puppeteer. Tears down this owner's puppets.
scoreboard players operation #pp_link var = @s puppet_id
execute as @e[type=mannequin,tag=puppeteer_puppet] if score @s puppet_id = #pp_link var run kill @s
tag @s remove has_puppets
scoreboard players set @s puppet_time 0
