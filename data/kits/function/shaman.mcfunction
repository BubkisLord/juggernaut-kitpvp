tag @s remove lobby.player
clear @s
tag @s add shaman
give @s jungle_sapling[item_name='{"text":"Nature\'s Wrath","color":"dark_purple","italic":false}',lore=['{"text":"A sapling? What do you mean?","color":"dark_gray"}'],enchantments={sharpness:6},attribute_modifiers=[{id:"minecraft:generic.attack_speed",amount:-2.0,operation:"add_value",type:"generic.attack_speed"}],hide_additional_tooltip={}]
give @s blaze_powder[item_name='{"text":"Eternal Flame","color":"dark_purple","italic":false}',lore=['{"text":"They better hope there\'s water nearby.","color":"dark_gray"}'],enchantments={fire_aspect:255},hide_additional_tooltip={}]
give @s cooked_beef[item_name='{"text":"Steak","color":"dark_purple","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']]
item replace entity @s weapon.offhand with totem_of_undying[item_name='{"text":"Totemic Safeguard","color":"dark_purple","italic":false}',lore=['{"text":"Watch that Assassin fail to kill you!","color":"dark_gray"}'],unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.head with light_blue_stained_glass[item_name='{"text":"Bubble of Breathing","color":"dark_purple","italic":false}',lore=['{"text":"Allows you to breathe underwater.","color":"dark_gray"}'],unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.chest with leather_chestplate[item_name='{"text":"Tunic of Wind","color":"dark_purple","italic":false}',lore=['{"text":"Made from breathable leather.","color":"dark_gray"}'],dyed_color=3912173,unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Fireproof Pants","color":"dark_purple","italic":false}',lore=['{"text":"Stay strong, even in lava!","color":"dark_gray"}'],dyed_color=3912173,unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.feet with diamond_boots[item_name='{"text":"Waterproof Boots","color":"dark_purple","italic":false}',lore=['{"text":"Swim faster than a shark!","color":"dark_gray"}'],unbreakable={},hide_additional_tooltip={}]
tp @s @e[tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Shaman ","color":"dark_purple","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}