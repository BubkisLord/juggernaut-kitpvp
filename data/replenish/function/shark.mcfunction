clear @s
effect give @s water_breathing 1000000 100 true
give @s iron_nugget[item_name={"text":"Shark's Tooth","color":"gold","italic":false},lore=[{"text":"Extremely sharp.","color":"dark_gray"}],unbreakable={},enchantments={sharpness:6}]
give @s cooked_beef[item_name={"text":"Steak","color":"gold","italic":false},lore=[{"text":"Eat to regenerate.","color":"dark_gray"}]] 16
item replace entity @s armor.head with leather_helmet[item_name={"text":"Shark Head","color":"gold","italic":false},lore=[{"text":"Admittedly, it looks like a helmet.","color":"dark_gray"}],dyed_color=10067885,unbreakable={}]
item replace entity @s armor.chest with leather_chestplate[item_name={"text":"Shark's Chestpiece","color":"gold","italic":false},lore=[{"text":"Sharks actually wear armour.","color":"dark_gray"}],dyed_color=10067885,unbreakable={}]
item replace entity @s armor.legs with leather_leggings[item_name={"text":"Shark's Pants","color":"gold","italic":false},lore=[{"text":"Perfect for underwater adventures.","color":"dark_gray"}],dyed_color=10067885,unbreakable={}]
item replace entity @s armor.feet with leather_boots[item_name={"text":"Shark's Boots","color":"gold","italic":false},lore=[{"text":"Increases swim speed.","color":"dark_gray"}],dyed_color=10067885,unbreakable={},enchantments={depth_strider:5}]