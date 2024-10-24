execute if entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=0}] run item replace entity @a[tag=!lobby.player,tag=!tutorial.player] hotbar.8 with minecraft:dark_oak_door[item_name='{"text":"Back to Lobby","color":"gold","italic":false}',lore=['{"text":"Drop this item to","color":"dark_gray"}','{"text":"exit the Arena.","color":"dark_gray"}'],hide_additional_tooltip={}]
execute unless entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=0}] run item replace entity @a[tag=!lobby.player,tag=!tutorial.player] hotbar.8 with air
execute as @a[tag=!lobby.player,scores={exit_count=1..}] run scoreboard players remove @s exit_count 1

execute at @a[tag=lobby.player] run execute as @e[type=item,nbt={Item:{id:"minecraft:dark_oak_door"}},distance=..3] at @s as @p[scores={health=20..,exit_count=..0}] at @s unless entity @a[distance=0.1..32] run function tp:exit_prompt
execute at @a[tag=lobby.player] run execute as @e[type=item,nbt={Item:{id:"minecraft:dark_oak_door"}},distance=..3] at @s as @p[scores={health=20..,exit_count=1..}] at @s unless entity @a[distance=0.1..32] run function tp:exit_arena

execute at @a[tag=lobby.player] run execute as @e[type=item,nbt={Item:{id:"minecraft:dark_oak_door"}},distance=..3] at @s as @p[scores={health=20..}] at @s if entity @a[distance=0.1..32] run function tp:exit_error
execute at @a[tag=lobby.player] run execute as @e[type=item,nbt={Item:{id:"minecraft:dark_oak_door"}},distance=..3] at @s as @p[scores={health=..19}] at @s run function tp:exit_error