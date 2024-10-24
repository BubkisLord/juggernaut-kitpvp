tag @s remove lobby.player
clear @s
tag @s add samurai
scoreboard players set @s bushido_flow 0
scoreboard players set @s ryujins_wrath 0
give @s iron_sword[item_name='{"text":"Katana","color": "#aa00aa", "bold": true, "italic": true}',lore=['{"text": "Only wielded by the most disciplined and learned samurai.","color": "dark_gray"}'],enchantments={sharpness:3,sweeping_edge:8},unbreakable={},hide_additional_tooltip={}]
give @s red_dye[item_name='{"text": "Ryūjin\'s Wrath","color": "red"}', lore=['{"text": "Hold this stone in your offhand to follow the path of Ryūjin\'s Wrath, allowing you to wield immense strength and recovery.","color": "dark_gray"}']]
give @s cyan_dye[item_name='{"text": "Bushido Flow","color": "#2D7C7D"}', lore=['{"text": "Hold this stone in your offhand to follow the path of the Bushido Flow, granting you great speed and endurance.","color": "dark_gray"}']]
give @s gunpowder[item_name='{"text": "Dance of Scattered Steps | 散走の舞","color": "dark_gray"}',lore=['{"text": "散走の舞は、煙で敵の背後に瞬間移動する技です。","color": "dark_gray"}','{"text": "The Dance of Scattered Steps is a technique to teleport behind an enemy in smoke.","color": "dark_gray"}']] 3
give @s cooked_beef[item_name='{"text":"Steak","color":"gold","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']]