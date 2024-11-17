# Healing and Particle Effect
# If using fractured aid, self-heal 20% slower.
execute unless entity @s[tag=using_fractured_aid] store result storage juggernaut:healing/try_self_heal heal_amount int 0.8 run data get storage juggernaut:healing/try_self_heal heal_amount

# If using self-preservation, self-heal 15% faster.
execute unless entity @s[tag=using_self_preservation] store result storage juggernaut:healing/try_self_heal heal_amount int 1.15 run data get storage juggernaut:healing/try_self_heal heal_amount
$scoreboard players add @s healing_progress $(heal_amount)
particle cherry_leaves ~ ~0.5 ~ 0.1 0.1 0.1 0 10 force @s
tag @s add self_healing
tag @s add is_being_healed

# Action Bar Message
title @s actionbar [{"text":"Healed: ","color":"#439697"},{"score":{"name":"@s","objective":"healing_percent"},"color":"#56dbde"},{"text":"%"}]

# Health Boost and Reset
execute if score @s healing_progress >= @s healing_needed run effect give @s instant_health 1 252 true
execute if score @s healing_progress >= @s healing_needed run scoreboard players set @s healing_progress 0