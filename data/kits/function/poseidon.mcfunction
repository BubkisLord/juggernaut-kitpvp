tag @s remove lobby.player
clear @s
tag @s add poseidon
effect give @s minecraft:water_breathing 1000000 100 true
give @s trident[item_name='{"text":"Poseidon\'s Trident","color":"dark_aqua","italic":false}',lore=['{"text":"Good for melee. Good for throwing.","color":"dark_gray"}'],unbreakable={},enchantments={loyalty:7}]
give @s cooked_beef[item_name='{"text":"Steak","color":"green","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']]
item replace entity @s armor.chest with leather_chestplate[item_name='{"text":"Poseidon\'s Tunic","color":"dark_aqua","italic":false}',lore=['{"text":"Keep yourself covered.","color":"dark_gray"}'],dyed_color=5345997,unbreakable={}]
item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Poseidon\'s Leggings","color":"dark_aqua","italic":false}',lore=['{"text":"Waterproof. Or something.","color":"dark_gray"}'],dyed_color=5345997,unbreakable={}]
item replace entity @s armor.feet with leather_boots[item_name='{"text":"Swimming Boots","color":"dark_aqua","italic":false}',lore=['{"text":"Drastically increases swim speed.","color":"dark_gray"}'],dyed_color=5345997,unbreakable={},enchantments={depth_strider:5}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Poseidon ","color":"dark_aqua","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}