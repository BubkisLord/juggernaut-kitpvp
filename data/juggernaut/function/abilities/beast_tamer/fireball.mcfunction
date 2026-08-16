execute as @p[tag=beast_tamer] at @s run function juggernaut:abilities/beast_tamer/shoot_fireball with entity @s
execute if entity @s[tag=beast_tamer] run schedule function juggernaut:abilities/beast_tamer/fireball 0.33s append
execute if entity @s[tag=beast_tamer] run schedule function juggernaut:abilities/beast_tamer/fireball 0.66s append