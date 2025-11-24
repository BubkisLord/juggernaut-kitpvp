tag @s[nbt={Inventory:[{"id":"minecraft:diamond_sword"}]}] add hasBlade
scoreboard players set @s[tag=!hasBlade] assassinActivate 0
clear @s
give @s golden_sword[item_name='{"text":"Golden Dagger","color":"dark_green","italic":false}',lore=['{"text":"Sounds better than it is.","color":"dark_gray"}'],unbreakable={}]
give @s[tag=!hasBlade] prismarine_shard[item_name='{"text":"Ancient Relic","color":"dark_green","italic":false}',lore=['{"text":"The key to the Ancient Blade.","color":"dark_gray"}'],enchantments={unbreaking:1}]
give @s[tag=hasBlade] diamond_sword[item_name='{"text":"Ancient Blade","color":"dark_green","italic":false}',lore=['{"text":"Just about to break.","color":"dark_gray"}'],enchantments={sharpness:255},damage=1560]
give @s cooked_beef[item_name='{"text":"Steak","color":"dark_green","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']] 16
item replace entity @s armor.chest with leather_chestplate[item_name='{"text":"Assassin\'s Shirt","color":"dark_green","italic":false}',lore=['{"text":"A nice, dark colour.","color":"dark_gray"}'],dyed_color=5508375,unbreakable={}]
item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Assassin\'s Pants","color":"dark_green","italic":false}',lore=['{"text":"For hiding in the shadows.","color":"dark_gray"}'],dyed_color=5508375,unbreakable={}]
item replace entity @s armor.feet with leather_boots[item_name='{"text":"Assassin\'s Boots","color":"dark_green","italic":false}',lore=['{"text":"Swift and silent.","color":"dark_gray"}'],dyed_color=5508375,unbreakable={}]
tag @s remove hasBlade