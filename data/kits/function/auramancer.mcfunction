tag @s remove lobby.player
clear @s
tag @s add auramancer
give @s blaze_rod[item_name={"text":"Staff of the Auramancer","color":"dark_purple","italic":false},lore=[{"text":"A weak melee weapon.","color":"dark_gray"}],enchantments={sharpness:5}] 1
give @s turtle_scute[item_name={"text":"Aura of Protection","color":"dark_purple","italic":false},lore=[{"text":"Hold in off-hand to increase your defenses.","color":"dark_gray"}]] 1
give @s cobweb[item_name={"text":"Aura of Confusion","color":"dark_purple","italic":false},lore=[{"text":"Hold in off-hand to give nearby enemies debuffs.","color":"dark_gray"}]] 1
give @s wither_rose[item_name={"text":"Aura of Despair","color":"dark_purple","italic":false},lore=[{"text":"Hold in off-hand to damage nearby enemies.","color":"dark_gray"}]] 1
give @s bell[item_name={"text":"Aura of Vision","color":"dark_purple","italic":false},lore=[{"text":"Hold in off-hand to reveal nearby enemies.","color":"dark_gray"}]] 1
give @s cooked_beef[item_name={"text":"Steak","color":"dark_purple","italic":false},lore=[{"text":"Eat to regenerate.","color":"dark_gray"}]] 16
item replace entity @s armor.head with leather_helmet[item_name={"text":"Auramancer's Hat","color":"dark_purple","italic":false},lore=[{"text":"Makes the bearer immune to enemy auras.","color":"dark_gray"}],dyed_color=5317223,unbreakable={}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Auramancer ","color":"dark_purple","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}