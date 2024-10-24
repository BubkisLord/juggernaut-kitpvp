tellraw @s [{"text":"\n"},{"text":"Kit description:","bold":true,"color":"gold"},{"text":" Pirate","bold":true,"color":"dark_aqua"},{"text":"\n"}]
tellraw @s [{"text":"The Pirate has the unique ability to upgrade on every kill, going from a subpar, bowless weakling to a powerful fighter in melee and ranged combat alike.","color":"gray"},{"text":"\n"}]

tellraw @s [{"text":"Difficulty:","color":"gold"},{"text":" \u2588 \u2588 \u2588 \u2588","color":"green"},{"text":" \u2588","color":"dark_gray"},{"text":"\n "}]

tellraw @s[tag=!ul.Pirate,scores={kitTokens=1..}] ["",{"text":"[Purchase Kit]","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger kitPurchase set 15"}}]
tellraw @s[tag=!ul.Pirate,scores={kitTokens=0}] ["",{"text":"[You cannot afford this kit]","bold":true,"color":"red"}]
tellraw @s[tag=!ul.Pirate] [{"text":"You do not own this kit.","color":"gray","italic":true},{"text":"\n"}]

tellraw @s[tag=ul.Pirate] [{"text":"Assign as Favourite: ","color":"yellow"},{"text":"[","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav1trigger set 15"}},{"text":"1","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav1trigger set 15"}},{"text":"] ","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav1trigger set 15"}},{"text":"[","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav2trigger set 15"}},{"text":"2","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav2trigger set 15"}},{"text":"] ","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav2trigger set 15"}},{"text":"[","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav3trigger set 15"}},{"text":"3","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav3trigger set 15"}},{"text":"]","color":"dark_gray","bold":true,"clickEvent":{"action":"run_command","value":"/trigger fav3trigger set 15"}}]
tellraw @s[tag=ul.Pirate] [{"text":"You already own this kit.","color":"gray","italic":true},{"text":"\n"}]

scoreboard players enable @s[scores={kitTokens=1..}] kitPurchase