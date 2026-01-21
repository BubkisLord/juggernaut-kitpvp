function juggernaut:ability_management/check_ability {\
    player_tag:"timekeeper",\
    item_id:"minecraft:clock",\
    item_name:{"text": "Rewind","color": "gold"},\
    description:[{"text": "Rewind your position across your path","color": "gray"},\
                 {"text": "in the last 10 minutes. This will overwrite","color": "gray"},\
                 {"text": "your path when the ability is ended.","color": "gray"},\
                 {"text": "Cooldown: 30s","color": "dark_gray"}],\
    ability_id:"rewind",\
    cooldown:30,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"timekeeper",\
    item_id:"minecraft:ender_pearl",\
    item_name:{"text": "Place Temporal Marker","color": "gold"},\
    description:[{"text": "Mark all player's space in time,","color": "gray"},\
                 {"text": "then after 10 seconds they are all","color": "gray"},\
                 {"text": "teleported to their respective locations.","color": "gray"},\
                 {"text": "Cooldown: 60s","color": "dark_gray"}],\
    ability_id:"temporal_mark",\
    cooldown:60,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"jug_kit_cooldown_2",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"timekeeper",\
    item_id:"minecraft:fermented_spider_eye",\
    item_name:{"text": "Poison Time Strand","color": "gold"},\
    description:[{"text": "Purge a strand of time, a trail of your whereabouts from the world.","color": "gray"},{"text": "Cooldown: 1s","color": "dark_gray"}],\
    ability_id:"kill_strand",\
    cooldown:1,\
    hotbar_slot:"hotbar.5",\
    cooldown_var:"jug_kit_cooldown_3",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"timekeeper",\
    item_id:"minecraft:echo_shard",\
    item_name:{"text": "Timestream Rupture","color": "gold"},\
    description:[{"text": "Rupture a timestream strand, dealing damage","color": "gray"},\
                 {"text": "over time to any runners within 3 blocks for","color": "gray"},\
                 {"text": "45 seconds. Turns strands red for all players.","color": "gray"},\
                 {"text": "Cooldown: 1m 10s (45s duration, 25s cooldown)","color": "dark_gray"}],\
    ability_id:"timestream_rupture",\
    cooldown:25,\
    hotbar_slot:"hotbar.6",\
    cooldown_var:"jug_kit_cooldown_3",\
}

execute as @a[tag=timekeeper,tag=!spectator,tag=!rewinding] if score #game_state var matches 11 if score @s health matches 1.. if score @s lives_remaining matches 1.. at @s run summon area_effect_cloud ~ ~ ~ {Duration:1200,Tags:["timekeeper_trail","kill_on_end_game"],custom_particle:{type:"minecraft:dust",color:14064170,scale:1},Radius:0.3f}

execute as @n[type=area_effect_cloud,tag=timekeeper_trail] run tp @s ~ ~ ~
execute as @a[tag=rewinding] at @s unless entity @n[type=area_effect_cloud,tag=timekeeper_trail,distance=..10] run tp @s ~ ~1 ~
execute as @a[tag=rewinding] at @s unless entity @n[type=area_effect_cloud,tag=timekeeper_trail,distance=..10] run tag @s remove rewinding
execute as @a[tag=rewinding] at @s if entity @n[type=area_effect_cloud,tag=timekeeper_trail,distance=..10] as @n[type=area_effect_cloud,tag=timekeeper_trail,distance=..10] at @s run tp @p[tag=rewinding] ~ ~ ~
execute as @a[tag=rewinding] at @s if entity @n[type=area_effect_cloud,tag=timekeeper_trail,distance=..10] run kill @n[type=area_effect_cloud,tag=timekeeper_trail,distance=..10]
execute as @a[tag=rewinding] at @s if entity @n[type=area_effect_cloud,tag=timekeeper_trail,distance=..10] as @n[type=area_effect_cloud,tag=timekeeper_trail] at @s run tp @p[tag=rewinding] ~ ~ ~
execute as @a[tag=rewinding] at @s if entity @n[type=area_effect_cloud,tag=timekeeper_trail,distance=..10] run kill @n[type=area_effect_cloud,tag=timekeeper_trail,distance=..10]
execute as @a[tag=rewinding] at @s if entity @n[type=area_effect_cloud,tag=timekeeper_trail,distance=..10] as @n[type=area_effect_cloud,tag=timekeeper_trail] at @s run tp @p[tag=rewinding] ~ ~ ~
execute as @a[tag=rewinding] at @s if entity @n[type=area_effect_cloud,tag=timekeeper_trail,distance=..10] run kill @n[type=area_effect_cloud,tag=timekeeper_trail,distance=..10]

execute as @a[tag=timekeeper] at @s as @e[type=area_effect_cloud,tag=poisoned_strand,distance=..0.07] run tag @s remove poisoned_strand
execute as @a[tag=timekeeper] at @s as @e[type=area_effect_cloud,tag=mid_rupture,distance=..0.07] run tag @s remove mid_rupture

execute as @e[tag=poisoned_strand] run data modify entity @s custom_particle set value {type:"minecraft:dust",color:6344480,scale:1}
execute as @e[type=area_effect_cloud,tag=poisoned_strand] run scoreboard players add @s tick_counter 1
execute as @e[type=area_effect_cloud,tag=poisoned_strand] if score @s tick_counter matches 20.. run tag @s add dying_strand
execute as @e[type=area_effect_cloud,tag=poisoned_strand] if score @s tick_counter matches 10.. at @s run tag @e[type=area_effect_cloud,tag=timekeeper_trail,distance=..3] add poisoned_strand

# =============================================================
# Timestream Rupture
#   - Damages runners near any of your strands
#   - High burst damage (configurable)
# =============================================================

# Optional: visual pulse on all strands
execute as @e[type=area_effect_cloud,tag=mid_rupture] run scoreboard players add @s var 1
execute as @e[type=area_effect_cloud,tag=mid_rupture] if score @s var matches 5..899 at @s run tag @e[type=area_effect_cloud,tag=timekeeper_trail,distance=..3] add mid_rupture
execute as @e[type=area_effect_cloud,tag=mid_rupture] if score @s var matches 900.. at @s run tag @s remove mid_rupture
execute as @e[type=area_effect_cloud,tag=mid_rupture] at @s run data modify entity @s custom_particle set value {type:"minecraft:dust",color:14817047,scale:3}
execute as @e[type=area_effect_cloud,tag=dying_strand] run kill @s


execute as @e[type=area_effect_cloud,tag=!mid_rupture,tag=!poisoned_strand,tag=timekeeper_trail] at @s run data modify entity @s custom_particle set value {type:"minecraft:dust",color:14064170,scale:1}
execute as @e[type=area_effect_cloud,tag=!mid_rupture,tag=!poisoned_strand,tag=timekeeper_trail] at @s run scoreboard players set @s tick_counter 0
execute as @e[type=area_effect_cloud,tag=!mid_rupture,tag=!poisoned_strand,tag=timekeeper_trail] at @s run scoreboard players set @s var 0

# Damage calculation
#  • radius = 4 blocks around each strand
#  • damage = 6 (3 hearts) per strand the runner is within
#  • stacks if multiple strands overlap
execute as @e[type=area_effect_cloud,tag=mid_rupture] at @s run \
    execute as @a[tag=runner,distance=..3] run damage @s 3

execute if stopwatch temporal_mark_timer 10 as @a run function juggernaut:abilities/timekeeper/temporal_mark_end
execute if stopwatch temporal_mark_timer 10 run stopwatch remove temporal_mark_timer