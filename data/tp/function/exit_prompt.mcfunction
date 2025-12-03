execute at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.4 1.5
tellraw @s [{"text":"\n"},{"text":"[","color":"dark_gray","bold":true},{"text":"SYSTEM","color":"#30add3","bold":true},{"text":"]","color":"dark_gray","bold":true},{"text":" Are you sure you wish to go back to the lobby?","color":"yellow","bold":false},{"text":" Drop this item again","color":"dark_green"},{"text":" to confirm.","color":"yellow"},{"text":"\n"}]
scoreboard players set @s exit_count 200
execute at @s run kill @n[type=item,nbt={Item:{id:"minecraft:dark_oak_door"}},distance=..3]