execute if score @s healing_progress matches ..0 run return fail

$execute if score @s healing_progress matches 1.. run scoreboard players remove @s healing_progress $(amount)

# Minimum healing progress is 0
execute if score @s healing_progress matches ..-1 run scoreboard players set @s healing_progress 0