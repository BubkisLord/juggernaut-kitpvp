scoreboard players set #roll var 0
execute store result score #roll var run random value 1..11

execute if score #roll var matches 1 run function juggernaut:kits/runner/engineer
execute if score #roll var matches 2 run function juggernaut:kits/runner/escapist
execute if score #roll var matches 3 run function juggernaut:kits/runner/ghost
execute if score #roll var matches 4 run function juggernaut:kits/runner/guide
execute if score #roll var matches 5 run function juggernaut:kits/runner/medic
execute if score #roll var matches 6 run function juggernaut:kits/runner/rogue
execute if score #roll var matches 7 run function juggernaut:kits/runner/scout
execute if score #roll var matches 8 run function juggernaut:kits/runner/survivor
execute if score #roll var matches 9 run function juggernaut:kits/runner/trickster
execute if score #roll var matches 10 run function juggernaut:kits/runner/jester
execute if score #roll var matches 11 run function juggernaut:kits/runner/puppeteer