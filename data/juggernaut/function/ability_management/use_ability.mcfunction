# Set the cooldown first so if the ability fails the correct cooldown is set
$scoreboard players set @s $(cooldown_var) $(cooldown)

# Run the ability
$execute as @s at @s run function juggernaut:abilities/$(player_tag)/$(ability_id)

# Replace the item with a barrier, showing the player the ability is on cooldown
$item replace entity @s $(hotbar_slot) with barrier[item_name=[$(item_name),{"text": " | ","color": "dark_gray","bold": true},{"text": "ON COOLDOWN","color": "red","bold": true}]]