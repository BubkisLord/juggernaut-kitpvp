tag @s remove lobby.player
clear @s
tag @s add shark
effect give @s water_breathing 1000000 100 true
give @s iron_nugget[item_name={"text":"Shark's Tooth","color":"gold","italic":false},lore=[{"text":"Extremely sharp.","color":"dark_gray"}],unbreakable={},enchantments={sharpness:6}]
give @s cooked_beef[item_name={"text":"Steak","color":"gold","italic":false},lore=[{"text":"Eat to regenerate.","color":"dark_gray"}]]
item replace entity @s armor.head with leather_helmet[item_name={"text":"Shark Head","color":"gold","italic":false},lore=[{"text":"Admittedly, it looks like a helmet.","color":"dark_gray"}],dyed_color=10067885,unbreakable={}]
item replace entity @s armor.chest with leather_chestplate[item_name={"text":"Shark's Chestpiece","color":"gold","italic":false},lore=[{"text":"Sharks actually wear armour.","color":"dark_gray"}],dyed_color=10067885,unbreakable={}]
item replace entity @s armor.legs with leather_leggings[item_name={"text":"Shark's Pants","color":"gold","italic":false},lore=[{"text":"Perfect for underwater adventures.","color":"dark_gray"}],dyed_color=10067885,unbreakable={}]
item replace entity @s armor.feet with leather_boots[item_name={"text":"Shark's Boots","color":"gold","italic":false},lore=[{"text":"Increases swim speed.","color":"dark_gray"}],dyed_color=10067885,unbreakable={},enchantments={depth_strider:5}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Shark ","color":"gold","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}