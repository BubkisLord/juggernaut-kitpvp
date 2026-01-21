execute store result storage juggernaut:replenishment_management/below_name_percentage var int 1 run scoreboard players get @s replenish_decimal 
data modify entity @s CustomNameVisible set value true
$data modify entity @s CustomName set value "$(var)% Completed"