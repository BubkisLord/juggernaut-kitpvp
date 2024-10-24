#Sound effects
execute at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.4 1.5
execute at @s run playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 1 1.2

#Cancellation message
tellraw @s [{"text":"\n"},{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"]","color":"dark_gray","bold":true},{"text":" Action cancelled. ","color":"yellow","bold":false},{"text":"No extra kits","color":"dark_green","bold":false},{"text":" have been unlocked.","color":"yellow","bold":false},{"text":"\n"}]

#Scoreboard reset
scoreboard players reset @s unlockall