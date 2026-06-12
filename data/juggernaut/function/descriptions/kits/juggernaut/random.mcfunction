scoreboard players set #roll var 0
execute store result score #roll var run random value 1..12

execute if score #roll var matches 1 run function juggernaut:jug_kits/chameleon
execute if score #roll var matches 2 run function juggernaut:jug_kits/dragon
execute if score #roll var matches 3 run function juggernaut:jug_kits/fishmonger
execute if score #roll var matches 4 run function juggernaut:jug_kits/hunter
execute if score #roll var matches 5 run function juggernaut:jug_kits/juggernaut
execute if score #roll var matches 6 run function juggernaut:jug_kits/knight
execute if score #roll var matches 7 run function juggernaut:jug_kits/predator
execute if score #roll var matches 8 run function juggernaut:jug_kits/spirit_walker
execute if score #roll var matches 9 run function juggernaut:jug_kits/timekeeper
execute if score #roll var matches 10 run function juggernaut:jug_kits/warlock
execute if score #roll var matches 11 run function juggernaut:jug_kits/witch_doctor
execute if score #roll var matches 12 run function juggernaut:jug_kits/eclipse_stalker