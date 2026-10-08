tag @s remove has_jug_kit
execute if entity @s[tag=predator] run time set noon
execute if entity @s[tag=fishmonger] run weather clear
tag @s remove predator
tag @s remove dragon
tag @s remove spirit_walker
tag @s remove hunter
tag @s remove warlock
tag @s remove witch_doctor
tag @s remove chameleon
tag @s remove fishmonger
tag @s remove classic
tag @s remove knight
tag @s remove timekeeper
tag @s remove phantom
tag @s remove beast_tamer
effect clear @s
clear @s
attribute @s sneaking_speed base reset
attribute @s attack_damage base reset
attribute @s max_health base reset
attribute @s scale base reset
attribute @s gravity base reset
attribute @s jump_strength base reset
attribute @s safe_fall_distance base reset
attribute @s bounciness base reset
attribute @s air_drag_modifier base reset
attribute @s friction_modifier base reset
attribute @s entity_interaction_range base reset
attribute @s step_height base reset
attribute @s water_movement_efficiency base reset
attribute @s movement_speed modifier remove juggernaut:predator_move_spd
attribute @s sneaking_speed modifier remove juggernaut:dragon_flight
attribute @s camera_distance modifier remove juggernaut:chameleon_shapeshift
attribute @s movement_speed modifier remove juggernaut:phantom_move_spd
attribute @s movement_speed modifier remove juggernaut:spirit_walker
attribute @s fall_damage_multiplier modifier remove juggernaut:spirit_walker
attribute @s safe_fall_distance modifier remove juggernaut:beast_tamer

function stats:calculate_picked_kits
