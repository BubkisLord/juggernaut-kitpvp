tellraw @s [{"text":"\n"},{"text":"Kit description:","bold":true,"color":"gold"},{"text":" Divinity","bold":true,"color":"dark_aqua"},{"text":"\n"}]
tellraw @s [{"text":"With the ability to soar upwards in the blink of an eye, the Divinity has superb escape capabilities. A powerful bow is the only weapon the Divinity needs (and has, for that matter).","color":"gray"},{"text":"\n"}]

tellraw @s [{"text":"Difficulty:","color":"gold"},{"text":" \u2588 \u2588 \u2588","color":"green"},{"text":" \u2588 \u2588","color":"dark_gray"},{"text":"\n "}]

tellraw @s[tag=!ul.Divinity,scores={kitTokens=1..}] ["",{"text":"[Purchase Kit]","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger kitPurchase set 16"}}]
tellraw @s[tag=!ul.Divinity,scores={kitTokens=0}] ["",{"text":"[You cannot afford this kit]","bold":true,"color":"red"}]
tellraw @s[tag=!ul.Divinity] [{"text":"You do not own this kit.","color":"gray","italic":true},{"text":"\n"}]

tellraw @s[tag=ul.Divinity] [{"text":"Assign as Favourite: ","color":"yellow"},{"text":"[","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav1trigger set 16"}},{"text":"1","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav1trigger set 16"}},{"text":"] ","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav1trigger set 16"}},{"text":"[","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav2trigger set 16"}},{"text":"2","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav2trigger set 16"}},{"text":"] ","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav2trigger set 16"}},{"text":"[","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav3trigger set 16"}},{"text":"3","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav3trigger set 16"}},{"text":"]","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav3trigger set 16"}}]
tellraw @s[tag=ul.Divinity] [{"text":"You already own this kit.","color":"gray","italic":true},{"text":"\n"}]

scoreboard players enable @s[scores={kitTokens=1..}] kitPurchase