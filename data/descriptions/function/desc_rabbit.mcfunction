tellraw @s [{"text":"\n"},{"text":"Kit description:","bold":true,"color":"gold"},{"text":" Rabbit","bold":true,"color":"gold"},{"text":"\n"}]
tellraw @s [{"text":"The Rabbit is able to reach previously inaccessible places by being able to jump up several blocks.","color":"gray"},{"text":"\n"}]

tellraw @s [{"text":"Difficulty:","color":"gold"},{"text":" \u2588","color":"green"},{"text":" \u2588 \u2588 \u2588 \u2588","color":"dark_gray"},{"text":"\n "}]

tellraw @s[tag=!ul.Rabbit,scores={kitTokens=1..}] ["",{"text":"[Purchase Kit]","bold":true,"color":"dark_green","click_event":{"action":"run_command","command":"/trigger kitPurchase set 17"}}]
tellraw @s[tag=!ul.Rabbit,scores={kitTokens=0}] ["",{"text":"[You cannot afford this kit]","bold":true,"color":"red"}]
tellraw @s[tag=!ul.Rabbit] [{"text":"You do not own this kit.","color":"gray","italic":true},{"text":"\n"}]

tellraw @s[tag=ul.Rabbit] [{"text":"Assign as Favourite: ","color":"yellow"},{"text":"[","color":"dark_gray","bold":true,"click_event":{"action":"run_command","command":"/trigger fav1trigger set 17"}},{"text":"1","color":"dark_green","bold":true,"click_event":{"action":"run_command","command":"/trigger fav1trigger set 17"}},{"text":"] ","color":"dark_gray","bold":true,"click_event":{"action":"run_command","command":"/trigger fav1trigger set 17"}},{"text":"[","color":"dark_gray","bold":true,"click_event":{"action":"run_command","command":"/trigger fav2trigger set 17"}},{"text":"2","color":"dark_green","bold":true,"click_event":{"action":"run_command","command":"/trigger fav2trigger set 17"}},{"text":"] ","color":"dark_gray","bold":true,"click_event":{"action":"run_command","command":"/trigger fav2trigger set 17"}},{"text":"[","color":"dark_gray","bold":true,"click_event":{"action":"run_command","command":"/trigger fav3trigger set 17"}},{"text":"3","color":"dark_green","bold":true,"click_event":{"action":"run_command","command":"/trigger fav3trigger set 17"}},{"text":"]","color":"dark_gray","bold":true,"click_event":{"action":"run_command","command":"/trigger fav3trigger set 17"}}]
tellraw @s[tag=ul.Rabbit] [{"text":"You already own this kit.","color":"gray","italic":true},{"text":"\n"}]

scoreboard players enable @s[scores={kitTokens=1..}] kitPurchase