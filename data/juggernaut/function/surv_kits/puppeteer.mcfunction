execute if entity @s[tag=has_jug_kit] run return fail
tag @s add puppeteer
tellraw @a[tag=runner] [{"selector":"@s"},{"text":": ","color":"dark_aqua"},{"text": "Selected ","color":"white"},{"text":"Puppeteer","color":"#cfc7ba"},{"text":" Kit.","color":"white"}]
function juggernaut:descriptions/kits/runner/puppeteer
tag @s add has_jug_kit