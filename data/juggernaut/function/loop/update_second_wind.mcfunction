execute unless entity @s[scores={used_totem=1..}] if entity @s[scores={lives_remaining=..1}] unless items entity @s container.* totem_of_undying run give @s totem_of_undying
execute if entity @s[scores={used_totem=1..}] run data merge entity @s {Health:1f}
execute if entity @s[scores={used_totem=1..}] run clear @s totem_of_undying
execute if entity @s[scores={used_totem=1..}] run effect clear @s regeneration
execute if entity @s[scores={used_totem=1..}] run effect clear @s absorption
execute if entity @s[scores={used_totem=1..}] run effect give @s speed 10 1 true
execute if entity @s[scores={used_totem=1..}] run effect give @s invisibility 10 0 true
execute if entity @s[scores={used_totem=1..}] run tag @s remove using_second_wind