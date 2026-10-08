tag @s remove has_jug_kit
tag @s remove engineer
tag @s remove escapist
tag @s remove ghost
tag @s remove guide
tag @s remove jester
tag @s remove medic
tag @s remove puppeteer
tag @s remove rogue
tag @s remove scout
tag @s remove survivor
tag @s remove trickster
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
attribute @s sneaking_speed modifier remove juggernaut:ghost_sneaking_effects
attribute @s jump_strength modifier remove juggernaut:ghost_sneaking_effects

function stats:calculate_picked_kits
