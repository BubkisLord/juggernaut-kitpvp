execute at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.4 1.5

execute as @a[scores={tutorialPurchase=1},tag=!ul.Warrior] run tellraw @s ["",{"text":"\n"},{"text":"[","bold":true,"color":"dark_gray"},{"text":"KitPvP","bold":true,"color":"gold"},{"text":"]","bold":true,"color":"dark_gray"},{"text":" Are you sure you wish to purchase the ","color":"yellow"},{"text":"Warrior","color":"dark_green"},{"text":" kit?","color":"yellow"},{"text":"\n"},{"text":"[","bold":true,"color":"dark_gray"},{"text":"KitPvP","bold":true,"color":"gold"},{"text":"] ","bold":true,"color":"dark_gray"},{"text":"[Confirm]","bold":true,"color":"dark_green","click_event":{"action":"run_command","command":"/trigger tutorialPurchase set 101"}},{"text":" "},{"text":"[Cancel]","bold":true,"color":"dark_red","click_event":{"action":"run_command","command":"/trigger tutorialPurchase set 999"}},{"text":"\n "}]
execute as @a[scores={tutorialPurchase=1},tag=ul.Warrior] run function tutorial:tutorial_purchasealreadyowned

scoreboard players set @s tutorialPurchase 500
scoreboard players enable @s tutorialPurchase
