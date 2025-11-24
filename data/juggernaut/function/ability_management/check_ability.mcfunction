$execute as @a[tag=$(player_tag),nbt={Inventory:[{id:"$(item_id)"}]}] if items entity @s inventory.* $(item_id) run clear @s $(item_id)
$execute as @a[tag=$(player_tag),nbt={Inventory:[{id:"$(item_id)"}]}] if items entity @s player.cursor $(item_id) run clear @s $(item_id)
$execute as @a[tag=$(player_tag),nbt={Inventory:[{id:"$(item_id)"}]}] if items entity @s weapon.offhand $(item_id) run clear @s $(item_id)
$execute as @a[tag=$(player_tag),nbt={Inventory:[{id:"minecraft:barrier"}]}] if items entity @s inventory.* minecraft:barrier run clear @s minecraft:barrier
$execute as @a[tag=$(player_tag),nbt={Inventory:[{id:"minecraft:barrier"}]}] if items entity @s player.cursor minecraft:barrier run clear @s minecraft:barrier
$execute as @a[tag=$(player_tag),nbt={Inventory:[{id:"minecraft:barrier"}]}] if items entity @s weapon.offhand minecraft:barrier run clear @s minecraft:barrier
$execute as @a[tag=$(player_tag)] if score @s $(cooldown_var) matches 0 run item replace entity @s $(hotbar_slot) with $(item_id)[item_name=[$(item_name),{"text": " | ","color": "dark_gray","bold": true},{"text": "READY","color": "green","bold": true}],custom_data={kit:$(player_tag),ability_id:"$(ability_id)"}]
$execute as @a[tag=$(player_tag)] if score @s $(cooldown_var) matches 1.. run item replace entity @s $(hotbar_slot) with barrier[item_name=[$(item_name),{"text": " | ","color": "dark_gray","bold": true},{"text": "ON COOLDOWN","color": "red","bold": true}]]
$execute as @a[tag=$(player_tag)] at @s if entity @e[type=item,nbt={Item:{id:"$(item_id)",components:{"minecraft:custom_data":{kit:$(player_tag),ability_id:"$(ability_id)"}}}},distance=..3] if score #game_state var matches 11 run function juggernaut:ability_management/use_ability {\
    player_tag:$(player_tag),\
    cooldown:$(cooldown),\
    item_name:$(item_name),\
    hotbar_slot:$(hotbar_slot),\
    cooldown_var:$(cooldown_var),\
    ability_id:"$(ability_id)",\
}
$execute as @a[tag=$(player_tag)] at @s if entity @e[type=item,nbt={Item:{id:"$(item_id)",components:{"minecraft:custom_data":{kit:$(player_tag),ability_id:"$(ability_id)"}}}},distance=..3] if score #game_state var matches 10..12 unless score #game_state var matches 11 run particle angry_villager ~ ~ ~ 0.5 1 0.5 0 60 force @s
$execute as @a[tag=$(player_tag)] at @s if entity @e[type=item,nbt={Item:{id:"$(item_id)",components:{"minecraft:custom_data":{kit:$(player_tag),ability_id:"$(ability_id)"}}}},distance=..3] if score #game_state var matches 10..12 unless score #game_state var matches 11 run scoreboard players set @s $(cooldown_var) 2
$execute as @a[tag=$(player_tag)] at @s if entity @e[type=item,nbt={Item:{id:"$(item_id)",components:{"minecraft:custom_data":{kit:$(player_tag),ability_id:"$(ability_id)"}}}},distance=..3] run clear @s $(item_id)
$execute as @a[tag=$(player_tag)] at @s as @e[type=item,nbt={Item:{id:"$(item_id)",components:{"minecraft:custom_data":{kit:$(player_tag),ability_id:"$(ability_id)"}}}},distance=..3] run kill @s