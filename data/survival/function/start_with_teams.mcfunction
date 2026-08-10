scoreboard players set #playercount var 0
execute as @a[scores={health=1..}] run scoreboard players add #playercount var 1
execute if score #playercount var matches ..1 run return fail
scoreboard players operation #playercount_remainder_3 var = #playercount var
scoreboard players operation #playercount_remainder_3 var %= #3 var
scoreboard players operation #playercount_remainder_2 var = #playercount var
scoreboard players operation #playercount_remainder_2 var %= #2 var

scoreboard players set #affected_players var 0

execute if score #playercount var matches 2 as @a run function survival:team_selection/two_teams
execute if score #playercount var matches 3 as @a run function survival:team_selection/three_teams
execute if score #playercount var matches 4 as @a run function survival:team_selection/two_teams
execute if score #playercount var matches 5 as @a run function survival:team_selection/two_teams
execute if score #playercount var matches 6 as @a run function survival:team_selection/three_teams
execute if score #playercount var matches 7 as @a run function survival:team_selection/three_teams
execute if score #playercount var matches 8.. as @a run function survival:team_selection/four_teams