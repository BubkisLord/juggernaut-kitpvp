# stop when we've picked enough
execute if score #round_robin_iterations var = #juggernaut_customisation juggernaut_count run return fail

# new cycle once every eligible player has had a turn (same filter as the pick)
execute unless entity @a[scores={health=1..,jug_ticker=0},tag=!juggernaut] run scoreboard players set @a[tag=!juggernaut] jug_ticker 0

# pick one, using a temp tag so only the new pick is touched
tag @a[limit=1,sort=random,scores={health=1..,jug_ticker=0},tag=!juggernaut] add jug_new
scoreboard players set @a[tag=jug_new] jug_ticker 1
tag @a[tag=jug_new] add juggernaut
tag @a[tag=jug_new] remove jug_new

# only count successful picks
scoreboard players add #round_robin_iterations var 1
function juggernaut:perform_round_robin