execute if score #juggernaut_customisation random_kits matches 1 if entity @s[tag=has_jug_kit] run return fail

$execute if entity @a[tag=$(id)] if score #juggernaut_customisation random_kits matches 0 run return fail
$execute if entity @a[tag=$(id)] if score #juggernaut_customisation random_kits matches 1 run function juggernaut:kits/juggernaut/random

function juggernaut:kits/juggernaut/remove_kit

$tellraw @a[tag=juggernaut] [{"selector":"@s"},{"text":": ","color":"red"},{"text": "Selected ","color":"white"},{"text":"$(name)","color":"$(color)"},{"text":" Kit.","color":"white"}]
$function juggernaut:descriptions/kits/juggernaut/$(id)

function stats:calculate_picked_kits

$tag @s add $(id)
tag @s add has_jug_kit

$function juggernaut:kits/juggernaut/$(id)