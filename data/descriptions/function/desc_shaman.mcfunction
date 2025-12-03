tellraw @s [{"text":"\n"},{"text":"Kit description:","bold":true,"color":"gold"},{"text":" Shaman","bold":true,"color":"dark_purple"},{"text":"\n"}]
tellraw @s [{"text":"The Shaman is the master of the elements, being positively affected by different types of magic. The Shaman even wields a totem with the ability to resurrect its owner.","color":"gray"},{"text":"\n"}]

tellraw @s [{"text":"Difficulty:","color":"gold"},{"text":" \u2588 \u2588 \u2588","color":"green"},{"text":" \u2588 \u2588","color":"dark_gray"},{"text":"\n "}]

tellraw @s[tag=!ul.Shaman,scores={kitTokens=1..}] ["",{"text":"[Purchase Kit]","bold":true,"color":"dark_green","click_event":{"action":"run_command","command":"/trigger kitPurchase set 30"}}]
tellraw @s[tag=!ul.Shaman,scores={kitTokens=0}] ["",{"text":"[You cannot afford this kit]","bold":true,"color":"red"}]
tellraw @s[tag=!ul.Shaman] [{"text":"You do not own this kit.","color":"gray","italic":true},{"text":"\n"}]

tellraw @s[tag=ul.Shaman] [{"text":"Assign as Favourite: ","color":"yellow"},{"text":"[","color":"dark_gray","bold":true,"click_event":{"action":"run_command","command":"/trigger fav1trigger set 30"}},{"text":"1","color":"dark_green","bold":true,"click_event":{"action":"run_command","command":"/trigger fav1trigger set 30"}},{"text":"] ","color":"dark_gray","bold":true,"click_event":{"action":"run_command","command":"/trigger fav1trigger set 30"}},{"text":"[","color":"dark_gray","bold":true,"click_event":{"action":"run_command","command":"/trigger fav2trigger set 30"}},{"text":"2","color":"dark_green","bold":true,"click_event":{"action":"run_command","command":"/trigger fav2trigger set 30"}},{"text":"] ","color":"dark_gray","bold":true,"click_event":{"action":"run_command","command":"/trigger fav2trigger set 30"}},{"text":"[","color":"dark_gray","bold":true,"click_event":{"action":"run_command","command":"/trigger fav3trigger set 30"}},{"text":"3","color":"dark_green","bold":true,"click_event":{"action":"run_command","command":"/trigger fav3trigger set 30"}},{"text":"]","color":"dark_gray","bold":true,"click_event":{"action":"run_command","command":"/trigger fav3trigger set 30"}}]
tellraw @s[tag=ul.Shaman] [{"text":"You already own this kit.","color":"gray","italic":true},{"text":"\n"}]

scoreboard players enable @s[scores={kitTokens=1..}] kitPurchase