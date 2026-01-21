execute as @s[tag=!has_jug_kit] run item replace entity @s armor.head with iron_helmet[unbreakable={},lore=[{"text":"Is it an incompetee that bounces or the incompetence of the bounces which makes a pouncing incompetee a pouncing incompetee?","color":"dark_gray"}]]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.chest with iron_chestplate[unbreakable={}]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.legs with iron_leggings[unbreakable={}]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.feet with iron_boots[unbreakable={}]
execute as @s[tag=!has_jug_kit] run item replace entity @s hotbar.0 with iron_sword[item_name={"text": "Incompetee's Claw"},enchantments={sharpness:1},unbreakable={},tooltip_display={hidden_components:["unbreakable","enchantments"]}]
execute as @s[tag=!has_jug_kit] run function juggernaut:descriptions/kits/juggernaut/pouncing_incompetee
execute as @s[tag=!has_jug_kit] run tag @s add pouncing_incompetee
tag @s add has_jug_kit