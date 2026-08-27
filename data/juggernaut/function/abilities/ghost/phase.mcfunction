scoreboard players set #phase_hit var 0
execute anchored eyes if block ^ ^ ^2 #juggernaut:raycast_permeable if block ^ ^1 ^2 #juggernaut:raycast_permeable run scoreboard players set #phase_hit var 1
execute if score #phase_hit var matches 1 anchored eyes run tp @s ^ ^ ^2

execute if score #phase_hit var matches 0 anchored eyes if block ^ ^ ^3 #juggernaut:raycast_permeable if block ^ ^1 ^3 #juggernaut:raycast_permeable run scoreboard players set #phase_hit var 1
execute if score #phase_hit var matches 1 unless block ^ ^ ^2 #juggernaut:raycast_permeable anchored eyes run tp @s ^ ^ ^3

execute if score #phase_hit var matches 0 anchored eyes if block ^ ^ ^4 #juggernaut:raycast_permeable if block ^ ^1 ^4 #juggernaut:raycast_permeable run scoreboard players set #phase_hit var 1
execute if score #phase_hit var matches 1 unless block ^ ^ ^2 #juggernaut:raycast_permeable unless block ^ ^ ^3 #juggernaut:raycast_permeable anchored eyes run tp @s ^ ^ ^4

execute if score #phase_hit var matches 0 run scoreboard players set @s ability_cooldown1 4000
execute if score #phase_hit var matches 0 run playsound block.note_block.didgeridoo ui @s ~ ~ ~ 1.2
execute if score #phase_hit var matches 0 run particle angry_villager ~ ~ ~ 0.3 0.5 0.3 0 10 force @s