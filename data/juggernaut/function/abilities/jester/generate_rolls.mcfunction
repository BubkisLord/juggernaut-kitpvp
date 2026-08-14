execute store result score #temp var run random value 1..12

execute store result storage juggernaut:main Temp int 1 run scoreboard players get #temp var
data modify storage juggernaut:main Rolls append from storage juggernaut:main Temp

execute if score #temp var matches 1 run data modify storage juggernaut:main Roll_Names append value "Speed"
execute if score #temp var matches 2 run data modify storage juggernaut:main Roll_Names append value "Darkness"
execute if score #temp var matches 3 run data modify storage juggernaut:main Roll_Names append value "Slowness"
execute if score #temp var matches 4 run data modify storage juggernaut:main Roll_Names append value "Nausea"
execute if score #temp var matches 5 run data modify storage juggernaut:main Roll_Names append value "Instant Health"
execute if score #temp var matches 6 run data modify storage juggernaut:main Roll_Names append value "Glowing"
execute if score #temp var matches 7 run data modify storage juggernaut:main Roll_Names append value "Jump Boost"
execute if score #temp var matches 8 run data modify storage juggernaut:main Roll_Names append value "Regeneration"
execute if score #temp var matches 9 run data modify storage juggernaut:main Roll_Names append value "Smoke Bomb"
execute if score #temp var matches 10 run data modify storage juggernaut:main Roll_Names append value "Llama"
execute if score #temp var matches 11 run data modify storage juggernaut:main Roll_Names append value "Self-Damage"
execute if score #temp var matches 12 run data modify storage juggernaut:main Roll_Names append value "Bouncy"