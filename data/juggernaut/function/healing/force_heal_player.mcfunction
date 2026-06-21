$scoreboard players add @s healing_progress $(heal_amount)

execute if score @s healing_progress >= @s healing_needed run effect give @s instant_health 1 252 true
execute if score @s healing_progress >= @s healing_needed run scoreboard players set @s healing_progress 0