execute if entity @a[tag=spirit_walker] run return fail
execute if entity @s[tag=has_jug_kit] run return fail
item replace entity @s armor.head with diamond_helmet[unbreakable={}]
item replace entity @s armor.chest with diamond_chestplate[unbreakable={}]
item replace entity @s armor.legs with diamond_leggings[unbreakable={}]
item replace entity @s armor.feet with diamond_boots[unbreakable={}]
item replace entity @s hotbar.0 with diamond_sword[unbreakable={},tooltip_display={hidden_components:["enchantments","unbreakable"]},item_name={text:"Veil Slicer","color":"#577ebe"}]
function juggernaut:descriptions/kits/juggernaut/spirit_walker
tag @s add spirit_walker
tag @s add has_jug_kit