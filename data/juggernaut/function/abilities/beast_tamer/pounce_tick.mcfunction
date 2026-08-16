execute positioned ^ ^ ^1 run function juggernaut:abilities/beast_tamer/pounce_hit

execute if entity @s[type=goat,nbt={OnGround:1b}] run tag @a remove pounce_hit
execute if entity @s[type=goat,nbt={OnGround:1b}] run tag @s remove pouncing