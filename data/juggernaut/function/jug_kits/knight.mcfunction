execute if entity @a[tag=knight] run return fail
execute if entity @s[tag=has_jug_kit] run return fail
item replace entity @s armor.head with iron_helmet[unbreakable={}]
item replace entity @s armor.chest with iron_chestplate[unbreakable={}]
item replace entity @s armor.legs with iron_leggings[unbreakable={}]
item replace entity @s armor.feet with iron_boots[unbreakable={}]
item replace entity @s hotbar.0 with iron_sword[unbreakable={},tooltip_display={hidden_components:["unbreakable","enchantments"]}]
tellraw @a[tag=juggernaut] [{"selector":"@s"},{"text":": ","color":"red"},{"text": "Selected ","color":"white"},{"text":"Knight","color":"yellow"},{"text":" Kit.","color":"white"}]
function juggernaut:descriptions/kits/juggernaut/knight
tag @s add knight
tag @s add has_jug_kit