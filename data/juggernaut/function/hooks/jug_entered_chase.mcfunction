execute if entity @s[tag=fishmonger] run clear @s trident
execute if entity @s[tag=fishmonger] run item replace entity @s hotbar.0 with trident[item_name={"text": "Harpoon"},enchantments={loyalty:3},lore=[{"text":"","color":"dark_gray"}],unbreakable={}]
