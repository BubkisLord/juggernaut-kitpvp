execute if entity @a[tag=jug_knight] run return fail
execute if entity @s[tag=has_jug_kit] run return fail
item replace entity @s armor.head with iron_helmet[unbreakable={}]
item replace entity @s armor.chest with iron_chestplate[unbreakable={}]
item replace entity @s armor.legs with iron_leggings[unbreakable={}]
item replace entity @s armor.feet with iron_boots[unbreakable={}]
item replace entity @s hotbar.0 with iron_sword[enchantments={sharpness:1},unbreakable={},tooltip_display={hidden_components:["unbreakable","enchantments"]}]
function juggernaut:descriptions/kits/juggernaut/knight
stopsound @a
tag @s add jug_knight
tag @s add has_jug_kit