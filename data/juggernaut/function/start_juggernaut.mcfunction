tellraw @a [{"text": "Juggernaut","color": "dark_red"},{"text": " is starting!","color": "gray"}]

execute as @a[tag=chameleon] run function juggernaut:handle_kit_picked {"kit": "chameleon"}
execute as @a[tag=dragon] run function juggernaut:handle_kit_picked {"kit": "dragon"}
execute as @a[tag=fishmonger] run function juggernaut:handle_kit_picked {"kit": "fishmonger"}
execute as @a[tag=hunter] run function juggernaut:handle_kit_picked {"kit": "hunter"}
execute as @a[tag=classic_jug] run function juggernaut:handle_kit_picked {"kit": "classic_juggernaut"}
execute as @a[tag=jug_knight] run function juggernaut:handle_kit_picked {"kit": "knight"}
execute as @a[tag=predator] run function juggernaut:handle_kit_picked {"kit": "predator"}
execute as @a[tag=spirit_walker] run function juggernaut:handle_kit_picked {"kit": "spirit_walker"}
execute as @a[tag=timekeeper] run function juggernaut:handle_kit_picked {"kit": "timekeeper"}
execute as @a[tag=warlock] run function juggernaut:handle_kit_picked {"kit": "warlock"}
execute as @a[tag=witch_doctor] run function juggernaut:handle_kit_picked {"kit": "witch_doctor"}
execute as @a[tag=engineer] run function juggernaut:handle_kit_picked {"kit": "engineer"}
execute as @a[tag=escapist] run function juggernaut:handle_kit_picked {"kit": "escapist"}
execute as @a[tag=ghost] run function juggernaut:handle_kit_picked {"kit": "ghost"}
execute as @a[tag=guide] run function juggernaut:handle_kit_picked {"kit": "guide"}
execute as @a[tag=medic] run function juggernaut:handle_kit_picked {"kit": "medic"}
execute as @a[tag=rogue] run function juggernaut:handle_kit_picked {"kit": "rogue"}
execute as @a[tag=scout] run function juggernaut:handle_kit_picked {"kit": "scout"}
execute as @a[tag=survivor] run function juggernaut:handle_kit_picked {"kit": "survivor"}
execute as @a[tag=trickster] run function juggernaut:handle_kit_picked {"kit": "trickster"}
execute as @a[tag=windrunner] run function juggernaut:handle_kit_picked {"kit": "windrunner"}

# Sets the timer to be 25 seconds.
execute if score #juggernaut_customisation debug_mode matches 0 run scoreboard players set @a[tag=juggernaut] juggernaut_release_timer 25
execute if score #juggernaut_customisation debug_mode matches 1 run scoreboard players set @a[tag=juggernaut] juggernaut_release_timer 1

# Score for the juggernaut game time left is set to the max time (300 seconds) plus the release timer (25 seconds)
# This is for when the game time is capped. (Optional)
# scoreboard players set @a[tag=juggernaut] juggernaut_game_time 325

tag @a remove in_chase

execute if entity @a[tag=runner] run tp @a[tag=runner] @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute if score #juggernaut_customisation debug_mode matches 1 run tp @a[tag=juggernaut] @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]

scoreboard players add @a[tag=survivor] lives 1
scoreboard players add @a[tag=survivor] lives_remaining 1

# Set all healing progress to 0
scoreboard players set @a healing_progress 0

tag @a remove saved_skin

scoreboard players set #game_state var 12

effect clear @a weakness
execute as @a run attribute @s attack_damage modifier remove minecraft:effect.weakness