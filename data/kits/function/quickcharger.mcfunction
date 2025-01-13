tag @s remove lobby.player
clear @s
tag @s add quickcharger
give @s crossbow[item_name='{"text":"Ol\' Betsy","color":"dark_aqua","italic":false}',lore=['{"text":"A trusty weapon.","color":"dark_gray"}'],unbreakable={},enchantments={quick_charge:2},hide_additional_tooltip={}]
give @s cooked_beef[item_name='{"text":"Steak","color":"dark_aqua","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']]
give @s arrow[item_name='{"text":"Feathered Arrow","color":"dark_aqua","italic":false}',lore=['{"text":"Aiming is the key.","color":"dark_gray"}']] 64
item replace entity @s armor.chest with leather_chestplate[item_name='{"text":"Quickcharger\'s Tunic","color":"dark_aqua","italic":false}',lore=['{"text":"What a colour!","color":"dark_gray"}'],dyed_color=2575913,unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Quickcharger\'s Pants","color":"dark_aqua","italic":false}',lore=['{"text":"Very muddy, sadly.","color":"dark_gray"}'],dyed_color=2575913,unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.feet with leather_boots[item_name='{"text":"Smelly Boots","color":"dark_aqua","italic":false}',lore=['{"text":"Eww.","color":"dark_gray"}'],dyed_color=2575913,unbreakable={},hide_additional_tooltip={}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Quickcharger ","color":"dark_aqua","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}