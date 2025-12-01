bossbar set minecraft:lobby players @a[tag=lobby.player]

effect give @s minecraft:resistance 2 100 true
effect give @s minecraft:saturation 2 100 true

item replace entity @a[tag=lobby.player] armor.head with stone_button[enchantments={binding_curse:1},attribute_modifiers=[{type:"minecraft:knockback_resistance",slot:"head",amount:1,operation:"add_value", id:"minecraft:attack_damage"}]] 1

item replace entity @a[tag=lobby.player] hotbar.5 with minecraft:globe_banner_pattern[item_name={"text":"Your Statistics","color":"green","italic":false},lore=[{"text":"Drop this item to view","color":"dark_gray"},{"text":"your statistics.","color":"dark_gray"}]]
item replace entity @a[tag=lobby.player] hotbar.7 with minecraft:chest[item_name={"text":"Market","color":"gold","italic":false},lore=[{"text":"Unlock kits at the Market.","color":"dark_gray"},{"text":"Drop this item to go.","color":"dark_gray"}]]
item replace entity @a[tag=lobby.player] hotbar.8 with minecraft:dark_oak_door[item_name={"text":"Back to Lobby","color":"gold","italic":false},lore=[{"text":"Drop this item to go back","color":"dark_gray"},{"text":"to the main lobby.","color":"dark_gray"}]]