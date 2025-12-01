tag @s remove lobby.player
clear @s
tag @s add viking
give @s iron_axe[item_name={"text":"Nordic Battleaxe","color":"dark_green","italic":false},lore=[{"text":"Hit them hard.","color":"dark_gray"}],unbreakable={}]
give @s cooked_beef[item_name={"text":"Steak","color":"dark_green","italic":false},lore=[{"text":"Eat to regenerate.","color":"dark_gray"}]] 16
item replace entity @s weapon.offhand with shield[base_color="brown",banner_patterns=[{color:"cyan",pattern:"minecraft:circle"}],item_name={"text":"Classic Buckler","color":"dark_green","italic":false},lore=[{"text":"Ehh, it's not really round...","color":"dark_gray"}],unbreakable={}]
item replace entity @s armor.head with iron_helmet[item_name={"text":"Viking's Helmet","color":"dark_green","italic":false},lore=[{"text":"They. Did. Not. Have. Horns.","color":"dark_gray"}],unbreakable={}]
item replace entity @s armor.chest with leather_chestplate[item_name={"text":"Rugged Shirt","color":"dark_green","italic":false},lore=[{"text":"The viking's favourite.","color":"dark_gray"}],dyed_color=6110759,unbreakable={}]
item replace entity @s armor.legs with leather_leggings[item_name={"text":"Old Pants","color":"dark_green","italic":false},lore=[{"text":"Someone needs to wash these...","color":"dark_gray"}],dyed_color=6110759,unbreakable={}]
item replace entity @s armor.feet with leather_boots[item_name={"text":"Black-ish Boots","color":"dark_green","italic":false},lore=[{"text":"These are quite pretty.","color":"dark_gray"}],dyed_color=2629658,unbreakable={}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Viking ","color":"dark_green","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}