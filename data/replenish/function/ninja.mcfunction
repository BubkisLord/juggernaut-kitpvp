clear @s
effect give @s speed 1000000 2 true
effect give @s jump_boost 1000000 1 true
give @s iron_sword[item_name='{"text":"Ninja\'s Katana","color":"gold","italic":false}',lore=['{"text":"The creation of an expert blacksmith.","color":"dark_gray"}'],unbreakable={},hide_additional_tooltip={}]
give @s firework_star[item_name='{"text":"Orb of Concealment","color":"gold","italic":false}',lore=['{"text":"Drop for an easy getaway.","color":"dark_gray"}']] 5
give @s cooked_beef[item_name='{"text":"Steak","color":"gold","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']] 16
item replace entity @s armor.head with leather_helmet[item_name='{"text":"Ninja\'s Suit","color":"gold","italic":false}',lore=['{"text":"The ninja uses the element of surprise.","color":"dark_gray"}'],dyed_color=1646383,unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.chest with leather_chestplate[item_name='{"text":"Ninja\'s Suit","color":"gold","italic":false}',lore=['{"text":"Stealth over protection.","color":"dark_gray"}'],dyed_color=1646383,unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Ninja\'s Suit","color":"gold","italic":false}',lore=['{"text":"Hard to spot during the night.","color":"dark_gray"}'],dyed_color=1646383,unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.feet with leather_boots[item_name='{"text":"Ninja\'s Suit","color":"gold","italic":false}',lore=['{"text":"Swift and silent.","color":"dark_gray"}'],dyed_color=1646383,unbreakable={},enchantments={feather_falling:10},hide_additional_tooltip={}]