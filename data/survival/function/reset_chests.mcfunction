execute as @e[tag=survival_chest_indicator] at @s run setblock ~ ~ ~ air replace
execute as @e[tag=survival_chest_indicator] at @s run kill @e[type=item,distance=..1]
execute as @e[tag=survival_chest_indicator] run tag @s remove common
execute as @e[tag=survival_chest_indicator] run tag @s remove uncommon
execute as @e[tag=survival_chest_indicator] run tag @s remove rare
execute as @e[tag=survival_chest_indicator] run tag @s remove legendary
execute as @e[tag=survival_chest_indicator,limit=12,sort=random] at @s run setblock ~ ~ ~ chest{LootTable:"survival:chests/common"} replace
execute as @e[tag=survival_chest_indicator] at @s if block ~ ~ ~ chest{LootTable:"survival:chests/common"} run tag @s add common
execute as @e[tag=survival_chest_indicator,limit=11,sort=random,tag=!common] at @s run setblock ~ ~ ~ chest{LootTable:"survival:chests/uncommon"} replace
execute as @e[tag=survival_chest_indicator] at @s if block ~ ~ ~ chest{LootTable:"survival:chests/uncommon"} run tag @s add uncommon
execute as @e[tag=survival_chest_indicator,limit=10,sort=random,tag=!common,tag=!uncommon] at @s run setblock ~ ~ ~ chest{LootTable:"survival:chests/rare"} replace
execute as @e[tag=survival_chest_indicator] at @s if block ~ ~ ~ chest{LootTable:"survival:chests/rare"} run tag @s add rare
execute as @a run function survival:set_legendary



# setblock 30 77 70 chest[facing=south]
# summon armor_stand 30 77 70 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block 30 77 70 Items set value []
# data modify block 30 77 70 LootTable set value "survival:chest"

# setblock -54 80 86 chest[facing=south]
# summon armor_stand -54 80 86 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block -54 80 86 Items set value []
# execute as @e[tag=survival_chest_indicator] at @s run loot insert ~ ~ ~ loot survival:chest
# # CANNOT SEARCH SPECIFICALLY FOR chests/common as the loot is first derived from the parent loot table "survival:chest"
# execute as @e[tag=survival_chest_indicator] at @s if block ~ ~ ~ chest{LootTable:"survival:chests/common"} run tag @s add common
# data modify block -54 80 86 LootTable set value "survival:chest"

# setblock -74 79 89 chest[facing=north]
# summon armor_stand -74 79 89 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block -74 79 89 Items set value []
# data modify block -74 79 89 LootTable set value "survival:chest"

# setblock -89 88 80 chest[facing=south]
# summon armor_stand -89 88 80 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block -89 88 80 Items set value []
# data modify block -89 88 80 LootTable set value "survival:chest"

# setblock -88 71 43 chest[facing=west]
# summon armor_stand -88 71 43 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block -88 71 43 Items set value []
# data modify block -88 71 43 LootTable set value "survival:chest"

# setblock -69 84 -60 chest[facing=south]
# summon armor_stand -69 84 -60 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block -69 84 -60 Items set value []
# data modify block -69 84 -60 LootTable set value "survival:chest"

# setblock -68 84 -60 chest[facing=south]
# summon armor_stand -68 84 -60 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block -68 84 -60 Items set value []
# data modify block -68 84 -60 LootTable set value "survival:chest"

# setblock -67 84 -60 chest[facing=south]
# summon armor_stand -67 84 -60 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block -67 84 -60 Items set value []
# data modify block -67 84 -60 LootTable set value "survival:chest"

# setblock -83 72 -46 chest[facing=south]
# summon armor_stand -83 72 -46 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block -83 72 -46 Items set value []
# data modify block -83 72 -46 LootTable set value "survival:chest"

# setblock 19 67 24 chest[facing=west]
# summon armor_stand 19 67 24 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block 19 67 24 Items set value []
# data modify block 19 67 24 LootTable set value "survival:chest"

# setblock -39 65 -45 chest[facing=north]
# summon armor_stand -39 65 -45 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block -39 65 -45 Items set value []
# data modify block -39 65 -45 LootTable set value "survival:chest"

# setblock 96 80 -1 chest[facing=west]
# summon armor_stand 96 80 -1 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block 96 80 -1 Items set value []
# data modify block 96 80 -1 LootTable set value "survival:chest"

# setblock -59 72 -29 chest[facing=north]
# summon armor_stand -59 72 -29 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block -59 72 -29 Items set value []
# data modify block -59 72 -29 LootTable set value "survival:chest"

# setblock -59 79 -6 chest[facing=east]
# summon armor_stand -59 79 -6 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block -59 79 -6 Items set value []
# data modify block -59 79 -6 LootTable set value "survival:chest"

# setblock 48 73 -8 chest[facing=north]
# summon armor_stand 48 73 -8 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block 48 73 -8 Items set value []
# data modify block 48 73 -8 LootTable set value "survival:chest"

# setblock -48 89 53 chest[facing=south]
# summon armor_stand -48 89 53 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block -48 89 53 Items set value []
# data modify block -48 89 53 LootTable set value "survival:chest"

# setblock -48 89 51 chest[facing=north]
# summon armor_stand -48 89 51 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block -48 89 51 Items set value []
# data modify block -48 89 51 LootTable set value "survival:chest"

# setblock 19 75 -66 chest[facing=west]
# summon armor_stand 19 75 -66 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block 19 75 -66 Items set value []
# data modify block 19 75 -66 LootTable set value "survival:chest"

# setblock 21 75 -66 chest[facing=east]
# summon armor_stand 21 75 -66 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block 21 75 -66 Items set value []
# data modify block 21 75 -66 LootTable set value "survival:chest"

# setblock 38 69 -40 chest[facing=south]
# summon armor_stand 38 69 -40 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block 38 69 -40 Items set value []
# data modify block 38 69 -40 LootTable set value "survival:chest"

# setblock 34 67 -14 chest[facing=east]
# summon armor_stand 34 67 -14 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block 34 67 -14 Items set value []
# data modify block 34 67 -14 LootTable set value "survival:chest"

# setblock 72 83 5 chest[facing=south]
# summon armor_stand 72 83 5 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block 72 83 5 Items set value []
# data modify block 72 83 5 LootTable set value "survival:chest"

# setblock -74 79 8 chest[facing=south]
# summon armor_stand -74 79 8 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block -74 79 8 Items set value []
# data modify block -74 79 8 LootTable set value "survival:chest"

# setblock -35 71 92 chest[facing=north]
# summon armor_stand -35 71 92 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block -35 71 92 Items set value []
# data modify block -35 71 92 LootTable set value "survival:chest"

# setblock 72 67 26 chest[facing=north]
# summon armor_stand 72 67 26 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block 72 67 26 Items set value []
# data modify block 72 67 26 LootTable set value "survival:chest"

# setblock -44 64 54 chest[facing=west]
# summon armor_stand -44 64 54 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block -44 64 54 Items set value []
# data modify block -44 64 54 LootTable set value "survival:chest"

# setblock -50 71 -70 chest[facing=south]
# summon armor_stand -50 71 -70 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block -50 71 -70 Items set value []
# data modify block -50 71 -70 LootTable set value "survival:chest"

# setblock -88 86 -41 chest[facing=east]
# summon armor_stand -88 86 -41 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block -88 86 -41 Items set value []
# data modify block -88 86 -41 LootTable set value "survival:chest"

# setblock -13 60 17 chest[facing=south]
# summon armor_stand -13 60 17 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block -13 60 17 Items set value []
# data modify block -13 60 17 LootTable set value "survival:chest"

# setblock -23 67 -3 chest[facing=west]
# summon armor_stand -23 67 -3 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block -23 67 -3 Items set value []
# data modify block -23 67 -3 LootTable set value "survival:chest"

# setblock 80 78 -46 chest[facing=south]
# summon armor_stand 80 78 -46 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block 80 78 -46 Items set value []
# data modify block 80 78 -46 LootTable set value "survival:chest"

# setblock 94 80 31 chest[facing=west]
# summon armor_stand 94 80 31 {Tags:["survival_chest_indicator","kill_on_end_game"],Invisible:true,Invulnerable:true,Small:true,NoGravity:true}
# data modify block 94 80 31 Items set value []
# data modify block 94 80 31 LootTable set value "survival:chest"
