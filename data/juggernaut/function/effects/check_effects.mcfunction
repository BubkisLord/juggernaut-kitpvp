$scoreboard players remove @s $(effect)_duration_left 1
$execute if score @s $(effect)_duration_left matches ..0 run tag @s remove is_$(effect)