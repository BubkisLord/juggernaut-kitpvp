scoreboard players set @s pirateKills 4
give @s bow[item_name={"text":"Old Wooden Bow","color":"dark_aqua","italic":false},lore=[{"text":"Not worth a lot, sadly.","color":"dark_gray"}],unbreakable={}]
give @s arrow[item_name={"text":"Feathered Arrow","color":"dark_aqua","italic":false},lore=[{"text":"Aiming is the key.","color":"dark_gray"}]] 128
item replace entity @s armor.head with leather_helmet[item_name={"text":"Captain's Hat","color":"dark_aqua","italic":false},lore=[{"text":"A cool hat for a cool pirate.","color":"dark_gray"}],dyed_color=1907746,unbreakable={}]
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"Your kit has been upgraded to level ","color":"yellow","bold":false},{"text":"Three","color":"dark_aqua","bold":false},{"text":".","color":"yellow","bold":false}]
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"Upgrades left: ","color":"yellow","bold":false},{"text":"Five","color":"dark_aqua","bold":false},{"text":".","color":"yellow","bold":false}]
tellraw @s {"text":" "}
execute as @s at @s run playsound minecraft:block.anvil.use master @s ~ ~ ~ 1.2 1.2