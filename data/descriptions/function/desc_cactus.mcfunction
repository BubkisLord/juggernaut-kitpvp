tellraw @s [{"text":"\n"},{"text":"Kit description:","bold":true,"color":"gold"},{"text":" Cactus","bold":true,"color":"dark_green"},{"text":"\n"}]
tellraw @s [{"text":"The Cactus sets itself apart from the other kits by having armour with thorns that may grant the Cactus an advantage over an opponent.","color":"gray"},{"text":"\n"}]

tellraw @s [{"text":"Difficulty:","color":"gold"},{"text":" \u2588","color":"green"},{"text":" \u2588 \u2588 \u2588 \u2588","color":"dark_gray"},{"text":"\n "}]

tellraw @s[tag=!ul.Cactus,scores={kitTokens=1..}] ["",{"text":"[Purchase Kit]","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger kitPurchase set 2"}}]
tellraw @s[tag=!ul.Cactus,scores={kitTokens=0}] ["",{"text":"[You cannot afford this kit]","bold":true,"color":"red"}]
tellraw @s[tag=!ul.Cactus] [{"text":"You do not own this kit.","color":"gray","italic":true},{"text":"\n"}]

tellraw @s[tag=ul.Cactus] [{"text":"Assign as Favourite: ","color":"yellow"},{"text":"[","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav1trigger set 2"}},{"text":"1","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav1trigger set 2"}},{"text":"] ","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav1trigger set 2"}},{"text":"[","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav2trigger set 2"}},{"text":"2","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav2trigger set 2"}},{"text":"] ","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav2trigger set 2"}},{"text":"[","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav3trigger set 2"}},{"text":"3","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav3trigger set 2"}},{"text":"]","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav3trigger set 2"}}]
tellraw @s[tag=ul.Cactus] [{"text":"You already own this kit.","color":"gray","italic":true},{"text":"\n"}]

scoreboard players enable @s[scores={kitTokens=1..}] kitPurchase