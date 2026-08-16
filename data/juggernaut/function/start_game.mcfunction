tellraw @a [{"text": "Juggernaut","color": "red"},{"text": " is starting!","color": "gray"}]

execute as @a[tag=chameleon] run function stats:handle_kit_picked {"kit": "chameleon"}
execute as @a[tag=dragon] run function stats:handle_kit_picked {"kit": "dragon"}
execute as @a[tag=fishmonger] run function stats:handle_kit_picked {"kit": "fishmonger"}
execute as @a[tag=hunter] run function stats:handle_kit_picked {"kit": "hunter"}
execute as @a[tag=classic_jug] run function stats:handle_kit_picked {"kit": "classic_juggernaut"}
execute as @a[tag=knight] run function stats:handle_kit_picked {"kit": "knight"}
execute as @a[tag=predator] run function stats:handle_kit_picked {"kit": "predator"}
execute as @a[tag=spirit_walker] run function stats:handle_kit_picked {"kit": "spirit_walker"}
execute as @a[tag=timekeeper] run function stats:handle_kit_picked {"kit": "timekeeper"}
execute as @a[tag=warlock] run function stats:handle_kit_picked {"kit": "warlock"}
execute as @a[tag=witch_doctor] run function stats:handle_kit_picked {"kit": "witch_doctor"}
execute as @a[tag=engineer] run function stats:handle_kit_picked {"kit": "engineer"}
execute as @a[tag=escapist] run function stats:handle_kit_picked {"kit": "escapist"}
execute as @a[tag=ghost] run function stats:handle_kit_picked {"kit": "ghost"}
execute as @a[tag=guide] run function stats:handle_kit_picked {"kit": "guide"}
execute as @a[tag=medic] run function stats:handle_kit_picked {"kit": "medic"}
execute as @a[tag=rogue] run function stats:handle_kit_picked {"kit": "rogue"}
execute as @a[tag=scout] run function stats:handle_kit_picked {"kit": "scout"}
execute as @a[tag=survivor] run function stats:handle_kit_picked {"kit": "survivor"}
execute as @a[tag=trickster] run function stats:handle_kit_picked {"kit": "trickster"}
execute as @a[tag=phantom] run function stats:handle_kit_picked {"kit": "phantom"}
execute as @a[tag=jester] run function stats:handle_kit_picked {"kit": "jester"}
execute as @a[tag=puppeteer] run function stats:handle_kit_picked {"kit": "puppeteer"}
execute as @a[tag=beast_tamer] run function stats:handle_kit_picked {"kit": "beast_tamer"}

execute as @a run attribute @s knockback_resistance modifier remove lobby:knockback_resistance

execute as @a[tag=using_quickened_stealth] run attribute @s sneaking_speed modifier add juggernaut:quickened_stealth_speed 1.2 add_multiplied_base

execute as @a[tag=using_durable] run effect give @s health_boost infinite 1 true
execute as @a[tag=using_durable] run effect give @s regeneration 2 255 true

execute as @a[tag=using_healthy_preparation] run give @s splash_potion[potion_contents={potion:"strong_healing"},max_stack_size=2] 2 

execute as @a[tag=using_fury] run attribute @s movement_speed modifier add juggernaut:fury 0.1 add_multiplied_base
execute as @a[tag=using_adept_stalker] run attribute @s sneaking_speed modifier add juggernaut:adept_stalker 0.1 add_multiplied_base

execute as @a[tag=using_teeny_weeny] run attribute @s scale modifier add teeny_weeny -0.25 add_multiplied_base

execute as @a[tag=using_lightweight] run attribute @s safe_fall_distance modifier add juggernaut:lightweight 9999 add_value

execute if entity @a[tag=jester] run function juggernaut:abilities/jester/generate_rolls
execute if entity @a[tag=jester] run function juggernaut:abilities/jester/generate_rolls
execute if entity @a[tag=jester] run function juggernaut:abilities/jester/generate_rolls

# Sets the timer to be 25 seconds.
execute if score #juggernaut_customisation debug_mode matches 0 run scoreboard players set @a[tag=juggernaut] juggernaut_release_timer 25
execute if score #juggernaut_customisation debug_mode matches 1 run scoreboard players set @a[tag=juggernaut] juggernaut_release_timer 1

tag @a remove in_chase

execute if entity @a[tag=runner] run tp @a[tag=runner] @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute if score #juggernaut_customisation debug_mode matches 1 run tp @a[tag=juggernaut] @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]

scoreboard players add @a[tag=survivor] lives 1
scoreboard players add @a[tag=survivor] lives_remaining 1

# Set all healing progress to 0
scoreboard players set @a healing_progress 0

tag @a remove saved_skin

scoreboard players set #game_state var 12

clear @a egg