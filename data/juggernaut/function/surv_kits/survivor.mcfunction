execute if entity @s[tag=has_jug_kit] run return fail
item replace entity @s armor.head with leather_helmet[unbreakable={}] 1
item replace entity @s armor.chest with leather_chestplate[unbreakable={}] 1
item replace entity @s armor.legs with leather_leggings[unbreakable={}] 1
item replace entity @s armor.feet with leather_boots[unbreakable={}] 1
tag @s add survivor
tellraw @a[tag=runner] [{"selector":"@s"},{"text":": ","color":"dark_aqua"},{"text": "Selected ","color":"white"},{"text":"Survivor","color":"dark_blue"},{"text":" Kit.","color":"white"}]
function juggernaut:descriptions/kits/runner/survivor
tag @s add has_jug_kit