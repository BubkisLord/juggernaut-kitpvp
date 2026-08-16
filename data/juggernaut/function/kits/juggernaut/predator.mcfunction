execute if entity @a[tag=predator] run return fail
execute if entity @s[tag=has_jug_kit] run return fail
effect give @s resistance infinite 0 true
give @s diamond_sword[enchantments={sharpness:3},unbreakable={},item_name=[{"text": "Predator's Blade","color":"#b5ee4a"},{"text": " | ","color": "dark_gray","bold": true},{"text": "MELEE WEAPON","color": "gray","bold": true}],tooltip_display={hidden_components:["enchantments","unbreakable"]}]
attribute @s sneaking_speed base set 0.9
tellraw @a[tag=juggernaut] [{"selector":"@s"},{"text":": ","color":"red"},{"text": "Selected ","color":"white"},{"text":"Predator","color":"#b5ee4a"},{"text":" Kit.","color":"white"}]
function juggernaut:descriptions/kits/juggernaut/predator
effect give @s regeneration infinite 0 true
effect give @s saturation infinite 255 true
tag @s add predator
time set night
tag @s add has_jug_kit