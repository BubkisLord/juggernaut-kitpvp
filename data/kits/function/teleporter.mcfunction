tag @s remove lobby.player
clear @s
tag @s add teleporter
give @s iron_sword[item_name={"text":"Teleporter's Sword","color":"dark_purple","italic":false},lore=[{"text":"A weapon of decent quality.","color":"dark_gray"}],unbreakable={}]
give @s cooked_beef[item_name={"text":"Steak","color":"dark_purple","italic":false},lore=[{"text":"Eat to regenerate.","color":"dark_gray"}]] 32
give @s ender_pearl[item_name={"text":"Orb of Teleportation","color":"dark_purple","italic":false},lore=[{"text":"The best way to get around.","color":"dark_gray"}]] 16
give @s ender_pearl[item_name={"text":"Orb of Teleportation","color":"dark_purple","italic":false},lore=[{"text":"The more the merrier.","color":"dark_gray"}]] 16
item replace entity @s armor.chest with leather_chestplate[item_name={"text":"Teleporter's Chestpiece","color":"dark_purple","italic":false},lore=[{"text":"The sleeves got stuck in a portal once.","color":"dark_gray"}],dyed_color=1907483,unbreakable={}]
item replace entity @s armor.legs with leather_leggings[item_name={"text":"Teleporter's Pants","color":"dark_purple","italic":false},lore=[{"text":"These must've been expensive.","color":"dark_gray"}],dyed_color=1907483,unbreakable={}]
item replace entity @s armor.feet with leather_boots[item_name={"text":"Teleporter's Boots","color":"dark_purple","italic":false},lore=[{"text":"Not waterproof, sadly.","color":"dark_gray"}],dyed_color=1907483,unbreakable={},enchantments={feather_falling:10}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Teleporter ","color":"dark_purple","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}