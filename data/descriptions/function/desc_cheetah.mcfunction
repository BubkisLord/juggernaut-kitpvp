tellraw @s [{"text":"\n"},{"text":"Kit description:","bold":true,"color":"gold"},{"text":" Cheetah","bold":true,"color":"gold"},{"text":"\n"}]
tellraw @s [{"text":"The Cheetah is the fastest of all and is able to use a sprinting ability, gaining a short burst of speed.","color":"gray"},{"text":"\n"}]

tellraw @s [{"text":"Difficulty:","color":"gold"},{"text":" \u2588 \u2588","color":"green"},{"text":" \u2588 \u2588 \u2588","color":"dark_gray"},{"text":"\n "}]

tellraw @s[tag=!ul.Cheetah,scores={kitTokens=1..}] ["",{"text":"[Purchase Kit]","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger kitPurchase set 18"}}]
tellraw @s[tag=!ul.Cheetah,scores={kitTokens=0}] ["",{"text":"[You cannot afford this kit]","bold":true,"color":"red"}]
tellraw @s[tag=!ul.Cheetah] [{"text":"You do not own this kit.","color":"gray","italic":true},{"text":"\n"}]

tellraw @s[tag=ul.Cheetah] [{"text":"Assign as Favourite: ","color":"yellow"},{"text":"[","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav1trigger set 18"}},{"text":"1","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav1trigger set 18"}},{"text":"] ","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav1trigger set 18"}},{"text":"[","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav2trigger set 18"}},{"text":"2","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav2trigger set 18"}},{"text":"] ","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav2trigger set 18"}},{"text":"[","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav3trigger set 18"}},{"text":"3","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav3trigger set 18"}},{"text":"]","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav3trigger set 18"}}]
tellraw @s[tag=ul.Cheetah] [{"text":"You already own this kit.","color":"gray","italic":true},{"text":"\n"}]

scoreboard players enable @s[scores={kitTokens=1..}] kitPurchase