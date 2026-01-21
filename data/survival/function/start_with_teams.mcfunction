execute as @a[scores={health=1..}] run scoreboard players add #playercount var 1
scoreboard players set #affected_players var 0
scoreboard players set #survival_teams var 1
execute if score #playercount var matches ..1 run return fail
scoreboard players operation #playercount_remainder_3 var = #playercount var
scoreboard players operation #playercount_remainder_3 var %= #3 var
scoreboard players operation #playercount_remainder_4 var = #playercount var
scoreboard players operation #playercount_remainder_4 var %= #4 var

execute if score #playercount_remainder_3 var matches 0 as @a run function survival:team_selection/three_teams
execute unless score #playercount_remainder_3 var matches 0 if score #playercount var matches 8.. if score #playercount_remainder_4 var matches 0 as @a run function survival:team_selection/four_teams
execute unless score #playercount_remainder_3 var matches 0 if score #playercount var matches ..7 as @a run function survival:team_selection/two_teams
execute unless score #playercount_remainder_4 var matches 0 unless score #playercount_remainder_3 var matches 0 if score #playercount var matches 8.. as @a run function survival:team_selection/two_teams