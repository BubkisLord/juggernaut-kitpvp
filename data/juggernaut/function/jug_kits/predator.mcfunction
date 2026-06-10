execute if entity @a[tag=predator] run return fail
execute if entity @s[tag=has_jug_kit] run return fail
effect give @s invisibility infinite 0 true
effect give @s resistance infinite 0 true
give @s diamond_sword[enchantments={sharpness:3},unbreakable={},lore=[{"text": "Predator's Blade","color":"#b5ee4a","italic":true}]]
attribute @s sneaking_speed base set 0.9
attribute @s movement_speed modifier add juggernaut:predator_move_spd 0.1 add_multiplied_base
function juggernaut:descriptions/kits/juggernaut/predator
tag @s add predator
time set night
tag @s add has_jug_kit