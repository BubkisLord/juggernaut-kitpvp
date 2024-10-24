execute as @s[tag=!has_jug_kit] run item replace entity @s armor.head with iron_helmet[unbreakable={}]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.chest with iron_chestplate[unbreakable={}]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.legs with iron_leggings[unbreakable={}]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.feet with iron_boots[unbreakable={},enchantments={feather_falling:4}]
# Every 2 iterations of the function is one block, so a limit of '40' is 20 blocks.
execute as @s[tag=!has_jug_kit] run scoreboard players set @s raycast_limit 40
execute as @s[tag=!has_jug_kit] run give @s phantom_membrane[item_name='{"text": "Flight"}']
execute as @s[tag=!has_jug_kit] run give @s cooked_beef 32
execute as @s[tag=!has_jug_kit] run tag @s add dragon
tag @s add has_jug_kit