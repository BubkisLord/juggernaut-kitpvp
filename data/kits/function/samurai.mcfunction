tag @s remove lobby.player
clear @s
tag @s add samurai
scoreboard players set @s bushido_flow 0
scoreboard players set @s ryujins_wrath 0
item replace entity @s armor.head with minecraft:iron_helmet[item_name={"text":"Kabuto","color": "#aa00aa", "bold": true, "italic": true},lore=[{"text": "A traditional samurai helmet, symbolizing honor and bravery.","color": "dark_gray"}],enchantments={protection:2,unbreaking:3},unbreakable={}]
item replace entity @s armor.chest with minecraft:iron_chestplate[item_name={"text":"Do","color": "#aa00aa", "bold": true, "italic": true},lore=[{"text": "A sturdy chestplate worn by samurai to protect their vital organs.","color": "dark_gray"}],enchantments={protection:2,unbreaking:3},unbreakable={}]
item replace entity @s armor.legs with minecraft:iron_leggings[item_name={"text":"Haidate","color": "#aa00aa", "bold": true, "italic": true},lore=[{"text": "Leg armor that provides mobility and protection for the samurai.","color": "dark_gray"}],enchantments={protection:2,unbreaking:3},unbreakable={}]
item replace entity @s armor.feet with minecraft:iron_boots[item_name={"text":"Suneate","color": "#aa00aa", "bold": true, "italic": true},lore=[{"text": "Boots designed for agility and durability, essential for a samurai.","color": "dark_gray"}],enchantments={protection:2,unbreaking:3},unbreakable={}]
give @s iron_sword[item_name={"text":"Katana","color": "#aa00aa", "bold": true, "italic": true},lore=[{"text": "Only wielded by the most disciplined and learned samurai.","color": "dark_gray"}],enchantments={sharpness:3,sweeping_edge:8},unbreakable={},attribute_modifiers=[{type:"attack_speed",id:"attack_speed",amount: -3.0, operation:"add_value"}]]
give @s red_dye[item_name={"text": "Ryūjin's Wrath","color": "red"}, lore=[{"text": "Hold this stone in your offhand to follow the path of Ryūjin's Wrath,","color": "dark_gray"},{"text": "allowing you to wield immense strength and recovery.","color": "dark_gray"}]]
give @s cyan_dye[item_name={"text": "Bushido Flow","color": "#2D7C7D"}, lore=[{"text": "Hold this stone in your offhand to follow the path of the Bushido Flow, granting you great speed and endurance.","color": "dark_gray"}]]
give @s cooked_beef[item_name={"text":"Steak","color":"gold","italic":false},lore=[{"text":"Eat to regenerate.","color":"dark_gray"}]] 32