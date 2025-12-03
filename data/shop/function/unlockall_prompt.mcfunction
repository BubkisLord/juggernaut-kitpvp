#Sound effects
execute at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.4 1.5

#Prompt message
tellraw @s [{"text":"\n"},{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"]","color":"dark_gray","bold":true},{"text":" Are you sure you wish to unlock ","color":"yellow","bold":false},{"text":"all kits","color":"dark_green","bold":false},{"text":" for all players currently online? This action ","color":"yellow","bold":false},{"text":"cannot be undone","color":"dark_red"},{"text":"! Please ","color":"yellow","bold":false},{"text":"check with your fellow players","color":"dark_green","bold":false},{"text":" before using this feature!","color":"yellow","bold":false}]
tellraw @s [{"text":"[","bold":true,"color":"dark_gray"},{"text":"KitPvP","bold":true,"color":"gold"},{"text":"] ","bold":true,"color":"dark_gray"},{"text":"[Confirm]","bold":true,"color":"dark_green","click_event":{"action":"run_command","command":"/trigger unlockall set 2"}},{"text":" "},{"text":"[Cancel]","bold":true,"color":"dark_red","click_event":{"action":"run_command","command":"/trigger unlockall set 3"}},{"text":"\n"}]

#Reset trigger score
scoreboard players reset @s unlockall