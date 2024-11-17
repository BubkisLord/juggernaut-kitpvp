$scoreboard players remove @s healing_progress $(amount)
title @s actionbar [{"text": "Healed: ","color": "#974343"},{"score": {"name": "@s","objective": "healing_progress"},"color": "#de5656"},{"text": "%"}]

# Minimum healing progress is 0
execute if score @s healing_progress matches ..-1 run scoreboard players set @s healing_progress 0