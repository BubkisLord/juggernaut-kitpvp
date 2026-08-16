execute if entity @a[tag=timekeeper] run return fail
execute if entity @s[tag=has_jug_kit] run return fail
item replace entity @s armor.head with golden_helmet[unbreakable={},lore=[{"text":"Keeps the ticking sound out. Mostly.","color":"dark_gray"}]]
item replace entity @s armor.chest with golden_chestplate[unbreakable={},lore=[{"text":"Time-resistant fabric.","color":"dark_gray"},{"text":"Not spill-resistant, sadly.","color":"dark_gray"}]]
item replace entity @s armor.legs with golden_leggings[unbreakable={},lore=[{"text":"Crafted to stride through different time speeds.","color":"dark_gray"},{"text":"Mind the temporal drag.","color":"dark_gray"}]]
item replace entity @s armor.feet with golden_boots[unbreakable={},lore=[{"text":"Try not to trip on your own timestream.","color":"dark_gray"},{"text":"(Otherwise they get muddled up sometimes)","color":"dark_gray"}]]
give @s golden_sword[item_name=[{"text": "Golden Scimitar","bold":false,"color":"gold"},{"text": " | ","color": "dark_gray","bold": true},{"text": "MELEE WEAPON","color": "gray","bold": true}],enchantments={sharpness:3},unbreakable={},tooltip_display={hidden_components:["enchantments","unbreakable"]}]
tellraw @a[tag=juggernaut] [{"selector":"@s"},{"text":": ","color":"red"},{"text": "Selected ","color":"white"},{"text":"Timekeeper","color":"gold"},{"text":" Kit.","color":"white"}]
function juggernaut:descriptions/kits/juggernaut/timekeeper
tag @s add timekeeper
tag @s add has_jug_kit