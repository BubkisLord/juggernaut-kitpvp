tag @s remove lobby.player
clear @s
tag @s add cactus
give @s stone_sword[item_name='{"text":"Stone Sabre","color":"dark_green","italic":false}',lore=['{"text":"A trusty weapon.","color":"dark_gray"}'],unbreakable={},hide_additional_tooltip={}]

give @s cooked_beef[item_name='{"text":"Steak","color":"dark_green","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']] 16

item replace entity @s armor.head with cactus[item_name='{"text":"Cactus Hat","color":"dark_green","italic":false}',lore=['{"text":"It\'s actually not a hat.","color":"dark_gray"}'],dyed_color=1404953,unbreakable={},hide_additional_tooltip={}]

item replace entity @s armor.chest with leather_chestplate[item_name='{"text":"Chestpiece with Needles","color":"dark_green","italic":false}',lore=['{"text":"Don\'t touch them.","color":"dark_gray"}'],dyed_color=1404953,unbreakable={},enchantments={thorns:3},hide_additional_tooltip={}]

item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Cactus Leggings","color":"dark_green","italic":false}',lore=['{"text":"Ouch! These needles hurt!","color":"dark_gray"}'],dyed_color=1404953,unbreakable={},enchantments={thorns:3},hide_additional_tooltip={}]

item replace entity @s armor.feet with leather_boots[item_name='{"text":"Poorly designed Boots","color":"dark_green","italic":false}',lore=['{"text":"Why would you put needles on the INSIDE?!","color":"dark_gray"}'],dyed_color=1404953,unbreakable={},enchantments={thorns:3},hide_additional_tooltip={}]

tp @s @e[tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Cactus ","color":"dark_green","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}