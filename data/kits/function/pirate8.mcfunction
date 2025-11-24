scoreboard players set @s pirateKills 14
clear @s bow
clear @s arrow
give @s trident[item_name='{"text":"Speartooth Trident","color":"dark_aqua","italic":false}',lore=['{"text":"A true pirate\'s treasure.","color":"dark_gray"}'],unbreakable={},enchantments={loyalty:7}]
clear @s iron_sword
give @s iron_sword[item_name='{"text":"Maw of the Deep","color":"dark_blue","italic":true,"bold":true}',lore=['{"text":"Use to return to the sea.","color":"dark_gray"}'],unbreakable={},enchantments={sharpness:4}]
tellraw @s {"text":" "}
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"Your kit has been upgraded to level ","color":"yellow","bold":false},{"text":"Eight","color":"dark_aqua","bold":false},{"text":".","color":"yellow","bold":false}]
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"Upgrades left: ","color":"yellow","bold":false},{"text":"None","color":"dark_aqua","bold":false},{"text":".","color":"yellow","bold":false}]
tellraw @s {"text":" "}
execute as @s at @s run playsound minecraft:block.anvil.use master @s ~ ~ ~ 1.2 1.2