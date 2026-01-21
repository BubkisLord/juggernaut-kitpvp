clear @s
effect clear @s
scoreboard players set @s killstreak 0
scoreboard players set @s pirateKills 0
scoreboard players set @s assassinActivate 0
scoreboard players set @s ambushDisplay 0
xp set @s 0 points
xp set @s 0 levels
tag @s remove ambush_cooldown
attribute @s safe_fall_distance modifier remove max_pirate_fall_distance
execute if entity @s[scores={pirateKills=14..}] run weather clear 9999999
tag @s[tag=!autorespawn] remove warrior
tag @s[tag=!autorespawn] remove archer
tag @s[tag=!autorespawn] remove defender
tag @s[tag=!autorespawn] remove divinity
tag @s[tag=!autorespawn] remove shark
tag @s[tag=!autorespawn] remove cactus
tag @s[tag=!autorespawn] remove flame
tag @s[tag=!autorespawn] remove rabbit
tag @s[tag=!autorespawn] remove assassin
tag @s[tag=!autorespawn] remove deflector
tag @s[tag=!autorespawn] remove cheetah
tag @s[tag=!autorespawn] remove viking
tag @s[tag=!autorespawn] remove ghost
tag @s[tag=!autorespawn] remove quickcharger
tag @s[tag=!autorespawn] remove teleporter
tag @s[tag=!autorespawn] remove unicorn
tag @s[tag=!autorespawn] remove dolphin
tag @s[tag=!autorespawn] remove alchemist
tag @s[tag=!autorespawn] remove sharpshooter
tag @s[tag=!autorespawn] remove jouster
tag @s[tag=!autorespawn] remove farmer
tag @s[tag=!autorespawn] remove ninja
tag @s[tag=!autorespawn] remove poseidon
tag @s[tag=!autorespawn] remove auramancer
tag @s[tag=!autorespawn] remove zombie
tag @s[tag=!autorespawn] remove yeti
tag @s[tag=!autorespawn] remove levitator
tag @s[tag=!autorespawn] remove pirate
tag @s[tag=!autorespawn] remove ambusher
tag @s[tag=!autorespawn] remove hunter
tag @s[tag=!autorespawn] remove shaman
scoreboard players set @s seconds 90
scoreboard players set @s exit_count 0

tag @s add lobby.player