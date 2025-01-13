tag @s remove lobby.player
clear @s
tag @s add pirate
give @s stone_sword[item_name='{"text":"Stone Cutlass","color":"dark_aqua","italic":false}',lore=['{"text":"A pretty decent weapon.","color":"dark_gray"}'],unbreakable={},enchantments={sharpness:1},hide_additional_tooltip={}]
give @s golden_apple[item_name='{"text":"Magical Apple","color":"dark_aqua","italic":false}',lore=['{"text":"Stolen from a mighty wizard.","color":"dark_gray"}']] 3
give @s cooked_beef[item_name='{"text":"Steak","color":"dark_aqua","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']] 64
item replace entity @s armor.chest with leather_chestplate[item_name='{"text":"Captain\'s Robes","color":"dark_aqua","italic":false}',lore=['{"text":"It doesn\'t get any fancier.","color":"dark_gray"}'],dyed_color=12596272,unbreakable={},hide_additional_tooltip={}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Pirate ","color":"dark_aqua","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}