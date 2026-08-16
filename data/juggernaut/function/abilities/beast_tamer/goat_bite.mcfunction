# Will execute the ability as the player initially. To fix this it just re-executes as the wolf instead.
execute if entity @s[type=player] on vehicle run function juggernaut:abilities/beast_tamer/goat_bite
execute if entity @s[type=player] run return fail

playsound entity.goat.screaming.prepare_ram master @a ~ ~ ~ 2 0.8

execute at @s rotated as @s run summon marker ^ ^ ^1 {Tags:["bite_target","kill_on_end_game"]}
execute store result score #px tmp run data get entity @e[tag=bite_target,limit=1] Pos[0] 1000
execute store result score #pz tmp run data get entity @e[tag=bite_target,limit=1] Pos[2] 1000
kill @e[tag=bite_target]

execute store result score #sx tmp run data get entity @s Pos[0] 1000
execute store result score #sz tmp run data get entity @s Pos[2] 1000
scoreboard players operation #px tmp -= #sx tmp
scoreboard players operation #pz tmp -= #sz tmp

execute store result entity @s Motion[0] double 0.001 run scoreboard players get #px tmp
execute store result entity @s Motion[2] double 0.001 run scoreboard players get #pz tmp

execute rotated ~ 0 positioned ^ ^ ^0.75 if entity @a[tag=runner,distance=..3.5] run function juggernaut:effects/apply_effect {effect:"fatigued",duration:5}
execute rotated ~ 0 positioned ^ ^ ^0.75 run damage @p[tag=runner,distance=..3.5] 8 minecraft:mob_attack by @s