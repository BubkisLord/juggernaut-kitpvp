tag @s remove lobby.player
clear @s
tag @s add cheetah
give @s pumpkin_seeds[item_name={"text":"Claws","color":"gold","italic":false},lore=[{"text":"Don't get too close.","color":"dark_gray"}],enchantments={sharpness:5}] 1
item replace entity @s hotbar.1 with light_blue_dye[item_name={"text":"Speed Boost","color":"gold","italic":false},lore=[{"text":"Drop to enter sprinting mode.","color":"dark_gray"}]]
give @s cooked_beef[item_name={"text":"Steak","color":"gold","italic":false},lore=[{"text":"Eat to regenerate.","color":"dark_gray"}]]
item replace entity @s armor.head with leather_helmet[item_name={"text":"Cheetah's Hat","color":"gold","italic":false},lore=[{"text":"ZOOOMMMM!!!","color":"dark_gray"}],dyed_color=13812827,unbreakable={}]
item replace entity @s armor.chest with leather_chestplate[item_name={"text":"Cheetah's Chestpiece","color":"gold","italic":false},lore=[{"text":"Breathable leather. If that's a thing.","color":"dark_gray"}],dyed_color=13812827,unbreakable={}]
item replace entity @s armor.legs with leather_leggings[item_name={"text":"Pants for Running","color":"gold","italic":false},lore=[{"text":"Great for sprinting around.","color":"dark_gray"}],dyed_color=13812827,unbreakable={}]
item replace entity @s armor.feet with leather_boots[item_name={"text":"Fancy Sneakers","color":"gold","italic":false},lore=[{"text":"Outrun them!","color":"dark_gray"}],dyed_color=13812827,unbreakable={}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Cheetah ","color":"gold","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}