execute if score #game_state var matches 11 if score @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal <= #33 var if entity @n[type=armor_stand,tag=juggernaut_manager] run title @a actionbar [{"text":"Replenishment Percentage: ","color": "dark_green","bold": true},{"score":{"name":"@n[type=armor_stand,tag=juggernaut_manager]","objective":"replenish_decimal"},"bold": true,"color": "dark_green"},{"text": "%"}]

execute if score #game_state var matches 11 if score @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal > #33 var if score @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal <= #75 var if entity @n[type=armor_stand,tag=juggernaut_manager] run title @a actionbar [{"text":"Replenishment Percentage: ","color": "gold","bold": true},{"score":{"name":"@n[type=armor_stand,tag=juggernaut_manager]","objective":"replenish_decimal"},"bold": true,"color": "gold"},{"text": "%"}]

execute if score #game_state var matches 11 if score @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal > #75 var if entity @n[type=armor_stand,tag=juggernaut_manager] run title @a actionbar [{"text":"Replenishment Percentage: ","color": "dark_red","bold": true},{"score":{"name":"@n[type=armor_stand,tag=juggernaut_manager]","objective":"replenish_decimal"},"bold": true,"color": "dark_red"},{"text": "%"}]
