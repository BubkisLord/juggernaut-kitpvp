tag @s remove lobby.player
clear @s
tag @s add farmer
give @s iron_hoe[item_name='{"text":"Steel Hoe","color":"dark_green","italic":false}',lore=['{"text":"The sharpest tool in the shed.","color":"dark_gray"}'],unbreakable={},enchantments={sharpness:2}]
give @s cooked_beef[item_name='{"text":"Steak","color":"dark_green","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']]
item replace entity @s armor.head with leather_helmet[item_name='{"text":"Straw Hat","color":"dark_green","italic":false}',lore=['{"text":"Stereotypical? You think?","color":"dark_gray"}'],dyed_color=13874947,unbreakable={}]
item replace entity @s armor.chest with leather_chestplate[item_name='{"text":"Farmer\'s Shirt","color":"dark_green","italic":false}',lore=['{"text":"Pretty bland, but better than nothing.","color":"dark_gray"}'],dyed_color=7750706,unbreakable={}]
item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Farmer\'s Pants","color":"dark_green","italic":false}',lore=['{"text":"Standard jeans, a bit old.","color":"dark_gray"}'],dyed_color=3094649,unbreakable={}]
item replace entity @s armor.feet with leather_boots[item_name='{"text":"Farmer\'s Boots","color":"dark_green","italic":false}',lore=['{"text":"What an unpleasant smell!","color":"dark_gray"}'],dyed_color=1775379,unbreakable={}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Farmer ","color":"dark_green","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}