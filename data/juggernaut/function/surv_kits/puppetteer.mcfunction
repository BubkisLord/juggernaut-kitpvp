execute if entity @s[tag=has_jug_kit] run return fail
tellraw @a[tag=runner] [{"selector":"@s"},{"text":": ","color":"dark_aqua"},{"text": "Selected ","color":"white"},{"text":"Puppetteer","color":"#a64dff"},{"text":" Kit.","color":"white"}]
function juggernaut:descriptions/kits/runner/puppeteer
tag @s add puppeteer
tag @s add has_jug_kit
# Assign a unique owner id used to link this puppeteer to their mannequin and puppets.
scoreboard players add #puppet_id_counter var 1
scoreboard players operation @s puppet_id = #puppet_id_counter var
