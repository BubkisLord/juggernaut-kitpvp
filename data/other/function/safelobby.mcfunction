#Anti-Damage and Saturation
effect give @a[tag=lobby.player,tag=!autorespawn] resistance 2 100 true
effect give @a[tag=lobby.player,tag=!autorespawn] saturation 2 100 true
effect give @a[tag=tutorial.player,tag=!autorespawn] resistance 2 100 true
effect give @a[tag=tutorial.player,tag=!autorespawn] saturation 2 100 true

#Anti-Knockback
execute as @a[tag=lobby.player] run attribute @s minecraft:generic.knockback_resistance base set 1
execute as @a[tag=tutorial.player] run attribute @s minecraft:generic.knockback_resistance base set 1
execute as @a[tag=!lobby.player,tag=!tutorial.player] run attribute @s minecraft:generic.knockback_resistance base set 0

#Teleport and Stats
item replace entity @a[tag=lobby.player,tag=!autorespawn] hotbar.5 with minecraft:globe_banner_pattern[item_name='{"text":"Your Statistics","color":"green","italic":false}', lore=['{"text":"Drop this item to view","color":"dark_gray"}','{"text":"your statistics.","color":"dark_gray"}'],hide_additional_tooltip={}] 1
item replace entity @a[tag=lobby.player,tag=!autorespawn] hotbar.7 with minecraft:chest[item_name='{"text":"Kit Selection","color":"gold","italic":false}',lore=['{"text":"Select kits in the Kit Selection room.","color":"dark_gray"}','{"text":"Drop this item to go.","color":"dark_gray"}'],hide_additional_tooltip={}]
item replace entity @a[tag=lobby.player,tag=!autorespawn] hotbar.8 with minecraft:dark_oak_door[item_name='{"text":"Back to Lobby","color":"gold","italic":false}',lore=['{"text":"Drop this item to go back","color":"dark_gray"}','{"text":"to the Main Lobby.","color":"dark_gray"}'],hide_additional_tooltip={}]

#Stats
execute as @e[type=item,nbt={Item:{id:"minecraft:globe_banner_pattern"}}] at @s as @p run function scoreboard:stats

#Lobby & Market Teleportation
execute as @e[type=item,nbt={Item:{id:"minecraft:dark_oak_door"}}] at @s as @p run function tp:exit_arena
execute as @e[type=item,nbt={Item:{id:"minecraft:chest"}}] at @s as @p run function tp:kit_select_tp

#Spawnpoint
execute if entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=0}] if entity @e[type=armor_stand,tag=surv_game_manager,scores={game_state=0}] run spawnpoint @a 2000 100 0

#Clearing extra lobby items and clearing armour slots
scoreboard players add @a[tag=lobby.player] lobby_clearcount 1
execute as @a[tag=lobby.player,scores={lobby_clearcount=20..}] run function other:lobby_extraitems_removal
item replace entity @a[tag=lobby.player] armor.head with air
item replace entity @a[tag=lobby.player] armor.chest with air
item replace entity @a[tag=lobby.player] armor.legs with air
item replace entity @a[tag=lobby.player] armor.feet with air

#Forcing adventure mode
gamemode adventure @a[tag=!spectator,name=!"BubkisLord"]
gamemode spectator @a[tag=spectator]

#Remove old tags
tag @a[tag=lobby.player] remove juggernaut
tag @a[tag=lobby.player] remove runner
tag @a[tag=lobby.player] remove spectator
tag @a[tag=lobby.player] remove medic

attribute @a[tag=lobby.player,limit=1,sort=random] generic.max_health base set 20

#Unlockall trigger
execute as @a[tag=lobby.player] run scoreboard players enable @s unlockall
execute as @a[tag=!lobby.player,scores={unlockall=0}] run scoreboard players reset @s unlockall
execute as @a[tag=lobby.player,scores={unlockall=1}] run function shop:unlockall_prompt
execute as @a[tag=lobby.player,scores={unlockall=2}] run function shop:unlockall_confirmed
execute as @a[tag=lobby.player,scores={unlockall=3}] run function shop:unlockall_declined
