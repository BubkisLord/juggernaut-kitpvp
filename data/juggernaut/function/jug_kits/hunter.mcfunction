execute if entity @a[tag=hunter] run return fail
execute if entity @s[tag=has_jug_kit] run return fail
item replace entity @s armor.head with iron_helmet[unbreakable={}]
item replace entity @s armor.chest with iron_chestplate[unbreakable={}]
item replace entity @s armor.legs with iron_leggings[unbreakable={}]
item replace entity @s armor.feet with iron_boots[unbreakable={}]
give @s iron_sword[item_name={"text": "Iron Spear"},enchantments={sharpness:1},unbreakable={}]
give @s bow[enchantments={infinity:1,power:1},tooltip_display={hidden_components:["unbreakable","enchantments"]},item_name={"text": "Hunter's Bow","color": "dark_red"},enchantment_glint_override=true,unbreakable={}]
item replace entity @s hotbar.6 with arrow
function juggernaut:descriptions/kits/juggernaut/hunter
tag @s add hunter
tag @s add has_jug_kit