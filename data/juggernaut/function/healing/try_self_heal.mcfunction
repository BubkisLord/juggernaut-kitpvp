# Healing and Particle Effect

$scoreboard players add @s healing_progress $(heal_amount)
tag @s add self_healing
tag @s add is_being_healed

# Action Bar Message
title @s actionbar [{"text":"Healed: ","color":"#439697"},{"score":{"name":"@s","objective":"healing_percent"},"color":"#56dbde"},{"text":"%"}]

# Health Boost and Reset
execute if score @s healing_progress >= @s healing_needed run effect give @s instant_health 1 252 true
execute if score @s healing_progress >= @s healing_needed run function juggernaut:hooks/player_self_healed
execute if score @s healing_progress >= @s healing_needed run scoreboard players set @s healing_progress 0