#Anti-Damage and Saturation
effect give @a[tag=lobby.player] resistance 2 100 true
effect give @a[tag=lobby.player] saturation 2 100 true

#Anti-Knockback
execute as @a[tag=lobby.player] run attribute @s minecraft:knockback_resistance modifier add lobby:knockback_resistance 1 add_value

#Teleport and Stats
item replace entity @a[tag=lobby.player] hotbar.5 with minecraft:globe_banner_pattern[item_name={"text":"Statistics","color":"green","italic":false}, lore=[{"text":"Drop this item to view","color":"dark_gray"},{"text":"global statistics.","color":"dark_gray"}]] 1
item replace entity @a[tag=lobby.player] hotbar.8 with minecraft:dark_oak_door[item_name={"text":"Back to Lobby","color":"gold","italic":false},lore=[{"text":"Drop this item to go back","color":"dark_gray"},{"text":"to the Main Lobby.","color":"dark_gray"}]]

#Stats
execute as @e[type=item,nbt={Item:{id:"minecraft:globe_banner_pattern"}}] at @s as @p run function stats:preview

#Lobby & Market Teleportation
execute as @e[type=item,nbt={Item:{id:"minecraft:dark_oak_door"}}] at @s as @p run function tp:lobby

#Spawnpoint
execute if score #game_state var matches 0 run spawnpoint @a 2000 100 0

#Clearing extra lobby items and clearing armour slots
item replace entity @a[tag=lobby.player] armor.head with air
item replace entity @a[tag=lobby.player] armor.chest with air
item replace entity @a[tag=lobby.player] armor.legs with air
item replace entity @a[tag=lobby.player] armor.feet with air

# gamemode adventure @a[tag=!spectator,name=!"BubkisLord"]
gamemode spectator @a[tag=spectator]

execute as @a[tag=lobby.player] at @s if score #game_state var matches 0 if block ~ ~-2 ~ orange_shulker_box run function juggernaut:start_pregame
execute as @a[tag=lobby.player] at @s if score #game_state var matches 0 if block ~ ~-2 ~ cyan_shulker_box run function survival:start
execute as @a[tag=lobby.player] at @s if block ~ ~-2 ~ purple_shulker_box run function tp:lobby