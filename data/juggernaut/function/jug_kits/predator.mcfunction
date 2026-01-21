execute as @s[tag=!has_jug_kit] run effect give @s invisibility infinite 0 true
execute as @s[tag=!has_jug_kit] run effect give @s resistance infinite 0 true
execute as @s[tag=!has_jug_kit] run give @s diamond_sword[enchantments={sharpness:3},unbreakable={},lore=[{"text": "Hey don't be looking at the tooltip - go out and hunt someone. Also btw sneaking makes you completely undetectable..."}]]
execute as @s[tag=!has_jug_kit] run attribute @s sneaking_speed base set 0.9
execute as @s[tag=!has_jug_kit] run function juggernaut:descriptions/kits/juggernaut/predator
execute as @s[tag=!has_jug_kit] run tag @s add predator
execute as @s[tag=!has_jug_kit] run time set night
tag @s add has_jug_kit