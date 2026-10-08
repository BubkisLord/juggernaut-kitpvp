# Anti-Damage and Saturation
effect give @a[tag=lobby.player] resistance 2 100 true
effect give @a[tag=lobby.player] saturation 2 100 true

# Anti-Knockback
execute as @a[tag=lobby.player] run attribute @s minecraft:knockback_resistance modifier add lobby:knockback_resistance 1 add_value

# Stats
item replace entity @a[tag=lobby.new] hotbar.8 with minecraft:globe_banner_pattern[item_name={"text":"Statistics","color":"green","italic":false}, lore=[{"text":"Drop this item to view","color":"dark_gray"},{"text":"global statistics.","color":"dark_gray"}],consumable={consume_seconds:0,animation:"none",sound:{sound_id:"",range:0},has_consume_particles:false}] 1
tag @a[tag=lobby.new] remove lobby.new
execute as @a[tag=lobby.player,tag=!lobby.new] unless entity @s[nbt={Inventory:[{id:"minecraft:globe_banner_pattern"}]}] at @s as @p run function stats:preview
execute as @a[tag=lobby.player,tag=!lobby.new] unless entity @s[nbt={Inventory:[{id:"minecraft:globe_banner_pattern"}]}] at @s as @p run item replace entity @s hotbar.8 with minecraft:globe_banner_pattern[item_name={"text":"Statistics","color":"green","italic":false}, lore=[{"text":"Drop this item to view","color":"dark_gray"},{"text":"global statistics.","color":"dark_gray"}],consumable={consume_seconds:0,animation:"none",sound:{sound_id:"",range:0},has_consume_particles:false}] 1

execute if score #game_state var matches 0 run spawnpoint @a 2000 100 0

item replace entity @a[tag=lobby.player] armor.head with air
item replace entity @a[tag=lobby.player] armor.chest with air
item replace entity @a[tag=lobby.player] armor.legs with air
item replace entity @a[tag=lobby.player] armor.feet with air

gamemode spectator @a[tag=spectator]

execute as @a[tag=lobby.player] at @s if block ~ ~-2 ~ orange_shulker_box run function juggernaut:start_pregame
execute as @a[tag=lobby.player] at @s if block ~ ~-2 ~ cyan_shulker_box run function survival:start
execute as @a[tag=lobby.player] at @s if block ~ ~-2 ~ purple_shulker_box run function tp:lobby