item replace entity @s armor.head with leather_helmet[unbreakable={}]
item replace entity @s armor.chest with leather_chestplate[unbreakable={}]
item replace entity @s armor.legs with leather_leggings[unbreakable={}]
item replace entity @s armor.feet with leather_boots[unbreakable={},enchantments={depth_strider:3}]
give @s trident[item_name=[{"text": "Speartooth Trident","bold":false,"color":"dark_aqua"},{"text": " | ","color": "dark_gray","bold": true},{"text": "MELEE WEAPON","color": "gray","bold": true}],enchantments={riptide:2},damage=248,lore=[{"text":"","color":"dark_gray"}]] 1
attribute @s safe_fall_distance modifier add max_fishmonger_fall_distance 999 add_value
attribute @s water_movement_efficiency base set 999999