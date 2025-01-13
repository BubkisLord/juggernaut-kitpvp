tag @s remove lobby.player
clear @s
tag @s add sharpshooter
give @s bow[item_name='{"text":"Ancient Longbow","color":"dark_aqua","italic":false}',lore=['{"text":"A true masterpiece.","color":"dark_gray"}'],unbreakable={},hide_additional_tooltip={}]
give @s cooked_beef[item_name='{"text":"Steak","color":"dark_aqua","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']]
give @s arrow[item_name='{"text":"Feathered Arrow","color":"dark_aqua","italic":false}',lore=['{"text":"Aiming is the key.","color":"dark_gray"}']]
give @s tipped_arrow[potion_contents="minecraft:luck",item_name='{"text":"Lucky Arrow","color":"dark_aqua","italic":false}',lore=['{"text":"Bow must be fully drawn.","color":"dark_gray"}'],hide_additional_tooltip={}] 5
item replace entity @s armor.head with leather_helmet[item_name='{"text":"Sharpshooter\'s Hat","color":"dark_aqua","italic":false}',lore=['{"text":"Harder than it looks.","color":"dark_gray"}'],dyed_color=8261648,unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Fancy Pants","color":"dark_aqua","italic":false}',lore=['{"text":"Stolen from an Archer.","color":"dark_gray"}'],dyed_color=4598560,unbreakable={},hide_additional_tooltip={}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Sharpshooter ","color":"dark_aqua","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}