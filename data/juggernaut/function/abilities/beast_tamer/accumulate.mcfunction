execute store result score #tx tmp run data get entity @s Pos[0] 1000
scoreboard players operation #tx tmp -= #vx tmp
scoreboard players operation #mx tmp += #tx tmp

execute store result score #tz tmp run data get entity @s Pos[2] 1000
scoreboard players operation #tz tmp -= #vz tmp
scoreboard players operation #mz tmp += #tz tmp