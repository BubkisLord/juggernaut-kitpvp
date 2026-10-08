scoreboard players set #roll var 0
execute store result score #roll var run random value 1..11

execute if score #roll var matches 1 run function juggernaut:kits/runner with storage juggernaut:kits kits[{id:"engineer"}]
execute if score #roll var matches 2 run function juggernaut:kits/runner with storage juggernaut:kits kits[{id:"escapist"}]
execute if score #roll var matches 3 run function juggernaut:kits/runner with storage juggernaut:kits kits[{id:"ghost"}]
execute if score #roll var matches 4 run function juggernaut:kits/runner with storage juggernaut:kits kits[{id:"guide"}]
execute if score #roll var matches 5 run function juggernaut:kits/runner with storage juggernaut:kits kits[{id:"medic"}]
execute if score #roll var matches 6 run function juggernaut:kits/runner with storage juggernaut:kits kits[{id:"rogue"}]
execute if score #roll var matches 7 run function juggernaut:kits/runner with storage juggernaut:kits kits[{id:"scout"}]
execute if score #roll var matches 8 run function juggernaut:kits/runner with storage juggernaut:kits kits[{id:"survivor"}]
execute if score #roll var matches 9 run function juggernaut:kits/runner with storage juggernaut:kits kits[{id:"trickster"}]
execute if score #roll var matches 10 run function juggernaut:kits/runner with storage juggernaut:kits kits[{id:"jester"}]
execute if score #roll var matches 11 run function juggernaut:kits/runner with storage juggernaut:kits kits[{id:"puppeteer"}]