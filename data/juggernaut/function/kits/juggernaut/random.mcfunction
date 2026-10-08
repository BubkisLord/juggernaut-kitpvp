scoreboard players set #roll var 0
execute store result score #roll var run random value 1..13

execute if score #roll var matches 1 run function juggernaut:kits/juggernaut with storage juggernaut:kits kits[{id:"beast_tamer"}]
execute if score #roll var matches 2 run function juggernaut:kits/juggernaut with storage juggernaut:kits kits[{id:"chameleon"}]
execute if score #roll var matches 3 run function juggernaut:kits/juggernaut with storage juggernaut:kits kits[{id:"classic"}]
execute if score #roll var matches 4 run function juggernaut:kits/juggernaut with storage juggernaut:kits kits[{id:"dragon"}]
execute if score #roll var matches 5 run function juggernaut:kits/juggernaut with storage juggernaut:kits kits[{id:"fishmonger"}]
execute if score #roll var matches 6 run function juggernaut:kits/juggernaut with storage juggernaut:kits kits[{id:"hunter"}]
execute if score #roll var matches 7 run function juggernaut:kits/juggernaut with storage juggernaut:kits kits[{id:"knight"}]
execute if score #roll var matches 8 run function juggernaut:kits/juggernaut with storage juggernaut:kits kits[{id:"phantom"}]
execute if score #roll var matches 9 run function juggernaut:kits/juggernaut with storage juggernaut:kits kits[{id:"predator"}]
execute if score #roll var matches 10 run function juggernaut:kits/juggernaut with storage juggernaut:kits kits[{id:"spirit_walker"}]
execute if score #roll var matches 11 run function juggernaut:kits/juggernaut with storage juggernaut:kits kits[{id:"timekeeper"}]
execute if score #roll var matches 12 run function juggernaut:kits/juggernaut with storage juggernaut:kits kits[{id:"warlock"}]
execute if score #roll var matches 13 run function juggernaut:kits/juggernaut with storage juggernaut:kits kits[{id:"witch_doctor"}]