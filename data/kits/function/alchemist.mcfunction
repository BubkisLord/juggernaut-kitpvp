tag @s remove lobby.player
clear @s
tag @s add alchemist
give @s golden_sword[item_name={"text":"Golden Blade","color":"dark_purple","italic":false},lore=[{"text":"Used to be a stone sword.","color":"dark_gray"}],enchantments={sharpness:2},unbreakable={}]

item replace entity @s hotbar.1 with clock[item_name={"text":"Amulet of Immortality","color":"dark_purple","italic":false},lore=[{"text":"Drop to regenerate while stunned.","color":"dark_gray"}]] 2

give @s splash_potion[item_name={"text":"Vial of Mercury","color":"dark_purple","italic":false},lore=[{"text":"Inflict harm upon your enemies.","color":"dark_gray"}],potion_contents={custom_effects:[{id:"minecraft:instant_damage",amplifier:1}],custom_color:10930638}]

give @s splash_potion[item_name={"text":"Vial of Mercury","color":"dark_purple","italic":false},lore=[{"text":"Careful with that stuff; it's toxic!","color":"dark_gray"}],potion_contents={custom_effects:[{id:"minecraft:instant_damage",amplifier:1}],custom_color:10930638}]

give @s cooked_beef[item_name={"text":"Steak","color":"dark_purple","italic":false},lore=[{"text":"Eat to regenerate.","color":"dark_gray"}]] 16
item replace entity @s armor.head with leather_helmet[item_name={"text":"Alchemist's Hat","color":"dark_purple","italic":false},lore=[{"text":"Almost looks like gold.","color":"dark_gray"}],dyed_color=16764175,unbreakable={}]
item replace entity @s armor.chest with golden_chestplate[item_name={"text":"Shiny Chestplate","color":"dark_purple","italic":false},lore=[{"text":"It's heavier than it looks!","color":"dark_gray"}],unbreakable={}]
item replace entity @s armor.legs with leather_leggings[item_name={"text":"Yellow Pants","color":"dark_purple","italic":false},lore=[{"text":"To do: Turn these into gold.","color":"dark_gray"}],dyed_color=16764175,unbreakable={}]
item replace entity @s armor.feet with leather_boots[item_name={"text":"Uncomfortable Boots","color":"dark_purple","italic":false},lore=[{"text":"At least they look cool.","color":"dark_gray"}],dyed_color=16764175,unbreakable={}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Alchemist ","color":"dark_purple","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}