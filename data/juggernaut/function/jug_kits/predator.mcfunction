execute as @s[tag=!has_jug_kit] run effect give @s invisibility infinite 0 true
execute as @s[tag=!has_jug_kit] run effect give @s resistance infinite 0 true
execute as @s[tag=!has_jug_kit] run give @s diamond_sword[enchantments={sharpness:3},unbreakable={}]
execute as @s[tag=!has_jug_kit] run attribute @s sneaking_speed base set 0.9
execute as @s[tag=!has_jug_kit] run tag @s add predator
tag @s add has_jug_kit