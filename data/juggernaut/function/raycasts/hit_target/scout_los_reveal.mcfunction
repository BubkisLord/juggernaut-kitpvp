execute if entity @s[tag=undetectable] run return fail 
effect give @s glowing 2 0 true
tag @s add is_glowing
particle enchant ~ ~ ~ 2 2 2 0 1 normal @a