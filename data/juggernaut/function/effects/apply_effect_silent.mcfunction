$tag @s add is_$(effect)
$scoreboard objectives add $(effect)_duration_left dummy
$scoreboard players set @s $(effect)_duration_left $(duration)