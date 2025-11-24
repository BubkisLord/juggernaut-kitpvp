tag @s remove lobby.player
clear @s
tag @s add ninja
effect give @s speed 1000000 2 true
effect give @s jump_boost 1000000 1 true
give @s iron_sword[item_name='{"text":"Ninja\'s Katana","color":"gold","italic":false}',lore=['{"text":"The creation of an expert blacksmith.","color":"dark_gray"}'],unbreakable={}]
give @s firework_star[item_name='{"text":"Orb of Concealment","color":"gold","italic":false}',lore=['{"text":"Drop for an easy getaway.","color":"dark_gray"}']] 5
give @s cooked_beef[item_name='{"text":"Steak","color":"gold","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']]
item replace entity @s armor.head with leather_helmet[item_name='{"text":"Ninja\'s Suit","color":"gold","italic":false}',lore=['{"text":"The ninja uses the element of surprise.","color":"dark_gray"}'],dyed_color=1646383,unbreakable={}]
item replace entity @s armor.chest with leather_chestplate[item_name='{"text":"Ninja\'s Suit","color":"gold","italic":false}',lore=['{"text":"Stealth over protection.","color":"dark_gray"}'],dyed_color=1646383,unbreakable={}]
item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Ninja\'s Suit","color":"gold","italic":false}',lore=['{"text":"Hard to spot during the night.","color":"dark_gray"}'],dyed_color=1646383,unbreakable={}]
item replace entity @s armor.feet with leather_boots[item_name='{"text":"Ninja\'s Suit","color":"gold","italic":false}',lore=['{"text":"Swift and silent.","color":"dark_gray"}'],dyed_color=1646383,unbreakable={},enchantments={feather_falling:10}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Ninja ","color":"gold","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}