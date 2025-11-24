tag @s remove lobby.player
clear @s
tag @s add assassin
give @s golden_sword[item_name='{"text":"Golden Dagger","color":"dark_green","italic":false}',lore=['{"text":"Sounds better than it is.","color":"dark_gray"}'],unbreakable={}]

give @s prismarine_shard[item_name='{"text":"Ancient Relic","color":"dark_green","italic":false}',lore=['{"text":"The key to the Ancient Blade.","color":"dark_gray"}'],enchantments={unbreaking:1}]

give @s cooked_beef[item_name='{"text":"Steak","color":"dark_green","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']] 16

item replace entity @s armor.chest with leather_chestplate[item_name='{"text":"Assassin\'s Shirt","color":"dark_green","italic":false}',lore=['{"text":"A nice, dark colour.","color":"dark_gray"}'],dyed_color=5508375,unbreakable={}]

item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Assassin\'s Pants","color":"dark_green","italic":false}',lore=['{"text":"For hiding in the shadows.","color":"dark_gray"}'],dyed_color=5508375,unbreakable={}]

item replace entity @s armor.feet with leather_boots[item_name='{"text":"Assassin\'s Boots","color":"dark_green","italic":false}',lore=['{"text":"Swift and silent.","color":"dark_gray"}'],dyed_color=5508375,unbreakable={}]

tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Assassin ","color":"dark_green","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}