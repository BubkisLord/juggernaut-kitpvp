tag @s add medic_using_ability
execute at @s as @a[distance=..8,tag=runner,tag=!medic_using_ability] if score @s health < @s max_health run scoreboard players operation @s healing_progress = @s healing_needed
execute if score @s health < @s max_health run scoreboard players operation @s medic_heal_amount = @s healing_needed
execute if score @s health < @s max_health run scoreboard players operation @s medic_heal_amount /= #2 var
execute if score @s health < @s max_health run scoreboard players operation @s healing_progress += @s medic_heal_amount
execute if score @s health < @s max_health run effect give @s regeneration 5 0 true
execute as @a[distance=..8,tag=runner] at @s if score @s health < @s max_health run particle heart ~ ~0.5 ~ 0.2 1.5 0.2 0 50 force
execute if entity @a[distance=..8,tag=runner,tag=!medic_using_ability] run scoreboard players operation @s jug_kit_cooldown /= #2 var
execute if entity @a[distance=..8,tag=runner,tag=!medic_using_ability] run scoreboard players operation @s jug_kit_cooldown_2 /= #2 var
tag @s remove medic_using_ability