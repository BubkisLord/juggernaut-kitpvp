tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"Auto-Respawn ","color":"dark_green","bold":false},{"text":"has been toggled ","color":"yellow","bold":false},{"text":"ON","color":"green","bold":false},{"text":".","color":"yellow","bold":false}]
tellraw @s {"text":" "}
execute at @s run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 1 1
tag @s add autorespawn
kill @n[type=item,nbt={Item:{id:"minecraft:red_bed"}}]