#Sound effect
execute at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.4 1.5
execute at @s run playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 1 1.2

#Cancellation message
tellraw @s [{"text":"\n"},{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"]","color":"dark_gray","bold":true},{"text":" Error: You already own this kit. Your balance has not been charged.","color":"yellow","bold":false},{"text":"\n"}]

#Scoreboard update
scoreboard players set @s kitPurchase 0