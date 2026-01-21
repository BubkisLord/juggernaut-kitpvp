#Run kit function
execute as @s[scores={kitSelect=1}] run function kits:warrior
execute as @s[scores={kitSelect=2}] run function kits:cactus
execute as @s[scores={kitSelect=4}] run function kits:farmer
execute as @s[scores={kitSelect=5}] run function kits:viking
execute as @s[scores={kitSelect=6}] run function kits:zombie
execute as @s[scores={kitSelect=7}] run function kits:defender
execute as @s[scores={kitSelect=8}] run function kits:assassin

execute as @s[scores={kitSelect=9}] run function kits:archer
execute as @s[scores={kitSelect=10}] run function kits:flame
execute as @s[scores={kitSelect=11}] run function kits:quickcharger
execute as @s[scores={kitSelect=12}] run function kits:hunter
execute as @s[scores={kitSelect=13}] run function kits:poseidon
execute as @s[scores={kitSelect=14}] run function kits:sharpshooter
execute as @s[scores={kitSelect=15}] run function kits:pirate
execute as @s[scores={kitSelect=16}] run function kits:divinity

execute as @s[scores={kitSelect=17}] run function kits:rabbit
execute as @s[scores={kitSelect=18}] run function kits:cheetah
execute as @s[scores={kitSelect=19}] run function kits:dolphin
execute as @s[scores={kitSelect=20}] run function kits:jouster
execute as @s[scores={kitSelect=21}] run function kits:yeti
execute as @s[scores={kitSelect=22}] run function kits:unicorn
execute as @s[scores={kitSelect=23}] run function kits:ninja
execute as @s[scores={kitSelect=24}] run function kits:shark

execute as @s[scores={kitSelect=25}] run function kits:ambusher
execute as @s[scores={kitSelect=26}] run function kits:auramancer
execute as @s[scores={kitSelect=27}] run function kits:levitator
execute as @s[scores={kitSelect=28}] run function kits:teleporter
execute as @s[scores={kitSelect=29}] run function kits:ghost
execute as @s[scores={kitSelect=30}] run function kits:shaman
execute as @s[scores={kitSelect=31}] run function kits:deflector
execute as @s[scores={kitSelect=32}] run function kits:alchemist


#Error message: Typing commands
execute as @s[scores={kitSelect=1},tag=!ul.Warrior] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=2},tag=!ul.Cactus] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=4},tag=!ul.Farmer] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=5},tag=!ul.Viking] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=6},tag=!ul.Zombie] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=7},tag=!ul.Defender] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=8},tag=!ul.Assassin] run scoreboard players set @s kitSelect 50

execute as @s[scores={kitSelect=9},tag=!ul.Archer] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=10},tag=!ul.Flame] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=11},tag=!ul.Quickcharger] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=12},tag=!ul.Hunter] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=13},tag=!ul.Poseidon] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=14},tag=!ul.Sharpshooter] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=15},tag=!ul.Pirate] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=16},tag=!ul.Divinity] run scoreboard players set @s kitSelect 50

execute as @s[scores={kitSelect=17},tag=!ul.Rabbit] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=18},tag=!ul.Cheetah] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=19},tag=!ul.Dolphin] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=20},tag=!ul.Jouster] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=21},tag=!ul.Yeti] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=22},tag=!ul.Unicorn] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=23},tag=!ul.Ninja] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=24},tag=!ul.Shark] run scoreboard players set @s kitSelect 50

execute as @s[scores={kitSelect=25},tag=!ul.Ambusher] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=26},tag=!ul.Auramancer] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=27},tag=!ul.Levitator] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=28},tag=!ul.Teleporter] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=29},tag=!ul.Ghost] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=30},tag=!ul.Shaman] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=31},tag=!ul.Deflector] run scoreboard players set @s kitSelect 50
execute as @s[scores={kitSelect=32},tag=!ul.Alchemist] run scoreboard players set @s kitSelect 50

execute as @s[scores={kitSelect=33..}] run tellraw @s [{"text":"\n"},{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"]","color":"dark_gray","bold":true},{"text":" Please refrain from typing any in-game commands.","color":"yellow","bold":false},{"text":"\n"}]
execute at @s[scores={kitSelect=33..}] run playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 1 1.2

#Sound effect and cleanup
execute at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.4 1.5
tag @s remove market.player
scoreboard players reset @s kitSelect