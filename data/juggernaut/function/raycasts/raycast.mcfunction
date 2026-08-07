# Raycast state (depth + substep counter) is tracked ON THE MARKER ARMOR STAND, which is unique per
# cast, instead of on @p[tag=<kit>]. Previously, with two or more players of the same kit (e.g. two
# Scouts), the nearest-player selector would flip between them as the ray travelled, so no single
# player's depth ever reached the limit and the recursion ran until it hit maxCommandChainLength.

# On the first frame only (no stand yet), summon the per-cast marker and zero its depth.
$execute unless entity @e[type=armor_stand,tag=$(player_tag)_raycast] at @s run summon armor_stand ~ ~ ~ {Invisible:true,Small:true,Invulnerable:true,CustomNameVisible:false,NoGravity:true,Tags:[$(player_tag)_raycast,$(player_tag)_raycast_init,"kill_on_end_game"]}
$scoreboard players set @e[type=armor_stand,tag=$(player_tag)_raycast_init] current_raycast_depth 0
$scoreboard players set @e[type=armor_stand,tag=$(player_tag)_raycast_init] raycast_depth_counter 0
$tag @e[type=armor_stand,tag=$(player_tag)_raycast_init] remove $(player_tag)_raycast_init

# Advance the ray one substep (0.5 blocks) while still within range. Depth counts blocks: it ticks up
# once every 2 substeps, so raycast_limit stays measured in blocks but each cast now runs
# raycast_limit*2 recursive frames instead of raycast_limit*10 (5x fewer commands per cast).
$execute if score @n[type=armor_stand,tag=$(player_tag)_raycast] current_raycast_depth matches ..$(raycast_limit) as @s at @s anchored eyes positioned ~ ~ ~ run tp @n[type=armor_stand,tag=$(player_tag)_raycast] ^ ^ ^0.5 facing ^ ^ ^999999
$data modify storage juggernaut:raycasts/move raycast_id set value $(raycast_id)
$execute if score @n[type=armor_stand,tag=$(player_tag)_raycast] current_raycast_depth matches ..$(raycast_limit) as @s at @s anchored eyes positioned ~ ~ ~ run function juggernaut:raycasts/move with storage juggernaut:raycasts/move
$execute if score @n[type=armor_stand,tag=$(player_tag)_raycast] current_raycast_depth matches ..$(raycast_limit) run scoreboard players add @n[type=armor_stand,tag=$(player_tag)_raycast] raycast_depth_counter 1
$execute if score @n[type=armor_stand,tag=$(player_tag)_raycast] current_raycast_depth matches ..$(raycast_limit) if score @n[type=armor_stand,tag=$(player_tag)_raycast] raycast_depth_counter matches 2 run scoreboard players add @n[type=armor_stand,tag=$(player_tag)_raycast] current_raycast_depth 1
$execute if score @n[type=armor_stand,tag=$(player_tag)_raycast] current_raycast_depth matches ..$(raycast_limit) if score @n[type=armor_stand,tag=$(player_tag)_raycast] raycast_depth_counter matches 2.. run scoreboard players set @n[type=armor_stand,tag=$(player_tag)_raycast] raycast_depth_counter 0

$data modify storage juggernaut:raycasts/hit raycast_id set value $(raycast_id)
$execute as @n[type=armor_stand,tag=$(player_tag)_raycast] at @s anchored eyes positioned ^ ^ ^0.1 if entity @e[distance=..$(hit_distance),tag=$(target_tag)] run execute as @e[distance=..$(hit_distance),tag=$(target_tag)] at @s run function juggernaut:raycasts/hit with storage juggernaut:raycasts/hit
$execute as @n[type=armor_stand,tag=$(player_tag)_raycast] at @s anchored eyes positioned ^ ^ ^0.1 if entity @e[distance=..$(hit_distance),tag=$(target_tag)] run return run data get entity @n[distance=..$(hit_distance),tag=$(target_tag)]

$execute if score #1 var matches $(collides_with_blocks) if score @n[type=armor_stand,tag=$(player_tag)_raycast] current_raycast_depth matches ..$(raycast_limit) as @n[type=armor_stand,tag=$(player_tag)_raycast] at @s anchored eyes positioned ^ ^ ^0.1 if block ~ ~ ~ #juggernaut:raycast_permeable run function juggernaut:raycasts/raycast {player_tag:$(player_tag),raycast_tag:$(player_tag)_raycast,target_tag:$(target_tag),raycast_id:$(raycast_id),hit_distance:$(hit_distance),raycast_limit:$(raycast_limit),collides_with_blocks:$(collides_with_blocks)}
$execute unless score #1 var matches $(collides_with_blocks) if score @n[type=armor_stand,tag=$(player_tag)_raycast] current_raycast_depth matches ..$(raycast_limit) as @n[type=armor_stand,tag=$(player_tag)_raycast] at @s anchored eyes positioned ^ ^ ^0.1 run function juggernaut:raycasts/raycast {player_tag:$(player_tag),raycast_tag:$(player_tag)_raycast,target_tag:$(target_tag),raycast_id:$(raycast_id),hit_distance:$(hit_distance),raycast_limit:$(raycast_limit),collides_with_blocks:$(collides_with_blocks)}
$data modify storage juggernaut:raycasts/hit_block raycast_id set value $(raycast_id)
$execute if score @n[type=armor_stand,tag=$(player_tag)_raycast] current_raycast_depth matches $(raycast_limit).. as @n[type=armor_stand,tag=$(player_tag)_raycast] run kill @s
$execute if score #1 var matches $(collides_with_blocks) as @n[type=armor_stand,tag=$(player_tag)_raycast] at @s unless block ~ ~ ~ #juggernaut:raycast_permeable positioned ~ ~ ~ run function juggernaut:raycasts/hit_block with storage juggernaut:raycasts/hit_block
$execute if score #1 var matches $(collides_with_blocks) as @n[type=armor_stand,tag=$(player_tag)_raycast] at @s unless block ~ ~ ~ #juggernaut:raycast_permeable run kill @s
