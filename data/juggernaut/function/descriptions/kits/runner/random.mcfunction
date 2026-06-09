scoreboard players set #roll var 0
execute store result score #roll var run random value 1..9

execute if score #roll var matches 1 run function juggernaut:surv_kits/engineer
execute if score #roll var matches 2 run function juggernaut:surv_kits/escapist
execute if score #roll var matches 3 run function juggernaut:surv_kits/ghost
execute if score #roll var matches 4 run function juggernaut:surv_kits/guide
execute if score #roll var matches 5 run function juggernaut:surv_kits/medic
execute if score #roll var matches 6 run function juggernaut:surv_kits/rogue
execute if score #roll var matches 7 run function juggernaut:surv_kits/scout
execute if score #roll var matches 8 run function juggernaut:surv_kits/survivor
execute if score #roll var matches 9 run function juggernaut:surv_kits/trickster