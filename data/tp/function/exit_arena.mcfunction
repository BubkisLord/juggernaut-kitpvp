clear @s
effect clear @s
effect give @s minecraft:instant_health 1 100 true
scoreboard players set @s killstreak 0
scoreboard players set @s pirateKills 0
scoreboard players set @s assassinActivate 0
scoreboard players set @s ambushDisplay 0
xp set @s 0 points
xp set @s 0 levels
tag @s add lobby.player
tag @s remove autorespawn
tag @s remove ambush_cooldown
tag @s remove warrior
tag @s remove archer
tag @s remove defender
tag @s remove divinity
tag @s remove shark
tag @s remove cactus
tag @s remove flame
tag @s remove rabbit
tag @s remove assassin
tag @s remove deflector
tag @s remove cheetah
tag @s remove viking
tag @s remove ghost
tag @s remove quickcharger
tag @s remove teleporter
tag @s remove unicorn
tag @s remove dolphin
tag @s remove alchemist
tag @s remove sharpshooter
tag @s remove jouster
tag @s remove farmer
tag @s remove ninja
tag @s remove poseidon
tag @s remove auramancer
tag @s remove zombie
tag @s remove yeti
tag @s remove levitator
tag @s remove pirate
tag @s remove ambusher
tag @s remove hunter
tag @s remove shaman
tag @s remove samurai
scoreboard players set @s seconds 90
scoreboard players set @s exit_count 0

tp @s 2000 100.06250 0
playsound minecraft:entity.enderman.teleport master @a 2000 100.06250 0 1.2 1
particle minecraft:witch 2000 101 0 0.5 1 0.5 1 100 force
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"SYSTEM","color":"#30add3","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have returned to the Main Lobby.","color":"yellow","bold":false}]
tellraw @s {"text":" "}
execute at @s run kill @n[type=item,nbt={Item:{id:"minecraft:dark_oak_door"}}]