$execute if score @s undetectable_duration_left matches 1.. at @s run particle smoke ~ ~0.5 ~ 0.3 1 0.3 0 3 force @s
$scoreboard players remove @s $(effect)_duration_left 1
$execute if score @s $(effect)_duration_left matches ..0 run tag @s remove is_$(effect)