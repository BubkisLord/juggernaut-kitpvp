execute if entity @a[tag=hunter] run return fail
execute if entity @s[tag=has_jug_kit] run return fail
item replace entity @s armor.head with iron_helmet[unbreakable={}]
item replace entity @s armor.chest with iron_chestplate[unbreakable={}]
item replace entity @s armor.legs with iron_leggings[unbreakable={}]
item replace entity @s armor.feet with iron_boots[unbreakable={}]
give @s iron_sword[item_name=[{"text": "Machete","bold":false,"color":"dark_red"},{"text": " | ","color": "dark_gray","bold": true},{"text": "MELEE WEAPON","color": "gray","bold": true}],enchantments={sharpness:1},unbreakable={}]
give @s bow[enchantments={infinity:1},tooltip_display={hidden_components:["unbreakable","enchantments"]},item_name=[{"text": "Hunter's Bow","bold":false,"color":"dark_red"},{"text": " | ","color": "dark_gray","bold": true},{"text": "RANGED WEAPON","color": "gray","bold": true}],enchantment_glint_override=true,unbreakable={}]
item replace entity @s container.35 with arrow
tellraw @a[tag=juggernaut] [{"selector":"@s"},{"text":": ","color":"red"},{"text": "Selected ","color":"white"},{"text":"Hunter","color":"dark_red"},{"text":" Kit.","color":"white"}]
function juggernaut:descriptions/kits/juggernaut/hunter
tag @s add hunter
tag @s add has_jug_kit