# Run as the puppetteer. Tears down this owner's puppet ring.
scoreboard players operation #pp_link var = @s puppet_id
execute as @e[type=mannequin,tag=puppetteer_puppet] if score @s puppet_id = #pp_link var run kill @s
execute as @e[type=marker,tag=puppet_center] if score @s puppet_id = #pp_link var run kill @s
tag @s remove has_puppets
scoreboard players set @s puppet_time 0
