clear @s
effect give @s absorption 1000000 4 true
give @s wooden_sword[item_name='{"text":"Improvised Weapon","color":"dark_green","italic":false}',lore=['{"text":"It deals a surprising amount of damage.","color":"dark_gray"}'],unbreakable={},enchantments={sharpness:2}]
give @s cooked_beef[item_name='{"text":"Steak","color":"dark_green","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']] 16
item replace entity @s armor.head with zombie_head[item_name='{"text":"Zombie Head","color":"dark_green","italic":false}',lore=['{"text":"Take it off if you don\'t like it...","color":"dark_gray"}'],unbreakable={}]
item replace entity @s armor.chest with leather_chestplate[item_name='{"text":"Old Shirt","color":"dark_green","italic":false}',lore=['{"text":"Yields a little protection.","color":"dark_gray"}'],dyed_color=2553845,unbreakable={}]
item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Classic Jeans","color":"dark_green","italic":false}',lore=['{"text":"The one and only pair.","color":"dark_gray"}'],dyed_color=3954156,unbreakable={}]
item replace entity @s armor.feet with leather_boots[item_name='{"text":"Zombie\'s Boots","color":"dark_green","italic":false}',lore=['{"text":"In a classy, grey colour.","color":"dark_gray"}'],dyed_color=4671303,unbreakable={}]