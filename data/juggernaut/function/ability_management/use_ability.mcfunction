# Set the cooldown first so if the ability fails the correct cooldown is set
$scoreboard players set @s $(cooldown_var) $(cooldown)

# Get the ability id
execute store result score #ability_id var run data get storage juggernaut:ability_management/use_ability ability_id

# Run the ability
$execute if score #ability_id var matches 1.. run function juggernaut:ability_management/$(player_tag)_ability_$(ability_id)
$execute if score #ability_id var matches 0 run function juggernaut:ability_management/$(player_tag)_ability

# Replace the item with a barrier, showing the player the ability is on cooldown
$item replace entity @s $(hotbar_slot) with barrier[item_name='[$(item_name),{"text": " | ","color": "dark_gray","bold": true},{"text": "ON COOLDOWN","color": "red","bold": true}]']