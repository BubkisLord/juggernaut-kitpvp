scoreboard players operation #pp_link var = @s puppet_id
tag @e[type=mannequin,tag=puppeteer_mannequin] remove owned_puppet
execute as @e[type=mannequin,tag=puppeteer_mannequin] if score @s puppet_id = #pp_link var run tag @s add owned_puppet
kill @e[type=mannequin,tag=owned_puppet]
tag @e[type=mannequin,tag=puppeteer_mannequin] remove owned_puppet
tag @s remove has_mannequin