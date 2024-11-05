execute as @s[tag=!has_jug_kit] run effect give @s invisibility infinite 0 true
execute as @s[tag=!has_jug_kit] run effect give @s resistance infinite 0 true
execute as @s[tag=!has_jug_kit] run give @s diamond_sword[enchantments={sharpness:4},unbreakable={}]
execute as @s[tag=!has_jug_kit] run give @s cooked_beef 64
execute as @s[tag=!has_jug_kit] run tag @s add predator
tag @s add has_jug_kit