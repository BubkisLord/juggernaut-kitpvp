execute unless entity @e[type=armor_stand,tag=replenishment.station,tag=haunted_station] run scoreboard players set @s ability_cooldown1 4000
execute unless entity @e[type=armor_stand,tag=replenishment.station,tag=haunted_station] run playsound block.note_block.didgeridoo ui @s ~ ~ ~ 1.2
execute unless entity @e[type=armor_stand,tag=replenishment.station,tag=haunted_station] run particle angry_villager ~ ~ ~ 0.3 0.5 0.3 0 10
execute unless entity @e[type=armor_stand,tag=replenishment.station,tag=haunted_station] run return fail
tag @s add haunting_station
playsound block.beacon.activate master @s
execute if entity @s[tag=undetectable] run schedule function juggernaut:abilities/phantom/execute_tp 2.5s append
execute unless entity @s[tag=undetectable] run schedule function juggernaut:abilities/phantom/execute_tp 6s append