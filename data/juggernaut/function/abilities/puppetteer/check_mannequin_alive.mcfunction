# Run as a puppetteer who has a mannequin summoned. If their linked mannequin no longer
# exists, it was destroyed - so the puppetteer dies with it (Bound Soul passive).
scoreboard players operation #pp_link var = @s puppet_id
tag @e[type=mannequin,tag=puppetteer_mannequin] remove pp_alive
execute as @e[type=mannequin,tag=puppetteer_mannequin] if score @s puppet_id = #pp_link var run tag @s add pp_alive

execute if entity @e[type=mannequin,tag=pp_alive] run return fail

# The mannequin is gone. Remove the tag first so this cannot fire twice, then kill the puppetteer.
tag @s remove has_mannequin
title @s title {"text":"Bound Soul","color":"#a64dff","bold":true}
title @s subtitle {"text":"Your mannequin was destroyed!","color":"red"}
playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1 0.7
kill @s
