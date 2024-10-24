tag @s remove lobby.player
clear @s
tag @s add ambusher
give @s iron_sword[item_name='{"text":"Steel Dagger","color":"dark_purple","italic":false}',lore=['{"text":"Crafted by an expert blacksmith.","color":"dark_gray"}'],unbreakable={},hide_additional_tooltip={}]

item replace entity @s hotbar.1 with nether_star[item_name='{"text":"Ambush Enemy","color":"dark_purple","italic":false}',lore=['{"text":"Drop to be teleported to a random enemy.","color":"dark_gray"}']]

give @s cooked_beef[item_name='{"text":"Steak","color":"dark_purple","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']] 16

item replace entity @s armor.chest with leather_chestplate[item_name='{"text":"Ambusher\'s Cloak","color":"dark_purple","italic":false}',lore=['{"text":"Allows for easy concealment.","color":"dark_gray"}'],dyed_color=2168370,unbreakable={},hide_additional_tooltip={}]

item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Ambusher\'s Pants","color":"dark_purple","italic":false}',lore=['{"text":"Make sure you can see yourself!","color":"dark_gray"}'],dyed_color=2168370,unbreakable={},hide_additional_tooltip={}]

item replace entity @s armor.feet with leather_boots[item_name='{"text":"Ambusher\'s Shoes","color":"dark_purple","italic":false}',lore=['{"text":"Unbelievably silent.","color":"dark_gray"}'],dyed_color=2168370,unbreakable={},hide_additional_tooltip={}]

tp @s @e[tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Ambusher ","color":"dark_purple","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}