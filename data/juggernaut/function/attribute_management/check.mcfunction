$scoreboard objectives add $(modifier_name)_duration_left dummy
$scoreboard players remove @s $(modifier_name)_duration_left 1
$execute if score @s $(modifier_name)_duration_left matches ..0 run attribute @s minecraft:$(attribute_name) modifier remove juggernaut:$(modifier_name)