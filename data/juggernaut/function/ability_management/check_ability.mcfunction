$execute as @a[tag=$(player_tag),nbt={Inventory:[{id:"$(item_id)"}]}] if items entity @s inventory.* $(item_id) run clear @s $(item_id)
$execute as @a[tag=$(player_tag),nbt={Inventory:[{id:"$(item_id)"}]}] if items entity @s player.cursor $(item_id) run clear @s $(item_id)
$execute as @a[tag=$(player_tag),nbt={Inventory:[{id:"$(item_id)"}]}] if items entity @s weapon.offhand $(item_id) run clear @s $(item_id)
$execute as @a[tag=$(player_tag),nbt={Inventory:[{id:"minecraft:barrier"}]}] if items entity @s inventory.* minecraft:barrier run clear @s minecraft:barrier
$execute as @a[tag=$(player_tag),nbt={Inventory:[{id:"minecraft:barrier"}]}] if items entity @s player.cursor minecraft:barrier run clear @s minecraft:barrier
$execute as @a[tag=$(player_tag),nbt={Inventory:[{id:"minecraft:barrier"}]}] if items entity @s weapon.offhand minecraft:barrier run clear @s minecraft:barrier
$data modify storage juggernaut:ability_management/check_ability_owner player_tag set value $(player_tag)
$data modify storage juggernaut:ability_management/check_ability_owner cooldown set value $(cooldown)
$data modify storage juggernaut:ability_management/check_ability_owner item_name set value $(item_name)
$data modify storage juggernaut:ability_management/check_ability_owner hotbar_slot set value $(hotbar_slot)
$data modify storage juggernaut:ability_management/check_ability_owner cooldown_var set value $(cooldown_var)
$data modify storage juggernaut:ability_management/check_ability_owner ability_id set value $(ability_id)
$execute as @a[tag=$(player_tag),scores={$(cooldown_var)=..0},tag=!spectator] at @s if score #game_state var matches 11 unless items entity @s $(hotbar_slot) * run playsound block.note_block.bit master @s ~ ~ ~ 1 0.2
$execute as @a[tag=$(player_tag),scores={$(cooldown_var)=..0},tag=!spectator] at @s if score #game_state var matches 11 unless items entity @s $(hotbar_slot) * run function juggernaut:ability_management/use_ability with storage juggernaut:ability_management/check_ability_owner
$execute as @a[tag=$(player_tag),tag=!spectator] if score @s $(cooldown_var) matches 0 run item replace entity @s $(hotbar_slot) with $(item_id)[item_name=[$(item_name),{"text": " | ","color": "dark_gray","bold": true},{"text": "READY","color": "green","bold": true}],custom_data={kit:$(player_tag),ability_id:"$(ability_id)"},consumable={consume_seconds:0,animation:"none",has_consume_particles:false,sound:{"sound_id":""}},lore=$(description)]
$execute as @a[tag=$(player_tag),tag=!spectator] if score @s $(cooldown_var) matches 1.. run item replace entity @s $(hotbar_slot) with barrier[item_name=[$(item_name),{"text": " | ","color": "dark_gray","bold": true},{"text": "ON COOLDOWN","color": "red","bold": true}],custom_data={kit:$(player_tag),ability_id:"$(ability_id)"},lore=$(description)]
$execute as @a[tag=$(player_tag),tag=!spectator] if score @s $(cooldown_var) matches 1.. run clear @s $(item_id)[item_name=[$(item_name),{"text": " | ","color": "dark_gray","bold": true},{"text": "READY","color": "green","bold": true}],custom_data={kit:$(player_tag),ability_id:"$(ability_id)"}]
xp set @a 28 levels
$execute as @a[tag=$(player_tag)] run scoreboard players operation @s current_cooldown = @s $(cooldown_var)
$execute as @a[tag=$(player_tag)] run scoreboard players operation @s current_cooldown *= #100 var
$execute as @a[tag=$(player_tag)] run scoreboard players set @s tmp $(cooldown)
$execute as @a[tag=$(player_tag)] run scoreboard players operation @s current_cooldown /= @s tmp
$execute as @a[tag=$(player_tag)] store result storage juggernaut:ability_management/check_ability current_cooldown_percentage int 1 run scoreboard players get @s current_cooldown
# tellraw bubkislord {"storage":"juggernaut:ability_management/check_ability_owner",nbt:item_name}
# tellraw bubkislord {"selector":"@s"}
# tellraw bubkislord {"storage":"juggernaut:ability_management/check_ability",nbt:current_cooldown_percentage}

# This is extremely necessary despite looking useless. The storage actually doesnt get set prior so this is needed for the set_xp parsed values
$data modify storage juggernaut:ability_management/check_ability player_tag set value "$(player_tag)"
$data modify storage juggernaut:ability_management/check_ability ability_id set value "$(ability_id)"
execute as @s at @s run function juggernaut:ability_management/set_xp with storage juggernaut:ability_management/check_ability
$execute if score #game_state var matches 10..12 unless score #game_state var matches 11 as @a[tag=ability_owner] run scoreboard players set @s $(cooldown_var) 2