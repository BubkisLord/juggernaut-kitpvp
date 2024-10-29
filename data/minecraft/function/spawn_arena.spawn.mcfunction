execute unless entity @e[type=armor_stand,distance=..3] run tell @s "Command Successful."
execute if entity @e[type=armor_stand,distance=..3] run tell @s "FAILED"
execute unless entity @e[type=armor_stand,distance=..3] run summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,CustomNameVisible:false,NoGravity:true,Small:true,Tags:["arena.spawn"]}