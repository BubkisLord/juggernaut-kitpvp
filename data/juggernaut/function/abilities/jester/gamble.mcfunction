# Run the helper function 3 times
function juggernaut:abilities/jester/generate_rolls

# Trim the rolls list to only 3 rolls
function juggernaut:abilities/jester/remove_roll {idx:4}
function juggernaut:abilities/jester/remove_roll {idx:5}
function juggernaut:abilities/jester/remove_roll {idx:6}

# Grab the first roll in the queue and store it in your scoreboard variable
execute store result score #roll var run data get storage juggernaut:main Rolls[0]

# Remove that roll from the queue (so the next one becomes Rolls[0])
data remove storage juggernaut:main Rolls[0]
data remove storage juggernaut:main Roll_Names[0]

execute if entity @a[tag=juggernaut,tag=!undetectable,distance=..25] run function juggernaut:effects/apply_effect {effect:"jesting",duration:5}

# --- Your Execution Logic ---
execute if score #roll var matches 1 run effect give @a[tag=runner,distance=..8] speed 10 2 true
execute if score #roll var matches 2 run effect give @a[distance=..12,tag=!spectator] darkness 12 0 true
execute if score #roll var matches 3 run effect give @a[tag=juggernaut,distance=..12] slowness 4 0 true
execute if score #roll var matches 4 run effect give @a[distance=..20,tag=!spectator] nausea 20 255 true
execute if score #roll var matches 5 run effect give @a[tag=runner,distance=..8] instant_health 1 1 true
execute if score #roll var matches 6 run effect give @a[tag=juggernaut,tag=!spectator] glowing 12 0 true
execute if score #roll var matches 7 run effect give @a[tag=runner,distance=..8] jump_boost 20 1 true
execute if score #roll var matches 8 run effect give @a[tag=runner,distance=..8] regeneration 8 0 true
execute if score #roll var matches 9 run particle minecraft:campfire_cosy_smoke ~ ~ ~ 5 3 5 0 12000 force
execute if score #roll var matches 9 run effect give @s invisibility 3 0 false
execute if score #roll var matches 10 run summon llama ~ ~ ~ {Invulnerable:1b,Tags:["kill_on_end_game"],equipment:{saddle:{id:"blue_carpet"}},CustomName:{"text":"Lorenzo the Llama",font:"minecraft:uniform"}}

function juggernaut:abilities/jester/spawn_fireworks