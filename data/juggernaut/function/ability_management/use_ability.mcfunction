# Set the cooldown first so if the ability fails the correct cooldown is set
$scoreboard players set @s $(cooldown_var) $(cooldown)
$scoreboard players set @s overclock_damage $(cooldown)
execute store result storage juggernaut:ability_management/overclock_dmg overclock_damage int 0.00005 run scoreboard players get @s overclock_damage
execute if entity @s[tag=using_overclock] run function juggernaut:ability_management/overclock_dmg with storage juggernaut:ability_management/overclock_dmg

# Run the ability
$execute as @s at @s run function juggernaut:abilities/$(player_tag)/$(ability_id)

# Replace the item with a barrier, showing the player the ability is on cooldown
$item replace entity @s $(hotbar_slot) with barrier[item_name=[$(item_name),{"text": " | ","color": "dark_gray","bold": true},{"text": "ON COOLDOWN","color": "red","bold": true}]]