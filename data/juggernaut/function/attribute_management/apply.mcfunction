$scoreboard objectives add $(modifier_name)_duration_left dummy
$scoreboard players set @s $(modifier_name)_duration_left $(duration)
$attribute @s minecraft:$(attribute_name) modifier add juggernaut:$(modifier_name) $(value) add_multiplied_total