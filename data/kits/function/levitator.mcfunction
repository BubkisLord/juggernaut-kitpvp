tag @s remove lobby.player
clear @s
tag @s add levitator
give @s iron_sword[item_name='{"text":"Steel Blade","color":"dark_purple","italic":false}',lore=['{"text":"Weighs surprisingly little.","color":"dark_gray"}'],unbreakable={},enchantments={sharpness:1}]
item replace entity @s hotbar.1 with firework_rocket[item_name='{"text":"Self-Levitate","color":"dark_purple","italic":false}',lore=['{"text":"Hold to fly upwards. Consumes rockets.","color":"dark_gray"}'],unbreakable={}] 25
item replace entity @s hotbar.2 with phantom_membrane[item_name='{"text":"Charm of Floatation","color":"dark_purple","italic":false}',lore=['{"text":"Stolen from a Divinity. Hold to fall slowly.","color":"dark_gray"}'],unbreakable={}]
item replace entity @s hotbar.3 with flower_banner_pattern[item_name='{"text":"Levitation Scroll","color":"dark_purple","italic":false}',lore=['{"text":"Drop to send everyone nearby flying.","color":"dark_gray"}'],unbreakable={}]
give @s cooked_beef[item_name='{"text":"Steak","color":"dark_purple","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']]
item replace entity @s armor.chest with leather_chestplate[item_name='{"text":"Levitator\'s Tunic","color":"dark_purple","italic":false}',lore=['{"text":"Armour of standard quality.","color":"dark_gray"}'],dyed_color=16777215,unbreakable={}]
item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Levitator\'s Pants","color":"dark_purple","italic":false}',lore=['{"text":"Good for high altitudes.","color":"dark_gray"}'],dyed_color=16777215,unbreakable={}]
item replace entity @s armor.feet with leather_boots[item_name='{"text":"Levitator\'s Sandals","color":"dark_purple","italic":false}',lore=['{"text":"No, they\'re not winged, sadly.","color":"dark_gray"}'],dyed_color=16777215,unbreakable={}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Levitator ","color":"dark_purple","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}