# Healing and Particle Effect

scoreboard players operation @s healing_progress += @s self_healing_per_tick
tag @s add self_healing
tag @s add is_being_healed

# Action Bar Message
execute if score @s self_healing_display_speed matches 0.. run title @s actionbar [{"text":"Healed: ","color":"#439697"},{"score":{"name":"@s","objective":"healing_percent"},"color":"#56dbde"},{"text":"%","color":"#56dbde"},{"text":" (+","color":"#629743"},{"score":{"name":"@s","objective":"self_healing_display_speed"},"color":"#629743"},{"text":"% Speed)","color":"#629743"}]
execute if score @s self_healing_display_speed matches ..0 run title @s actionbar [{"text":"Healed: ","color":"#439697"},{"score":{"name":"@s","objective":"healing_percent"},"color":"#56dbde"},{"text":"%","color":"#56dbde"},{"text":" (","color":"#974343"},{"score":{"name":"@s","objective":"self_healing_display_speed"},"color":"#974343"},{"text":"% Speed)","color":"#974343"}]
execute if score @s self_healing_display_speed matches 0 run title @s actionbar [{"text":"Healed: ","color":"#439697"},{"score":{"name":"@s","objective":"healing_percent"},"color":"#56dbde"},{"text":"%"}]

# Health Boost and Reset
execute if score @s healing_progress >= @s healing_needed run effect give @s instant_health 1 252 true
execute if score @s healing_progress >= @s healing_needed run function juggernaut:hooks/player_self_healed
execute if score @s healing_progress >= @s healing_needed run scoreboard players set @s healing_progress 0