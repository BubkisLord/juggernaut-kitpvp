# Dragon
execute as @a[tag=dragon] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:feather"}},distance=..3] run tag @s remove is_floating
execute as @a[tag=dragon] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:feather"}},distance=..3] run item replace entity @s hotbar.0 with phantom_membrane[item_name={"text": "Flight","bold": true,"color": "green"}]
execute as @a[tag=dragon] at @s as @e[type=item,nbt={Item:{id:"minecraft:feather"}},distance=..3] run kill @s
execute as @a[tag=dragon] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"}},distance=..3] run tag @s add is_floating
execute as @a[tag=dragon] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"}},distance=..3] run item replace entity @s hotbar.0 with feather[item_name={"text": "Walk","bold": true,"color": "dark_green"}]
execute as @a[tag=dragon] at @s as @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"}},distance=..3] run kill @s

execute as @a[tag=dragon] at @s if block ~ ~-5 ~ #juggernaut:non-surface_blocks run attribute @s gravity base set 0.005
execute as @a[tag=dragon] at @s unless block ~ ~-5 ~ #juggernaut:non-surface_blocks run attribute @s gravity base set -0.015
execute as @a[tag=dragon] at @s if block ~ ~-6 ~ #juggernaut:non-surface_blocks unless block ~ ~-5 ~ #juggernaut:non-surface_blocks run attribute @s gravity base set 0
execute as @a[tag=dragon] at @s unless block ~ ~-0.75 ~ #juggernaut:non-surface_blocks run attribute @s gravity base set 0.08
execute as @a[tag=dragon,nbt={Inventory:[{id:"minecraft:feather",count:1}]}] run attribute @s gravity base set -0.01
execute as @a[tag=dragon] if entity @s[scores={is_sneaking=1}] run attribute @s gravity base set 0.01
