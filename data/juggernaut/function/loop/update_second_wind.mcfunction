execute if items entity @s player.cursor totem_of_undying run item replace entity @s player.cursor with air
execute if items entity @s weapon.mainhand totem_of_undying run item replace entity @s weapon.mainhand with air
execute if entity @s[scores={used_totem=..0}] unless items entity @s weapon.offhand totem_of_undying run item replace entity @s weapon.offhand with totem_of_undying
execute if entity @s[scores={used_totem=1..}] run data merge entity @s {Health:1f}
execute if entity @s[scores={used_totem=1..}] run effect clear @s regeneration
execute if entity @s[scores={used_totem=1..}] run effect clear @s absorption
execute if entity @s[scores={used_totem=1..}] run effect give @s speed 3 0 true