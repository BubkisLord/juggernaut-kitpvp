execute if entity @s[tag=!is_undetectable] run effect give @s glowing 2 0 true
execute if entity @s[tag=!is_undetectable] run tag @s add is_glowing
execute if entity @s[tag=!is_undetectable] run particle enchant ~ ~ ~ 2 2 2 0 1 normal @a