execute as @a[scores={kitPurchase=1..32,kitTokens=1..},tag=market.player] run function shop:purchaseprompt
execute as @a[scores={kitPurchase=101..132,kitTokens=1..},tag=market.player] run function shop:purchasecomplete
execute as @a[scores={kitPurchase=999},tag=market.player] run function shop:purchasecancel
execute as @a[scores={kitPurchase=1..132,kitTokens=0},tag=market.player] run function shop:purchaseunaffordable
title @a[tag=market.player] actionbar [{"text":"Kit Tokens: ","color":"dark_green"},{"score":{"name":"*","objective":"kitTokens"},"color":"green"}]
execute as @a[tag=!lobby.player] run function shop:tokengain
scoreboard players set @a[scores={kitTokens=..-1}] kitTokens 0
tag @a[tag=!lobby.player] remove market.player
execute as @a[tag=lobby.player] run scoreboard players enable @s fav1trigger
execute as @a[tag=lobby.player] run scoreboard players enable @s fav2trigger
execute as @a[tag=lobby.player] run scoreboard players enable @s fav3trigger
execute as @a[tag=!lobby.player] run scoreboard players reset @s fav1trigger
execute as @a[tag=!lobby.player] run scoreboard players reset @s fav2trigger
execute as @a[tag=!lobby.player] run scoreboard players reset @s fav3trigger
execute at @e[type=armor_stand,tag=market.marker] as @a[distance=0..100] run tag @s add market.player
execute at @e[type=armor_stand,tag=market.marker] as @a[distance=100..] run tag @s remove market.player
execute as @a[scores={kitSelect=1..},tag=market.player] run function shop:kitselect
scoreboard players reset @a[tag=!market.player] kitSelect