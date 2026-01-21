execute unless entity @e[type=armor_stand,tag=replenish_minigame_target,distance=..5] as @a unless entity @e[type=armor_stand,tag=failed_minigame,distance=..10] unless entity @e[type=armor_stand,tag=unsuccessful_spreadplayers,distance=..10] run playsound minecraft:block.note_block.pling master @a[tag=runner] ~ ~ ~ 0.5 2
execute unless entity @e[type=armor_stand,tag=replenish_minigame_target,distance=..5] as @n[type=armor_stand,tag=replenishment.station,tag=!failed_minigame,distance=..10] unless entity @e[type=armor_stand,tag=unsuccessful_spreadplayers,distance=..10] if score #juggernaut_customisation completable_stations matches 1 run scoreboard players add @s replenish_amount 1
execute unless entity @e[type=armor_stand,tag=replenish_minigame_target,distance=..5] unless entity @e[type=armor_stand,tag=failed_minigame,distance=..10] unless entity @e[type=armor_stand,tag=unsuccessful_spreadplayers,distance=..10] run scoreboard players add #juggernaut_manager replenish_progress 1
tag @s remove unsuccessful_spreadplayers
summon armor_stand ~ ~0.5 ~ {Tags:["kill_on_end_game","replenish_minigame_target"],NoGravity:true,Health:0.1f,Small:1b,Invulnerable:false}
attribute @n[type=armor_stand,tag=replenish_minigame_target] scale base set 0.4
execute if entity @e[type=armor_stand,tag=replenish_minigame_target,distance=..1] run tag @n[type=armor_stand,tag=replenishment.station] add unsuccessful_spreadplayers
execute as @e[type=armor_stand,tag=replenish_minigame_target,distance=..1] run kill @s
spreadplayers ~ ~ 0 4 false @e[type=armor_stand,tag=replenish_minigame_target,distance=..5]