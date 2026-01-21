execute as @s[tag=!has_jug_kit] run item replace entity @s armor.head with iron_helmet[unbreakable={},lore=[{"text":"For seeing what should be left unseen.","color":"dark_gray"}]]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.chest with iron_chestplate[unbreakable={},lore=[{"text":"For seeing what should be left unseen.","color":"dark_gray"}]]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.legs with iron_leggings[unbreakable={},lore=[{"text":"Carried through too many pursuits.","color":"dark_gray"}]]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.feet with iron_boots[unbreakable={},lore=[{"text": "Silent. Like a hunter. Hunting. Yes...","color":"dark_gray"}]]
execute as @s[tag=!has_jug_kit] run give @s iron_sword[item_name={"text": "Iron Spear"},enchantments={sharpness:1},unbreakable={}]
execute as @s[tag=!has_jug_kit] run give @s bow[enchantments={infinity:1},tooltip_display={hidden_components:["unbreakable","enchantments"]},item_name={"text": "Hunter's Bow","color": "dark_red"},enchantment_glint_override=true,lore=[{"text": "Weapon crafted from the bones of the hunter's victims.","color": "dark_gray"}],unbreakable={}]
execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.6 with arrow
execute as @s[tag=!has_jug_kit] run function juggernaut:descriptions/kits/juggernaut/hunter
execute as @s[tag=!has_jug_kit] run tag @s add jug_hunter
tag @s add has_jug_kit