execute if entity @s[tag=using_waiting_game] run function juggernaut:attribute_management/apply {attribute_name:"movement_speed",value:0.9,duration:2,modifier_name:"waiting_game"}
execute if entity @s[tag=fishmonger] run clear @s trident
execute if entity @s[tag=fishmonger] run item replace entity @s hotbar.0 with trident[item_name={"text": "Harpoon"},enchantments={loyalty:3},lore=[{"text":"","color":"dark_gray"}],unbreakable={}]
