execute if entity @s[tag=has_jug_kit] run return fail
tellraw @a[tag=runner] [{"selector":"@s"},{"text":": ","color":"dark_aqua"},{"text": "Selected ","color":"white"},{"text":"Windrunner","color":"#13a0ca"},{"text":" Kit.","color":"white"}]
function juggernaut:descriptions/kits/runner/windrunner
# attribute @s friction_modifier modifier add juggernaut:windrunner -0.9 add_multiplied_total
# attribute @s bounciness modifier add juggernaut:windrunner 0.08 add_value
tag @s add windrunner
tag @s add has_jug_kit