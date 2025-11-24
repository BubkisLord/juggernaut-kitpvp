clear @s
give @s wooden_sword[item_name='{"text":"Defender\'s \'Sword\'","color":"dark_green","italic":false}',lore=['{"text":"\'Stick\' would be a better word.","color":"dark_gray"}'],unbreakable={}]
item replace entity @s hotbar.1 with brick[item_name='{"text":"Reinforce","color":"dark_green","italic":false}',lore=['{"text":"Temporarily increases defenses.","color":"dark_gray"}']] 3
give @s cooked_beef[item_name='{"text":"Steak","color":"dark_green","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']] 16
item replace entity @s armor.head with iron_helmet[item_name='{"text":"Defender\'s Helmet","color":"dark_green","italic":false}',lore=['{"text":"Withstands the mightiest of blows. Almost.","color":"dark_gray"}'],unbreakable={}]
item replace entity @s armor.chest with chainmail_chestplate[item_name='{"text":"Defender\'s Chainmail","color":"dark_green","italic":false}',lore=['{"text":"We were out of iron armour.","color":"dark_gray"}'],unbreakable={}]
item replace entity @s armor.legs with iron_leggings[item_name='{"text":"Steel Leggings","color":"dark_green","italic":false}',lore=['{"text":"Steel is all you need.","color":"dark_gray"}'],unbreakable={}]
item replace entity @s armor.feet with iron_boots[item_name='{"text":"Steel Boots","color":"dark_green","italic":false}',lore=['{"text":"Very heavy but pretty cool.","color":"dark_gray"}'],unbreakable={}]