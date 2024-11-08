#Cooldown reset
execute if score #game_state var matches 0 run scoreboard players set @s seconds 90
execute unless score #game_state var matches 0 run scoreboard players set @s seconds 120


#Replenishment function
execute as @s[tag=warrior] run function replenish:warrior
execute as @s[tag=cactus] run function replenish:cactus
execute as @s[tag=farmer] run function replenish:farmer
execute as @s[tag=viking] run function replenish:viking
execute as @s[tag=zombie] run function replenish:zombie
execute as @s[tag=defender] run function replenish:defender
execute as @s[tag=assassin] run function replenish:assassin

execute as @s[tag=archer] run function replenish:archer
execute as @s[tag=flame] run function replenish:flame
execute as @s[tag=quickcharger] run function replenish:quickcharger
execute as @s[tag=hunter] run function replenish:hunter
execute as @s[tag=poseidon] run function replenish:poseidon
execute as @s[tag=sharpshooter] run function replenish:sharpshooter
execute as @s[tag=pirate] run function replenish:pirate
execute as @s[tag=divinity] run function replenish:divinity

execute as @s[tag=rabbit] run function replenish:rabbit
execute as @s[tag=cheetah] run function replenish:cheetah
execute as @s[tag=dolphin] run function replenish:dolphin
execute as @s[tag=jouster] run function replenish:jouster
execute as @s[tag=yeti] run function replenish:yeti
execute as @s[tag=unicorn] run function replenish:unicorn
execute as @s[tag=ninja] run function replenish:ninja
execute as @s[tag=shark] run function replenish:shark

execute as @s[tag=ambusher] run function replenish:ambusher
execute as @s[tag=auramancer] run function replenish:auramancer
execute as @s[tag=levitator] run function replenish:levitator
execute as @s[tag=teleporter] run function replenish:teleporter
execute as @s[tag=ghost] run function replenish:ghost
execute as @s[tag=shaman] run function replenish:shaman
execute as @s[tag=deflector] run function replenish:deflector
execute as @s[tag=alchemist] run function replenish:alchemist

execute as @s[tag=escapist] run function juggernaut:kit_replenishes/replenish_escapist
execute as @s[tag=medic] run function juggernaut:kit_replenishes/replenish_medic
execute as @s[tag=scout] run function juggernaut:kit_replenishes/replenish_scout
execute as @s[tag=survivor] run function juggernaut:kit_replenishes/replenish_survivor
execute as @s[tag=engineer] run function juggernaut:kit_replenishes/replenish_engineer
execute as @s[tag=witchdoctor] run function juggernaut:kit_replenishes/replenish_witchdoctor
execute as @s[tag=juggernaut] run function juggernaut:kit_replenishes/replenish_jug_steak

execute as @s[tag=samurai] run function replenish:samurai