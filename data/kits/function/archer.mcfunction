tag @s remove lobby.player
clear @s
tag @s add archer
give @s golden_sword[item_name='{"text":"Shiny Dagger","color":"dark_aqua","italic":false}',lore=['{"text":"Better than nothing.","color":"dark_gray"}'],unbreakable={}]

give @s bow[item_name='{"text":"Archer\'s Longbow","color":"dark_aqua","italic":false}',lore=['{"text":"Try not to shoot yourself.","color":"dark_gray"}'],unbreakable={}]

give @s cooked_beef[item_name='{"text":"Steak","color":"dark_aqua","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']] 16

give @s arrow[item_name='{"text":"Feathered Arrow","color":"dark_aqua","italic":false}',lore=['{"text":"Aiming is the key.","color":"dark_gray"}']] 32

item replace entity @s armor.head with leather_helmet[item_name='{"text":"Archer\'s Hat","color":"dark_aqua","italic":false}',lore=['{"text":"Harder than it looks.","color":"dark_gray"}'],dyed_color=16776442,unbreakable={}]

item replace entity @s armor.chest with leather_chestplate[item_name='{"text":"Fancy Chestpiece","color":"dark_aqua","italic":false}',lore=['{"text":"What was the designer thinking..?","color":"dark_gray"}'],dyed_color=14204813,unbreakable={}]

item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Fancy Pants","color":"dark_aqua","italic":false}',lore=['{"text":"What a colour!","color":"dark_gray"}'],dyed_color=4598560,unbreakable={}]

item replace entity @s armor.feet with leather_boots[item_name='{"text":"Archer\'s Boots","color":"dark_aqua","italic":false}',lore=['{"text":"Genuine leather.","color":"dark_gray"}'],dyed_color=4598560,unbreakable={}]

tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Archer ","color":"dark_aqua","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}