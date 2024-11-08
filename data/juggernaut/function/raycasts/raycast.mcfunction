$execute as @s at @s anchored eyes positioned ~ ~ ~ unless entity @e[type=area_effect_cloud,tag=$(raycast_tag)] run scoreboard players set @p[tag=$(player_tag)] current_raycast_depth 0
$execute as @s at @s anchored eyes positioned ~ ~ ~ unless entity @e[type=area_effect_cloud,tag=$(raycast_tag)] run scoreboard players set @p[tag=$(player_tag)] raycast_depth_counter 0
$execute as @s at @s anchored eyes positioned ~ ~ ~ unless entity @e[type=area_effect_cloud,tag=$(raycast_tag)] run summon area_effect_cloud ~ ~ ~ {Duration:1,Invulnerable:true,CustomNameVisible:false,NoGravity:true,Tags:[$(raycast_tag),"kill_on_end_game"]}

$execute if score @p[tag=$(player_tag)] current_raycast_depth matches ..$(raycast_limit) as @s at @s anchored eyes positioned ~ ~ ~ run tp @n[type=area_effect_cloud,tag=$(raycast_tag)] ^ ^ ^0.5 facing ^ ^ ^1
$data modify storage juggernaut:raycasts/move move_function_id set value $(move_function_id)
$execute if score @p[tag=$(player_tag)] current_raycast_depth matches ..$(raycast_limit) as @s at @s anchored eyes positioned ~ ~ ~ run function juggernaut:raycasts/move
$execute if score @p[tag=$(player_tag)] current_raycast_depth matches ..$(raycast_limit) as @s run scoreboard players add @p[tag=$(player_tag)] raycast_depth_counter 1
$execute if score @p[tag=$(player_tag)] current_raycast_depth matches ..$(raycast_limit) as @s if score @p[tag=$(player_tag)] raycast_depth_counter matches 2 run scoreboard players add @p[tag=$(player_tag)] current_raycast_depth 1
$execute if score @p[tag=$(player_tag)] current_raycast_depth matches ..$(raycast_limit) as @s if score @p[tag=$(player_tag)] raycast_depth_counter matches 2.. run scoreboard players set @p[tag=$(player_tag)] raycast_depth_counter 0
$tellraw @a {"score": {"name": "@p[tag=$(player_tag)]","objective": "current_raycast_depth"}}

$data modify storage juggernaut:raycasts/hit hit_function_id set value $(hit_function_id)
$execute as @n[type=area_effect_cloud,tag=$(raycast_tag)] at @s anchored eyes positioned ^ ^ ^0.5 if entity @e[distance=..$(hit_distance),tag=$(target_tag)] run execute as @e[distance=..$(hit_distance),tag=$(target_tag)] at @s run function juggernaut:raycasts/hit

$execute if score @p[tag=$(player_tag)] current_raycast_depth matches ..$(raycast_limit) as @n[type=area_effect_cloud,tag=$(raycast_tag)] at @s anchored eyes positioned ^ ^ ^0.5 if block ~ ~ ~ #juggernaut:raycast_permeable run function juggernaut:raycasts/raycast {player_tag:$(player_tag),raycast_tag:$(raycast_tag),target_tag:$(target_tag),hit_function_id:$(hit_function_id),move_function_id:$(move_function_id),hit_distance:$(hit_distance),raycast_limit:$(raycast_limit)}
$execute if score @p[tag=$(player_tag)] current_raycast_depth matches $(raycast_limit).. as @n[type=area_effect_cloud,tag=$(raycast_tag)] run kill @s
$execute as @n[type=area_effect_cloud,tag=$(raycast_tag)] at @s anchored eyes positioned ^ ^ ^0.5 unless block ~ ~ ~ #juggernaut:raycast_permeable run kill @s