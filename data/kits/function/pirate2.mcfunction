scoreboard players set @s pirateKills 2
clear @s stone_sword
give @s stone_sword[item_name={"text":"Magical Stone Cutlass","color":"dark_aqua","italic":false},lore=[{"text":"Yarrrhh!!","color":"dark_gray"}],unbreakable={},enchantments={sharpness:2}]
item replace entity @s armor.legs with leather_leggings[item_name={"text":"Captain's Trousers","color":"dark_aqua","italic":false},lore=[{"text":"These were really expensive.","color":"dark_gray"}],dyed_color=12596272,unbreakable={}]
item replace entity @s armor.feet with leather_boots[item_name={"text":"Captain's Boots","color":"dark_aqua","italic":false},lore=[{"text":"The second best money can buy.","color":"dark_gray"}],dyed_color=1907746,unbreakable={}]
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"Your kit has been upgraded to level ","color":"yellow","bold":false},{"text":"Two","color":"dark_aqua","bold":false},{"text":".","color":"yellow","bold":false}]
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"Upgrades left: ","color":"yellow","bold":false},{"text":"Six","color":"dark_aqua","bold":false},{"text":".","color":"yellow","bold":false}]
tellraw @s {"text":" "}
execute as @s at @s run playsound minecraft:block.anvil.use master @s ~ ~ ~ 1.2 1.2