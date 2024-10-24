tag @s remove lobby.player
clear @s
tag @s add deflector
give @s blaze_rod[item_name='{"text":"Staff of Deflection","color":"dark_purple","italic":false}',lore=['{"text":"Takes a true master to wield.","color":"dark_gray"}'],attribute_modifiers=[{id:"minecraft:generic.attack_speed",amount:-2.0,operation:"add_value",type:"generic.attack_speed"}],hide_additional_tooltip={}]
give @s cooked_beef[item_name='{"text":"Steak","color":"dark_purple","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']]
item replace entity @s armor.head with leather_helmet[item_name='{"text":"Deflector\'s Hat","color":"dark_purple","italic":false}',lore=['{"text":"Keep your head cool and avoid the arrows.","color":"dark_gray"}'],dyed_color=15771709,unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.chest with chainmail_chestplate[item_name='{"text":"Sturdy Chainmail","color":"dark_purple","italic":false}',lore=['{"text":"Swords can still hit you.","color":"dark_gray"}'],unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Stolen Pants","color":"dark_purple","italic":false}',lore=['{"text":"Make sure to thank that Archer!","color":"dark_gray"}'],dyed_color=4598560,unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.feet with leather_boots[item_name='{"text":"Sturdy Boots","color":"dark_purple","italic":false}',lore=['{"text":"Great for all types of terrain!","color":"dark_gray"}'],dyed_color=4011822,unbreakable={},hide_additional_tooltip={}]
tp @s @e[tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Deflector ","color":"dark_purple","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}