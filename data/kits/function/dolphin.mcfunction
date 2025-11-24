tag @s remove lobby.player
clear @s
tag @s add dolphin
effect give @s dolphins_grace 1000000 2 true
give @s stone_sword[item_name='{"text":"Stainless Dagger","color":"gold","italic":false}',lore=['{"text":"Stone has the tendency of being stainless.","color":"dark_gray"}'],unbreakable={}]
give @s cooked_beef[item_name='{"text":"Steak","color":"gold","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']]
item replace entity @s armor.head with leather_helmet[item_name='{"text":"Dolphin\'s Head","color":"gold","italic":false}',lore=['{"text":"No! It\'s NOT just a helmet!","color":"dark_gray"}'],dyed_color=10469845,unbreakable={},enchantments={respiration:3}]
item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Dolphin\'s Trousers","color":"gold","italic":false}',lore=['{"text":"It was either these or the orange ones.","color":"dark_gray"}'],dyed_color=10469845,unbreakable={},enchantments={protection:1}]
item replace entity @s armor.feet with leather_boots[item_name='{"text":"Dolphin\'s Tail","color":"gold","italic":false}',lore=['{"text":"Swim extremely fast.","color":"dark_gray"}'],dyed_color=10469845,unbreakable={},enchantments={depth_strider:1}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Dolphin ","color":"gold","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}