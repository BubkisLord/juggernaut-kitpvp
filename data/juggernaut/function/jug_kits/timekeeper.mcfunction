execute as @s[tag=!has_jug_kit] run item replace entity @s armor.head with golden_helmet[unbreakable={},lore=[{"text":"Keeps the ticking sound out. Mostly.","color":"dark_gray"}]]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.chest with golden_chestplate[unbreakable={},lore=[{"text":"Time-resistant fabric.","color":"dark_gray"},{"text":"Not spill-resistant, sadly.","color":"dark_gray"}]]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.legs with golden_leggings[unbreakable={},lore=[{"text":"Crafted to stride through different time speeds.","color":"dark_gray"},{"text":"Mind the temporal drag.","color":"dark_gray"}]]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.feet with golden_boots[unbreakable={},lore=[{"text":"Try not to trip on your own timestream.","color":"dark_gray"},{"text":"(Otherwise they get muddled up sometimes)","color":"dark_gray"}]]
execute as @s[tag=!has_jug_kit] run give @s golden_sword[item_name={"text": "Golden Scimitar"},enchantments={sharpness:3},lore=[{"text":"Why a scimitar?","color":"dark_gray"},{"text":"Who's to say! (But he's not here so I guess we'll never know...)","color":"dark_gray"}],unbreakable={}]
execute as @s[tag=!has_jug_kit] run function juggernaut:descriptions/kits/juggernaut/timekeeper
execute as @s[tag=!has_jug_kit] run tag @s add timekeeper
tag @s add has_jug_kit