$execute if entity @a[tag=runner,scores={is_sneaking=1,health=..19},distance=..$(distance)] run scoreboard players operation @p[tag=runner,scores={is_sneaking=1,health=..19},distance=..$(distance)] healing_progress += @s healing_per_tick
$execute if entity @a[tag=runner,scores={is_sneaking=1,health=..19},distance=..$(distance)] run tag @s add is_healing
$execute as @p[tag=runner,scores={is_sneaking=1,health=..19},distance=..$(distance)] run tag @s add is_being_healed

$execute if entity @a[tag=runner,scores={is_sneaking=1,health=..19},distance=..$(distance)] as @p[tag=runner,scores={is_sneaking=1,health=..19},distance=..$(distance)] at @s run execute store result storage juggernaut:healing_percent healing_percent float 1 run scoreboard players get @s healing_percent
$execute if entity @a[tag=runner,scores={is_sneaking=1,health=..19},distance=..$(distance)] as @p[tag=runner,scores={is_sneaking=1,health=..19},distance=..$(distance)] at @s run function juggernaut:healing/heal_particles with storage juggernaut:healing_percent healing_percent

$execute as @a[tag=runner,distance=..$(distance)] at @s if score @s healing_progress >= @s healing_needed run function juggernaut:hooks/player_healed
$execute as @a[tag=runner,distance=..$(distance)] at @s if score @s healing_progress >= @s healing_needed as @p[tag=is_healing,distance=..$(distance)] at @s run function juggernaut:hooks/healed_player
$execute as @a[tag=runner,distance=..$(distance)] if score @s healing_progress >= @s healing_needed run effect give @s instant_health 1 252 true
$execute as @a[tag=runner,distance=..$(distance)] if score @s healing_progress >= @s healing_needed run scoreboard players set @s healing_progress 0