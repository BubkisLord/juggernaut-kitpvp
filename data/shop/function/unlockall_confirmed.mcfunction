#Sound effects
execute at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.4 1.5
execute as @a at @s run playsound minecraft:entity.player.levelup master @s

#Confirmation message
execute as @s run tellraw @a [{"text":"\n"},{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"selector":"@s","bold":false},{"text":" just unlocked ","color":"yellow","bold":false},{"text":"all kits","color":"dark_green","bold":false},{"text":" for all players currently online!","color":"yellow","bold":false},{"text":"\n"},{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You are now able to select every kit the map has to offer!","color":"yellow","bold":false},{"text":"\n"}]

#Scoreboard update
scoreboard players set @a kitsunlocked 32
scoreboard players set @a kitsnotunlocked 0
scoreboard players reset @s unlockall

#Giving access to all kits
tag @a add ul.Warrior
tag @a add ul.Cactus
tag @a add ul.Farmer
tag @a add ul.Viking
tag @a add ul.Zombie
tag @a add ul.Defender
tag @a add ul.Assassin

tag @a add ul.Archer
tag @a add ul.Flame
tag @a add ul.Quickcharger
tag @a add ul.Hunter
tag @a add ul.Poseidon
tag @a add ul.Sharpshooter
tag @a add ul.Pirate
tag @a add ul.Divinity

tag @a add ul.Rabbit
tag @a add ul.Cheetah
tag @a add ul.Dolphin
tag @a add ul.Jouster
tag @a add ul.Yeti
tag @a add ul.Unicorn
tag @a add ul.Ninja
tag @a add ul.Shark

tag @a add ul.Ambusher
tag @a add ul.Auramancer
tag @a add ul.Levitator
tag @a add ul.Teleporter
tag @a add ul.Ghost
tag @a add ul.Shaman
tag @a add ul.Deflector
tag @a add ul.Alchemist

tag @a add ul.Samurai