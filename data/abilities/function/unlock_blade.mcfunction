clear @s prismarine_shard
give @s diamond_sword[item_name='{"text":"Ancient Blade","color":"dark_green","italic":false}',lore=['{"text":"Just about to break.","color":"dark_gray"}'],damage=1560,enchantments={sharpness:255},hide_additional_tooltip={}]
playsound minecraft:block.enchantment_table.use master @a ~ ~ ~ 1 1.4
playsound minecraft:block.anvil.land master @a ~ ~ ~ 0.3 2
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"By the power of ancient magic, you have obtained the ","color":"yellow","bold":false},{"text":"Ancient Blade","color":"dark_green","bold":false},{"text":". Use it wisely.","color":"yellow","bold":false}]
tellraw @s {"text":" "}
scoreboard players set @s assassinActivate 2