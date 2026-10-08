# Only usable in chase.
execute if entity @s[tag=!in_chase] run scoreboard players set @s ability_cooldown0 4000
execute if entity @s[tag=!in_chase] run particle angry_villager ~ ~ ~ 0.5 1 0.5 0 60 force @s
execute if entity @s[tag=!in_chase] run playsound block.note_block.didgeridoo ui @s ~ ~ ~ 1.2
execute if entity @s[tag=!in_chase] run return fail

# Random direction (stored as an int so it substitutes cleanly), and cap the landing height at 4 blocks above the Juggernaut.
execute store result storage juggernaut:abilities/trickster/misty_step rotation int 1 run random value 0..359
execute store result score #y var run data get entity @p[tag=juggernaut,tag=in_chase] Pos[1]
execute store result storage juggernaut:abilities/trickster/misty_step max_height int 1 run scoreboard players add #y var 4

# Try to teleport. #misty_step_ok only becomes 1 if spreadplayers actually moved us.
scoreboard players set #misty_step_ok var 0
function juggernaut:abilities/trickster/perform_spreadplayers with storage juggernaut:abilities/trickster/misty_step
execute if score #misty_step_ok var matches 1 run return 1

# Nowhere safe to land (or no Juggernaut in chase): don't burn the full cooldown, and tell the player.
scoreboard players set @s ability_cooldown0 4000
particle angry_villager ~ ~ ~ 0.5 1 0.5 0 60 force @s
playsound block.note_block.bass master @s ~ ~ ~ 1 0.5
return fail
