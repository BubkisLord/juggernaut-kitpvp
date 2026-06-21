# Healing and Particle Effect

scoreboard players operation @s healing_progress += @s self_healing_per_tick
tag @s add self_healing
tag @s add is_being_healed

# Action Bar Message
execute store result storage juggernaut:healing_percent healing_percent float 0.01 run scoreboard players get @s healing_percent
function juggernaut:healing/heal_particles with storage juggernaut:healing_percent

# Health Boost and Reset
execute if score @s healing_progress >= @s healing_needed run effect give @s instant_health 1 252 true
execute if score @s healing_progress >= @s healing_needed run function juggernaut:hooks/player_self_healed
execute if score @s healing_progress >= @s healing_needed run scoreboard players set @s healing_progress 0