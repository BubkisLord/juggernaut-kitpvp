# Healing and Particle Effect

scoreboard players operation @s healing_progress += @s self_healing_per_tick
scoreboard players operation @s healing_time_left = @s healing_needed
scoreboard players operation @s healing_time_left -= @s healing_progress
scoreboard players operation @s healing_time_left /= @s self_healing_per_tick
scoreboard players operation @s healing_time_left /= #20 var

scoreboard players operation @s healing_minutes = @s healing_time_left
scoreboard players operation @s healing_minutes /= #60 var
scoreboard players operation @s healing_seconds = @s healing_time_left
scoreboard players operation @s healing_seconds %= #60 var
tag @s add is_healing

# Action Bar Message
data modify storage juggernaut:healing/try_self_heal percentage_text set value [{"text":"Healed: ","color":"#439697"},{"score":{"name":"@s","objective":"healing_percent"},"color":"#56dbde"},{"text":"%","color":"#56dbde"}]
execute if score @s self_healing_per_tick matches 1.. if score @s self_healing_display_speed matches 1.. if score @s healing_seconds matches 0..9 run title @s actionbar [{"storage":"juggernaut:healing/try_self_heal","nbt":"percentage_text","interpret":true},{"text":" (ETA: "},{"score":{name:"@s","objective":"healing_minutes"}},{"text":":0"},{"score":{name:"@s","objective":"healing_seconds"}},{"text":", ","color":"#439697"},{"text":"+","color":"#629743"},{"score":{"name":"@s","objective":"self_healing_display_speed"},"color":"#629743"},{"text":"% Speed","color":"#629743"},{"text":")","color":"#439697"}]
execute if score @s self_healing_per_tick matches 1.. if score @s self_healing_display_speed matches 1.. if score @s healing_seconds matches 10..59 run title @s actionbar [{"storage":"juggernaut:healing/try_self_heal","nbt":"percentage_text","interpret":true},{"text":" (ETA: "},{"score":{name:"@s","objective":"healing_minutes"}},{"text":":"},{"score":{name:"@s","objective":"healing_seconds"}},{"text":", ","color":"#439697"},{"text":"+","color":"#629743"},{"score":{"name":"@s","objective":"self_healing_display_speed"},"color":"#629743"},{"text":"% Speed","color":"#629743"},{"text":")","color":"#439697"}]

execute if score @s self_healing_per_tick matches 1.. if score @s self_healing_display_speed matches ..-1 if score @s healing_seconds matches 0..9 run title @s actionbar [{"storage":"juggernaut:healing/try_self_heal","nbt":"percentage_text","interpret":true},{"text":" (ETA: "},{"score":{name:"@s","objective":"healing_minutes"}},{"text":":0"},{"score":{name:"@s","objective":"healing_seconds"}},{"text":", ","color":"#439697"},{"score":{"name":"@s","objective":"self_healing_display_speed"},"color":"#974343"},{"text":"% Speed","color":"#974343"},{"text":")","color":"#439697"}]
execute if score @s self_healing_per_tick matches 1.. if score @s self_healing_display_speed matches ..-1 if score @s healing_seconds matches 10..59 run title @s actionbar [{"storage":"juggernaut:healing/try_self_heal","nbt":"percentage_text","interpret":true},{"text":" (ETA: "},{"score":{name:"@s","objective":"healing_minutes"}},{"text":":"},{"score":{name:"@s","objective":"healing_seconds"}},{"text":", ","color":"#439697"},{"score":{"name":"@s","objective":"self_healing_display_speed"},"color":"#974343"},{"text":"% Speed","color":"#974343"},{"text":")","color":"#439697"}]

execute if score @s self_healing_per_tick matches 1.. if score @s self_healing_display_speed matches 0 if score @s healing_seconds matches 0..9 run title @s actionbar [{"storage":"juggernaut:healing/try_self_heal","nbt":"percentage_text","interpret":true},{"text":" (ETA: "},{"score":{name:"@s","objective":"healing_minutes"}},{"text":":0"},{"score":{name:"@s","objective":"healing_seconds"}},{"text":")"}]
execute if score @s self_healing_per_tick matches 1.. if score @s self_healing_display_speed matches 0 if score @s healing_seconds matches 10..59 run title @s actionbar [{"storage":"juggernaut:healing/try_self_heal","nbt":"percentage_text","interpret":true},{"text":" (ETA: "},{"score":{name:"@s","objective":"healing_minutes"}},{"text":":"},{"score":{name:"@s","objective":"healing_seconds"}},{"text":")"}]

# Health Boost and Reset
execute if score @s healing_progress >= @s healing_needed run effect give @s instant_health 1 252 true
execute if score @s healing_progress >= @s healing_needed run scoreboard players set @s healing_progress 0