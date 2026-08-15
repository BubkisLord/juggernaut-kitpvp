# Will execute the ability as the player initially. To fix this it just re-executes as the wolf instead.
execute if entity @s[type=player] on vehicle run function juggernaut:abilities/beast_tamer/goat_ram
execute if entity @s[type=player] run return fail

playsound item.goat_horn.sound.1 master @a ~ ~ ~ 2 0.8

tag @s add pouncing
tag @s remove pounce_hit
execute at @s rotated as @s run summon marker ^ ^ ^2 {Tags:["pounce_target","kill_on_end_game"]}
execute store result score #px tmp run data get entity @e[tag=pounce_target,limit=1] Pos[0] 1000
execute store result score #pz tmp run data get entity @e[tag=pounce_target,limit=1] Pos[2] 1000
kill @e[tag=pounce_target]

execute store result score #sx tmp run data get entity @s Pos[0] 1000
execute store result score #sz tmp run data get entity @s Pos[2] 1000
scoreboard players operation #px tmp -= #sx tmp
scoreboard players operation #pz tmp -= #sz tmp

execute store result entity @s Motion[0] double 0.001 run scoreboard players get #px tmp
execute store result entity @s Motion[2] double 0.001 run scoreboard players get #pz tmp
data modify entity @s Motion[1] set value 0.4