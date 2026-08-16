execute unless entity @s[type=dolphin] if block ~ ~-0.1 ~ water run function juggernaut:effects/apply_effect {effect:"fatigued",duration:2}
execute if entity @s[type=goat] unless entity @s[tag=using_fury] unless entity @s[tag=fatigued] run function juggernaut:abilities/beast_tamer/place_target_pos {speed:0.35}
execute if entity @s[type=dolphin] unless entity @s[tag=using_fury] unless entity @s[tag=fatigued] run function juggernaut:abilities/beast_tamer/place_target_pos {speed:0.4}
execute if entity @s[type=blaze] unless entity @s[tag=using_fury] unless entity @s[tag=fatigued] run function juggernaut:abilities/beast_tamer/place_target_pos {speed:0.2}

execute if entity @s[type=goat] if entity @s[tag=using_fury] unless entity @s[tag=fatigued] run function juggernaut:abilities/beast_tamer/place_target_pos {speed:0.385}
execute if entity @s[type=dolphin] if entity @s[tag=using_fury] unless entity @s[tag=fatigued] run function juggernaut:abilities/beast_tamer/place_target_pos {speed:0.44}
execute if entity @s[type=blaze] if entity @s[tag=using_fury] unless entity @s[tag=fatigued] run function juggernaut:abilities/beast_tamer/place_target_pos {speed:0.22}

execute if entity @s[tag=fatigued] run function juggernaut:abilities/beast_tamer/place_target_pos {speed:0.1}

scoreboard players set #mx tmp 0
scoreboard players set #mz tmp 0

execute store result score #vx tmp run data get entity @s Pos[0] 1000
execute store result score #vz tmp run data get entity @s Pos[2] 1000

execute as @e[tag=mv] run function juggernaut:abilities/beast_tamer/accumulate
kill @e[tag=mv]

execute store result entity @s Motion[0] double 0.001 run scoreboard players get #mx tmp
execute store result entity @s Motion[2] double 0.001 run scoreboard players get #mz tmp

execute on passengers if predicate {condition:"entity_properties",entity:"this",predicate:{"type_specific/player":{input:{jump:true}}}} on vehicle if entity @s[type=goat] if entity @s[nbt={OnGround:1b}] run data modify entity @s Motion[1] set value 0.62
execute on passengers if predicate {condition:"entity_properties",entity:"this",predicate:{"type_specific/player":{input:{jump:true}}}} on vehicle if entity @s[type=dolphin] if block ~ ~1.5 ~ #juggernaut:underwater_permeables run data modify entity @s Motion[1] set value 0.2
execute on passengers unless predicate {condition:"entity_properties",entity:"this",predicate:{"type_specific/player":{input:{jump:true}}}} on vehicle if entity @s[type=dolphin] if block ~ ~1.5 ~ #juggernaut:underwater_permeables run data modify entity @s Motion[1] set value -0.03
execute on passengers if predicate {condition:"entity_properties",entity:"this",predicate:{"type_specific/player":{input:{sprint:true}}}} on vehicle if entity @s[type=blaze] run data modify entity @s Motion[1] set value -1
execute on passengers if predicate {condition:"entity_properties",entity:"this",predicate:{"type_specific/player":{input:{jump:true}}}} on vehicle if entity @s[type=blaze] if entity @s[tag=flight_unlocked] run data modify entity @s Motion[1] set value 0.2
execute on passengers if predicate {condition:"entity_properties",entity:"this",predicate:{"type_specific/player":{input:{jump:true}}}} on vehicle if entity @s[type=blaze] unless entity @s[tag=flight_unlocked] if entity @s[nbt={OnGround:true}] run data modify entity @s Motion[1] set value 0.62