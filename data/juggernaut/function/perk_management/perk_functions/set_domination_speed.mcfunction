scoreboard players operation @s domination_movement_speed = @s domination_kills
scoreboard players operation @s domination_movement_speed *= #4 var
execute store result storage juggernaut:domination_speed value double 0.01 run scoreboard players get @s domination_movement_speed
data modify storage juggernaut:domination_speed attribute set value movement_speed
data modify storage juggernaut:domination_speed modifier_id set value domination
function juggernaut:attribute_management/apply_modifier with storage juggernaut:domination_speed