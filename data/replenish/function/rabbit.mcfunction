clear @s
effect give @s jump_boost 1000000 5 true
give @s rabbit_foot[item_name={"text":"Your Foot","color":"gold","italic":false},lore=[{"text":"Can you do a roundhouse kick?","color":"dark_gray"}],unbreakable={},enchantments={sharpness:10}]
give @s cooked_beef[item_name={"text":"Steak","color":"gold","italic":false},lore=[{"text":"Eat to regenerate.","color":"dark_gray"}]] 16
item replace entity @s armor.head with dead_brain_coral_fan[item_name={"text":"Rabbit Ears","color":"gold","italic":false},lore=[{"text":"What is a rabbit without its ears?","color":"dark_gray"}],unbreakable={}]
item replace entity @s armor.chest with leather_chestplate[item_name={"text":"Rabbit's Chestpiece","color":"gold","italic":false},lore=[{"text":"Doesn't offer much protection.","color":"dark_gray"}],dyed_color=14738893,unbreakable={}]
item replace entity @s armor.legs with leather_leggings[item_name={"text":"Rabbit's Trousers","color":"gold","italic":false},lore=[{"text":"NOT made from Rabbit's Hide.","color":"dark_gray"}],dyed_color=14738893,unbreakable={}]
item replace entity @s armor.feet with leather_boots[item_name={"text":"Rabbit's Feet","color":"gold","italic":false},lore=[{"text":"Jump-jump-jump!","color":"dark_gray"}],dyed_color=14738893,unbreakable={},enchantments={feather_falling:10}]