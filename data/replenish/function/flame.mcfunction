clear @s
effect give @s minecraft:fire_resistance 1000000 100 true
give @s golden_sword[item_name={"text":"Sunblade","color":"dark_aqua","italic":false},lore=[{"text":"Enemies struck will burn forever.","color":"dark_gray"}],unbreakable={},enchantments={fire_aspect:255}]
give @s bow[item_name={"text":"Flaming Bow","color":"dark_aqua","italic":false},lore=[{"text":"Ready! Aim! FIRE! Badum-tiss.","color":"dark_gray"}],unbreakable={},enchantments={flame:1}]
give @s cooked_beef[item_name={"text":"Steak","color":"dark_aqua","italic":false},lore=[{"text":"Eat to regenerate.","color":"dark_gray"}]] 16
give @s arrow[item_name={"text":"Feathered Arrow","color":"dark_aqua","italic":false},lore=[{"text":"Aiming is the key.","color":"dark_gray"}]] 32
item replace entity @s armor.head with blaze_powder[item_name={"text":"Eternal Flame","color":"dark_aqua","italic":false},lore=[{"text":"If it wasn't for that Fire Resistance...","color":"dark_gray"}],dyed_color=15660787,unbreakable={}]
item replace entity @s armor.legs with leather_leggings[item_name={"text":"Flaming Leggings","color":"dark_aqua","italic":false},lore=[{"text":"Highly flammable.","color":"dark_gray"}],dyed_color=16409374,unbreakable={}]
item replace entity @s armor.feet with leather_boots[item_name={"text":"Fiery Boots","color":"dark_aqua","italic":false},lore=[{"text":"Leaves a trail of sparks.","color":"dark_gray"}],dyed_color=16409374,unbreakable={}]