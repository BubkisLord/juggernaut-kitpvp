tag @s remove lobby.player
clear @s
tag @s add ghost
effect give @s minecraft:invisibility 1000000 100 true
give @s diamond_sword[item_name='{"text":"Diamond Blade","color":"dark_purple","italic":false}',lore=['{"text":"Dual-edged and razor sharp.","color":"dark_gray"}'],unbreakable={}]
give @s cooked_beef[item_name='{"text":"Steak","color":"dark_purple","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Ghost ","color":"dark_purple","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}