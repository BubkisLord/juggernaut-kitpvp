$execute if score @s $(effect)_duration_left matches ..0 run tag @s remove $(effect)
$scoreboard players remove @s $(effect)_duration_left 1