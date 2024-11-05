scoreboard players set @s lives_remaining 0
scoreboard players operation @s lives_remaining = @s lives
scoreboard players operation @s lives_remaining -= @s game_deaths
scoreboard players set #1 var 1
scoreboard players set @s borrowed_damage 0

execute if score @s lives_remaining matches 1.. run spawnpoint @s 0 101 0
execute if score @s lives_remaining matches 1.. if entity @s[tag=escapist] run function juggernaut:kit_replenishes/replenish_escapist
execute if score @s lives_remaining matches 1.. if entity @s[tag=medic] run function juggernaut:kit_replenishes/replenish_medic
execute if score @s lives_remaining matches 1.. if entity @s[tag=scout] run function juggernaut:kit_replenishes/replenish_scout
execute if score @s lives_remaining matches 1.. if entity @s[tag=survivor] run function juggernaut:kit_replenishes/replenish_survivor
execute if score @s lives_remaining matches 1.. if entity @s[tag=runner] run effect give @s invisibility 20 0 true
execute if entity @s[tag=has_hunters_mark] if entity @a[tag=runner,tag=!has_hunters_mark] run tag @r[tag=runner,tag=!has_hunters_mark] add has_hunters_mark
execute if entity @a[tag=runner,tag=!has_hunters_mark] run tag @s remove has_hunters_mark

execute if score @s lives_remaining matches ..0 run tag @s remove runner
execute if score @s lives_remaining matches ..0 run tag @s remove has_jug_kit
execute if score @s lives_remaining matches ..0 run tag @s remove has_hunters_mark
execute if score @s lives_remaining matches ..0 run tag @s remove juggernaut
execute if score @s lives_remaining matches ..0 run tag @s remove jug_hunter
execute if score @s lives_remaining matches ..0 run tag @s remove dragon
execute if score @s lives_remaining matches ..0 run tag @s remove spectator
execute if score @s lives_remaining matches ..0 run tag @s remove predator
execute if score @s lives_remaining matches ..0 run tag @s remove witchdoctor
execute if score @s lives_remaining matches ..0 run tag @s remove medic
execute if score @s lives_remaining matches ..0 run tag @s remove escapist
execute if score @s lives_remaining matches ..0 run tag @s remove scout
execute if score @s lives_remaining matches ..0 run tag @s remove engineer
execute if score @s lives_remaining matches ..0 run tag @s remove warlock
execute if score @s lives_remaining matches ..0 run tag @s remove survivor
execute if score @s lives_remaining matches ..0 run attribute @s generic.max_health base set 20
execute if score @s lives_remaining matches ..0 run spawnpoint @s 2000 100 0
execute if score @s lives_remaining matches ..0 run tag @s add lobby.player
execute if score @s lives_remaining matches ..0 run clear @s
