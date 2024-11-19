$scoreboard objectives add $(attribute_name)_duration_left dummy
$scoreboard players set @s $(attribute_name)_duration_left $(duration)
$attribute @s $(attribute_namespace).$(attribute_name) base set $(value)