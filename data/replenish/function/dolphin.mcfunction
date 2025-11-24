clear @s
effect give @s dolphins_grace 1000000 2 true
give @s stone_sword[item_name='{"text":"Stainless Dagger","color":"gold","italic":false}',lore=['{"text":"Stone has the tendency of being stainless.","color":"dark_gray"}'],unbreakable={}]
give @s cooked_beef[item_name='{"text":"Steak","color":"gold","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']] 16
item replace entity @s armor.head with leather_helmet[item_name='{"text":"Dolphin\'s Head","color":"gold","italic":false}',lore=['{"text":"No! It\'s NOT just a helmet!","color":"dark_gray"}'],dyed_color=10469845,unbreakable={},enchantments={respiration:3}]
item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Dolphin\'s Trousers","color":"gold","italic":false}',lore=['{"text":"It was either these or the orange ones.","color":"dark_gray"}'],dyed_color=10469845,unbreakable={},enchantments={protection:1}]
item replace entity @s armor.feet with leather_boots[item_name='{"text":"Dolphin\'s Tail","color":"gold","italic":false}',lore=['{"text":"Swim extremely fast.","color":"dark_gray"}'],dyed_color=10469845,unbreakable={},enchantments={depth_strider:1}]