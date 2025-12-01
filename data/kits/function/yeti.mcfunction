tag @s remove lobby.player
clear @s
tag @s add yeti
give @s stick[item_name={"text":"Giant Club","color":"gold","italic":false},lore=[{"text":"Only the strongest can use it effectively.","color":"dark_gray"}],unbreakable={},enchantments={sharpness:10,knockback:2},attribute_modifiers=[{id:"minecraft:attack_speed",amount:-3.4,operation:"add_value",type:"attack_speed"}]]
item replace entity @s hotbar.1 with snow_block[item_name={"text":"Frost Breath","color":"gold","italic":false},lore=[{"text":"Drop to breathe ice and stun your enemies.","color":"dark_gray"}]] 5
give @s cooked_beef[item_name={"text":"Steak","color":"gold","italic":false},lore=[{"text":"Eat to regenerate.","color":"dark_gray"}]] 16
item replace entity @s armor.chest with iron_chestplate[item_name={"text":"Yeti's Breastplate","color":"gold","italic":false},lore=[{"text":"A magnificent piece of armour.","color":"dark_gray"}],unbreakable={}]
item replace entity @s armor.legs with leather_leggings[item_name={"text":"Yeti's Pants","color":"gold","italic":false},lore=[{"text":"Not what you'd wear during the summer.","color":"dark_gray"}],dyed_color=10529733,unbreakable={}]
item replace entity @s armor.feet with leather_boots[item_name={"text":"Yeti's Boots","color":"gold","italic":false},lore=[{"text":"Good for keeping the cold away.","color":"dark_gray"}],dyed_color=10529733,unbreakable={}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Yeti ","color":"gold","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}