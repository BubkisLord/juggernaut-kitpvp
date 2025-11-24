tag @s remove lobby.player
clear @s
tag @s add hunter
give @s bow[item_name='{"text":"Hunting Bow","color":"dark_aqua","italic":false}',lore=['{"text":"Requires extraordinary power to pull.","color":"dark_gray"}'],unbreakable={}]
give @s cooked_beef[item_name='{"text":"Steak","color":"dark_aqua","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']]
give @s spectral_arrow[item_name='{"text":"Arrow of Sight","color":"dark_aqua","italic":false}',lore=['{"text":"You will never lose a target with these.","color":"dark_gray"}']]
item replace entity @s armor.head with leather_helmet[item_name='{"text":"Hunter\'s Hat","color":"dark_aqua","italic":false}',lore=['{"text":"Even has an alliteration.","color":"dark_gray"}'],dyed_color=1930517,unbreakable={}]
item replace entity @s armor.chest with leather_chestplate[item_name='{"text":"Stinky Tunic","color":"dark_aqua","italic":false}',lore=['{"text":"Yuck! Disgusting!","color":"dark_gray"}'],dyed_color=1930517,unbreakable={}]
item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Bear Hide Trousers","color":"dark_aqua","italic":false}',lore=['{"text":"These weren\'t easy to make.","color":"dark_gray"}'],dyed_color=1930517,unbreakable={}]
item replace entity @s armor.feet with leather_boots[item_name='{"text":"Swiftstep Boots","color":"dark_aqua","italic":false}',lore=['{"text":"Never breaks a branch.","color":"dark_gray"}'],dyed_color=1930517,unbreakable={}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Hunter ","color":"dark_aqua","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}