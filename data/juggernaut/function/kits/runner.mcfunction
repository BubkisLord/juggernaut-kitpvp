execute if score #juggernaut_customisation random_kits matches 1 if entity @s[tag=has_jug_kit] run return fail

$execute if entity @s[tag=has_jug_kit,tag=!$(id)] run function juggernaut:kits/runner/remove_kit
execute if entity @s[tag=has_jug_kit] run return fail

$tellraw @a[tag=runner] [{"selector":"@s"},{"text":": ","color":"dark_aqua"},{"text": "Selected ","color":"white"},{"text":"$(name)","color":"$(color)"},{"text":" Kit.","color":"white"}]
$function juggernaut:descriptions/kits/runner/$(id)

function stats:calculate_picked_kits

$tag @s add $(id)
tag @s add has_jug_kit

$function juggernaut:kits/runner/$(id)