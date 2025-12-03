tellraw @s [{"text":"\n"},{"text":"Kit description:","bold":true,"color":"gold"},{"text":" Hunter","bold":true,"color":"dark_aqua"},{"text":"\n"}]
tellraw @s [{"text":"Having sacrificed swords for speed, the fleet-footed Hunter uses spectral arrows to never lose track of a target.","color":"gray"},{"text":"\n"}]

tellraw @s [{"text":"Difficulty:","color":"gold"},{"text":" \u2588 \u2588 \u2588","color":"green"},{"text":" \u2588 \u2588","color":"dark_gray"},{"text":"\n "}]

tellraw @s[tag=!ul.Hunter,scores={kitTokens=1..}] ["",{"text":"[Purchase Kit]","bold":true,"color":"dark_green","click_event":{"action":"run_command","command":"/trigger kitPurchase set 12"}}]
tellraw @s[tag=!ul.Hunter,scores={kitTokens=0}] ["",{"text":"[You cannot afford this kit]","bold":true,"color":"red"}]
tellraw @s[tag=!ul.Hunter] [{"text":"You do not own this kit.","color":"gray","italic":true},{"text":"\n"}]

tellraw @s[tag=ul.Hunter] [{"text":"Assign as Favourite: ","color":"yellow"},{"text":"[","color":"dark_gray","bold":true,"click_event":{"action":"run_command","command":"/trigger fav1trigger set 12"}},{"text":"1","color":"dark_green","bold":true,"click_event":{"action":"run_command","command":"/trigger fav1trigger set 12"}},{"text":"] ","color":"dark_gray","bold":true,"click_event":{"action":"run_command","command":"/trigger fav1trigger set 12"}},{"text":"[","color":"dark_gray","bold":true,"click_event":{"action":"run_command","command":"/trigger fav2trigger set 12"}},{"text":"2","color":"dark_green","bold":true,"click_event":{"action":"run_command","command":"/trigger fav2trigger set 12"}},{"text":"] ","color":"dark_gray","bold":true,"click_event":{"action":"run_command","command":"/trigger fav2trigger set 12"}},{"text":"[","color":"dark_gray","bold":true,"click_event":{"action":"run_command","command":"/trigger fav3trigger set 12"}},{"text":"3","color":"dark_green","bold":true,"click_event":{"action":"run_command","command":"/trigger fav3trigger set 12"}},{"text":"]","color":"dark_gray","bold":true,"click_event":{"action":"run_command","command":"/trigger fav3trigger set 12"}}]
tellraw @s[tag=ul.Hunter] [{"text":"You already own this kit.","color":"gray","italic":true},{"text":"\n"}]

scoreboard players enable @s[scores={kitTokens=1..}] kitPurchase