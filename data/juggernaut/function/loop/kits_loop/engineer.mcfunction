# Engineer
execute at @e[type=armor_stand,tag=engineer_tower] run execute as @a[tag=juggernaut,distance=..3] run particle totem_of_undying ~ ~ ~ 0.25 1 0.25 0 20 force

execute as @e[type=skeleton,tag=skeleton_turret] unless entity @e[type=armor_stand,tag=turret] run kill @s
execute as @e[type=skeleton,tag=skeleton_turret] at @s run tp @s @n[type=armor_stand,tag=turret]

execute at @e[type=armor_stand,tag=replenishment_tower_particle_emitter] unless entity @e[type=armor_stand,tag=replenishment_tower,distance=..5] run kill @e[type=armor_stand,tag=replenishment_tower_particle_emitter]

execute as @e[type=armor_stand,tag=revealing_tower] at @s if entity @a[tag=juggernaut,distance=..8] run data modify entity @s CustomNameVisible set value true
execute as @e[type=armor_stand,tag=revealing_tower] at @s unless entity @a[tag=juggernaut,distance=..8] run data modify entity @s CustomNameVisible set value false

execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter] at @s run particle dust{color:[1,1,0],scale:1} ^0.75 ^ ^0.75 0.1 0.1 0.1 0.4 4 normal
execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter] at @s run particle dust{color:[0,1,1],scale:1} ^-0.75 ^1 ^-0.75 0.1 0.1 0.1 0.4 4 normal
execute as @e[type=armor_stand,tag=replenishment_tower] at @s positioned ~ ~-1 ~ run execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter,distance=..2] unless entity @s[distance=..1] run tp @s ~ ~-0.5 ~
execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter] at @s run tp @s ~ ~0.005 ~ ~10 ~

execute as @a[tag=borrowing_time] run effect give @s resistance 1 255 true
execute as @a[tag=borrowing_time] run scoreboard players operation @s borrowed_damage_taken /= #10 var
execute as @a[tag=borrowing_time] run scoreboard players operation @s borrowed_damage += @s borrowed_damage_taken
execute as @a[tag=borrowing_time] run scoreboard players set @s borrowed_damage_taken 0
execute as @a[tag=borrowing_time,scores={borrowed_time_remaining=..0}] run scoreboard players operation @s borrowed_damage *= #75 var
execute as @a[tag=borrowing_time,scores={borrowed_time_remaining=..0}] run scoreboard players operation @s borrowed_damage /= #100 var
execute as @a[tag=borrowing_time,scores={borrowed_time_remaining=..0}] run tag @s remove borrowing_time