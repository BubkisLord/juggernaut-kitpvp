# Ghost
execute as @a[tag=jug_ghost,scores={is_sneaking=1},tag=in_chase] at @s run effect give @s invisibility 1 0 false
execute as @a[tag=jug_ghost,scores={is_sneaking=1},tag=in_chase] at @s run function juggernaut:effects/apply_effect_silent {effect:"undetectable",duration:1}

execute as @a[tag=jug_ghost,scores={is_sneaking=1},tag=in_chase] at @s run attribute @s sneaking_speed base set 0
execute as @a[tag=jug_ghost,scores={is_sneaking=0},tag=!is_not_replenishing,tag=!has_respawn_time,tag=in_chase] at @s run effect clear @s invisibility
execute as @a[tag=jug_ghost,scores={is_sneaking=0}] at @s run attribute @s sneaking_speed base set 0.3