tag @s remove lobby.player
clear @s
tag @s add defender
give @s wooden_sword[item_name='{"text":"Defender\'s \'Sword\'","color":"dark_green","italic":false}',lore=['{"text":"\'Stick\' would be a better word.","color":"dark_gray"}'],unbreakable={},hide_additional_tooltip={}]
item replace entity @s hotbar.1 with brick[item_name='{"text":"Reinforce","color":"dark_green","italic":false}',lore=['{"text":"Temporarily increases defenses.","color":"dark_gray"}']] 3
give @s cooked_beef[item_name='{"text":"Steak","color":"dark_green","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']]
item replace entity @s armor.head with iron_helmet[item_name='{"text":"Defender\'s Helmet","color":"dark_green","italic":false}',lore=['{"text":"Withstands the mightiest of blows. Almost.","color":"dark_gray"}'],unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.chest with chainmail_chestplate[item_name='{"text":"Defender\'s Chainmail","color":"dark_green","italic":false}',lore=['{"text":"We were out of iron armour.","color":"dark_gray"}'],unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.legs with iron_leggings[item_name='{"text":"Steel Leggings","color":"dark_green","italic":false}',lore=['{"text":"Steel is all you need.","color":"dark_gray"}'],unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.feet with iron_boots[item_name='{"text":"Steel Boots","color":"dark_green","italic":false}',lore=['{"text":"Very heavy but pretty cool.","color":"dark_gray"}'],unbreakable={},hide_additional_tooltip={}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Defender ","color":"dark_green","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}