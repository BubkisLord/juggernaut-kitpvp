tellraw @a [{"text": "Juggernaut","color": "dark_red"},{"text": " is starting!","color": "gray"}]

# Sets the timer to be 25 seconds.
scoreboard players set @a[tag=juggernaut] juggernaut_release_timer 25

# Score for the juggernaut game time left is set to the max time (300 seconds) plus the release timer (25 seconds)
# This is for when the game time is capped. (Optional)
# scoreboard players set @a[tag=juggernaut] juggernaut_game_time 325

tp @a[tag=runner] @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute as @a[tag=runner,nbt={Inventory:[{id:"minecraft:danger_pottery_sherd",Slot:9b}]}] run tag @s add using_sentinel
execute as @a[tag=runner,nbt={Inventory:[{id:"minecraft:heart_pottery_sherd",Slot:9b}]}] run tag @s add using_self_preservation
execute as @a[tag=runner,nbt={Inventory:[{id:"minecraft:heartbreak_pottery_sherd",Slot:9b}]}] run tag @s add using_fractured_aid
execute as @a[tag=runner,nbt={Inventory:[{id:"minecraft:scrape_pottery_sherd",Slot:9b}]}] run tag @s add using_blood_pact
execute as @a[tag=runner,nbt={Inventory:[{id:"minecraft:burn_pottery_sherd",Slot:9b}]}] run tag @s add using_flame_ward
execute as @a[tag=runner,nbt={Inventory:[{id:"minecraft:flow_pottery_sherd",Slot:9b}]}] run tag @s add using_quickened_stealth
execute as @a[tag=runner,nbt={Inventory:[{id:"minecraft:brewer_pottery_sherd",Slot:9b}]}] run give @s splash_potion[potion_contents={potion:"strong_healing"},max_stack_size=8] 8
execute as @a[tag=runner,nbt={Inventory:[{id:"minecraft:skull_pottery_sherd",Slot:9b}]}] run tag @s add using_undying_ties
execute as @a[tag=runner,nbt={Inventory:[{id:"minecraft:prize_pottery_sherd",Slot:9b}]}] run tag @s add using_unwavering_strength

execute store result score @a[tag=survivor] lives run scoreboard players get #juggernaut_count var
scoreboard players add @a[tag=survivor] lives 2

# Set all healing progress to 0
scoreboard players set @a healing_progress 0

# Turns on the game running variable.
scoreboard players set #game_state var 11
