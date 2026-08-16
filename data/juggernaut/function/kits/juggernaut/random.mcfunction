scoreboard players set #roll var 0
execute store result score #roll var run random value 1..12

execute if score #roll var matches 1 run function juggernaut:kits/juggernaut/chameleon
execute if score #roll var matches 2 run function juggernaut:kits/juggernaut/dragon
execute if score #roll var matches 3 run function juggernaut:kits/juggernaut/fishmonger
execute if score #roll var matches 4 run function juggernaut:kits/juggernaut/hunter
execute if score #roll var matches 5 run function juggernaut:kits/juggernaut/juggernaut
execute if score #roll var matches 6 run function juggernaut:kits/juggernaut/knight
execute if score #roll var matches 7 run function juggernaut:kits/juggernaut/predator
execute if score #roll var matches 8 run function juggernaut:kits/juggernaut/spirit_walker
execute if score #roll var matches 9 run function juggernaut:kits/juggernaut/timekeeper
execute if score #roll var matches 10 run function juggernaut:kits/juggernaut/warlock
execute if score #roll var matches 11 run function juggernaut:kits/juggernaut/witch_doctor
execute if score #roll var matches 12 run function juggernaut:kits/juggernaut/phantom