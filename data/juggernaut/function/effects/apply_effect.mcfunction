$tag @s add is_$(effect)
$scoreboard players set @s $(effect)_duration_left $(duration)
$tellraw @s [{"text": "You have become ","italic": true,"color": "gray"},{"text": "$(effect)","italic":false,"color": "$(color)"},{"text": ".","italic": true,"color": "gray"}]