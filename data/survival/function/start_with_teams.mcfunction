execute store result score #playercount var run list
scoreboard players set #affected_players var 0
scoreboard players set #survival_teams var 1

execute if score #playercount var matches ..1 run return fail
execute if score #playercount var matches 2 as @a run function survival:team_selection/two_teams
execute if score #playercount var matches 3 run function survival:team_selection/three_teams
execute if score #playercount var matches 4..5 as @a run function survival:team_selection/two_teams
execute if score #playercount var matches 6 as @a run function survival:team_selection/three_teams
execute if score #playercount var matches 7..8 as @a run function survival:team_selection/two_teams
execute if score #playercount var matches 9 as @a run function survival:team_selection/three_teams
execute if score #playercount var matches 10.. as @a run function survival:team_selection/two_teams

function survival:start