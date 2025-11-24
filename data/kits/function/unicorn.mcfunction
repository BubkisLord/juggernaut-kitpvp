tag @s remove lobby.player
clear @s
tag @s add unicorn
give @s iron_sword[item_name='{"text":"Dual-Edged Longsword","color":"gold","italic":false}',lore=['{"text":"Elegant, but razor-sharp.","color":"dark_gray"}'],unbreakable={}]
give @s cooked_beef[item_name='{"text":"Steak","color":"gold","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']] 16
item replace entity @s armor.head with end_rod[item_name='{"text":"Unicorn\'s Horn","color":"gold","italic":false}',lore=['{"text":"Sets the unicorn apart from horses.","color":"dark_gray"}'],unbreakable={}]
item replace entity @s armor.chest with elytra[item_name='{"text":"Elegant Wings","color":"gold","italic":false}',lore=['{"text":"Glide gracefully through the skies.","color":"dark_gray"}'],unbreakable={}]
item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Unicorn\'s Trousers","color":"gold","italic":false}',lore=['{"text":"Everyone needs some protection.","color":"dark_gray"}'],dyed_color=16777215,unbreakable={}]
item replace entity @s armor.feet with leather_boots[item_name='{"text":"Unicorn\'s Shoes","color":"gold","italic":false}',lore=['{"text":"Try to keep them clean.","color":"dark_gray"}'],dyed_color=16777215,unbreakable={}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Unicorn ","color":"gold","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}