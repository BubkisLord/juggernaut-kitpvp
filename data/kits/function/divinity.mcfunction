tag @s remove lobby.player
clear @s
tag @s add divinity
give @s bow[item_name={"text":"Divine Bow","color":"dark_aqua","italic":false},lore=[{"text":"Conjured by the powers of magic.","color":"dark_gray"}],unbreakable={}]
item replace entity @s hotbar.1 with feather[item_name={"text":"Ascension","color":"dark_aqua","italic":false},lore=[{"text":"Drop to soar upwards.","color":"dark_gray"}]] 2
give @s phantom_membrane[item_name={"text":"Charm of Floatation","color":"dark_aqua","italic":false},lore=[{"text":"Hold to fall more slowly.","color":"dark_gray"}]]
give @s cooked_beef[item_name={"text":"Steak","color":"dark_aqua","italic":false},lore=[{"text":"Eat to regenerate.","color":"dark_gray"}]]
give @s spectral_arrow[item_name={"text":"Arrow of Might","color":"dark_aqua","italic":false},lore=[{"text":"The strongest in the land.","color":"dark_gray"}]] 128
item replace entity @s armor.head with white_banner[item_name={"text":"Banner of Justice","color":"dark_aqua","italic":false},lore=[{"text":"Evildoers shake in fear!","color":"dark_gray"}],banner_patterns=[{color:"yellow",pattern:"minecraft:flower"},{color:"yellow",pattern:"minecraft:gradient_up"},{color:"white",pattern:"minecraft:gradient"},{color:"black",pattern:"minecraft:flow"}],enchantments={binding_curse:1},unbreakable={}]
item replace entity @s armor.chest with leather_chestplate[item_name={"text":"Armour of Righteousness","color":"dark_aqua","italic":false},lore=[{"text":"Pretentious? Not at all!","color":"dark_gray"}],dyed_color=15789178,unbreakable={}]
item replace entity @s armor.legs with leather_leggings[item_name={"text":"Terrific Trousers","color":"dark_aqua","italic":false},lore=[{"text":"Worthy of a Divinity.","color":"dark_gray"}],dyed_color=16777215,unbreakable={}]
item replace entity @s armor.feet with leather_boots[item_name={"text":"Blindingly Bright Boots","color":"dark_aqua","italic":false},lore=[{"text":"Keeping these clean will be hard.","color":"dark_gray"}],dyed_color=16777215,unbreakable={}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Divinity ","color":"dark_aqua","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}