$execute at @s anchored eyes positioned ~ ~1 ~ positioned ^ ^ ^1 rotated as @s run summon fireball ~ ~ ~ {Tags:["fireball","kill_on_end_game"],ExplosionPower:3,Owner:$(UUID)}

execute store result score #dx tmp run data get entity @e[tag=fireball,limit=1,sort=nearest] Pos[0] 1000
execute store result score #dy tmp run data get entity @e[tag=fireball,limit=1,sort=nearest] Pos[1] 1000
execute store result score #dz tmp run data get entity @e[tag=fireball,limit=1,sort=nearest] Pos[2] 1000

execute at @e[tag=fireball,limit=1,sort=nearest] rotated as @s positioned ^ ^ ^1 run summon marker ~ ~ ~ {Tags:["fb_dir","kill_on_end_game"]}
execute store result score #tx tmp run data get entity @e[tag=fb_dir,limit=1,sort=nearest] Pos[0] 1000
execute store result score #ty tmp run data get entity @e[tag=fb_dir,limit=1,sort=nearest] Pos[1] 1000
execute store result score #tz tmp run data get entity @e[tag=fb_dir,limit=1,sort=nearest] Pos[2] 1000
kill @e[tag=fb_dir]

scoreboard players operation #tx tmp -= #dx tmp
scoreboard players operation #ty tmp -= #dy tmp
scoreboard players operation #tz tmp -= #dz tmp

execute as @e[tag=fireball,limit=1,sort=nearest] store result entity @s Motion[0] double 0.0001 run scoreboard players get #tx tmp
execute as @e[tag=fireball,limit=1,sort=nearest] store result entity @s Motion[1] double 0.0001 run scoreboard players get #ty tmp
execute as @e[tag=fireball,limit=1,sort=nearest] store result entity @s Motion[2] double 0.0001 run scoreboard players get #tz tmp