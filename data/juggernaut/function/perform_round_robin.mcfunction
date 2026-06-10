execute if score #round_robin_iterations var = #juggernaut_customisation juggernaut_count run return fail
tag @a[limit=1,sort=random,scores={health=1..,jug_ticker=0},tag=!juggernaut] add juggernaut
execute as @a[tag=juggernaut,scores={jug_ticker=0}] run scoreboard players set @s jug_ticker 1
execute unless entity @a[scores={jug_ticker=0}] run scoreboard players set @a jug_ticker 0
scoreboard players add #round_robin_iterations var 1
function juggernaut:perform_round_robin