tag @s remove lobby.player
clear @s
tag @s add warrior
give @s stone_sword[item_name={"text":"Warrior's Sword","color":"dark_green","italic":false},lore=[{"text":"A sturdy blade.","color":"dark_gray"}],unbreakable={},enchantments={sharpness:2}]
give @s cooked_beef[item_name={"text":"Steak","color":"dark_green","italic":false},lore=[{"text":"Eat to regenerate.","color":"dark_gray"}]] 16
item replace entity @s armor.head with leather_helmet[item_name={"text":"Warrior's Helmet","color":"dark_green","italic":false},lore=[{"text":"Yields decent protection.","color":"dark_gray"}],dyed_color=15660787,unbreakable={}]
item replace entity @s armor.chest with leather_chestplate[item_name={"text":"Warrior's Chestpiece","color":"dark_green","italic":false},lore=[{"text":"Keep yourself covered.","color":"dark_gray"}],dyed_color=15660787,unbreakable={}]
item replace entity @s armor.legs with iron_leggings[item_name={"text":"Warrior's Pants","color":"dark_green","italic":false},lore=[{"text":"Look, it's iron!","color":"dark_gray"}],unbreakable={}]
item replace entity @s armor.feet with iron_boots[item_name={"text":"Warrior's Boots","color":"dark_green","italic":false},lore=[{"text":"Yikes, they smell!","color":"dark_gray"}],unbreakable={}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Warrior ","color":"dark_green","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}