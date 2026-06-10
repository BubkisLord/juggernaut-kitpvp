execute if entity @s[tag=has_jug_kit] run return fail
item replace entity @s hotbar.0 with snowball[item_name={"text": "Ice Bomb","color": "#A4D1EA"},lore=[{"text": "Freezes those close by!","color": "dark_gray"}]] 2
item replace entity @s armor.head with iron_helmet[unbreakable={}] 1
item replace entity @s armor.chest with iron_chestplate[unbreakable={}] 1
item replace entity @s armor.legs with iron_leggings[unbreakable={}] 1
item replace entity @s armor.feet with iron_boots[unbreakable={}] 1
give @s golden_apple 2
tag @s add survivor
function juggernaut:descriptions/kits/runner/survivor
tag @s add has_jug_kit