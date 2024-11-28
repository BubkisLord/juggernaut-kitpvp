scoreboard players operation @s grim_determination_speed = @s game_deaths
scoreboard players operation @s grim_determination_speed *= #5 var
execute store result storage juggernaut:grim_determination_speed value double 0.01 run scoreboard players get @s grim_determination_speed
data modify storage juggernaut:grim_determination_speed attribute set value movement_speed
data modify storage juggernaut:grim_determination_speed modifier_id set value grim_determination
function juggernaut:attribute_management/apply_modifier with storage juggernaut:grim_determination_speed