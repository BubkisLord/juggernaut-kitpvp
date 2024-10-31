scoreboard players add #affected_players var 1
execute if score #affected_players var <= #playercount var run team join blue @r[team=!blue,team=!red,team=!green]
scoreboard players add #affected_players var 1
execute if score #affected_players var <= #playercount var run team join red @r[team=!blue,team=!red,team=!green]
scoreboard players add #affected_players var 1
execute if score #affected_players var <= #playercount var run team join green @r[team=!blue,team=!red,team=!green]