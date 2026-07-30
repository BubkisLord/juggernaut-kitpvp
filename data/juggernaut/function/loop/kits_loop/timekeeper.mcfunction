function juggernaut:ability_management/check_ability {\
    player_tag:"timekeeper",\
    item_id:"minecraft:echo_shard",\
    item_name:{"text": "Timestream Rupture","color": "red"},\
    description:[{"text": "Rupture a timestream strand, dealing damage","color": "gray"},\
                 {"text": "over time to any runners within 3 blocks for","color": "gray"},\
                 {"text": "45 seconds. Turns strands red for all players.","color": "gray"},\
                 {"text": "Cooldown: 1m 10s (45s duration, 25s cooldown)","color": "dark_gray"}],\
    ability_id:"timestream_rupture",\
    cooldown:35,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown1",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"timekeeper",\
    item_id:"minecraft:fermented_spider_eye",\
    item_name:{"text": "Poison Time Strand","color": "green"},\
    description:[{"text": "Purge a strand of time, a trail of your whereabouts from the world.","color": "gray"},{"text": "Cooldown: 1s","color": "dark_gray"}],\
    ability_id:"kill_strand",\
    cooldown:4,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"ability_cooldown0",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"timekeeper",\
    item_id:"minecraft:rabbit_foot",\
    item_name:{"text": "Time Skip","color": "aqua"},\
    description:[{"text": "Skip forward ahead in time, having your position","color": "gray"},\
                 {"text": "blink forward in an instant. Cannot go through","color": "gray"},\
                 {"text": "blocks, nor up an incline.","color": "gray"},\
                 {"text": "Cooldown: 25s","color": "dark_gray"}],\
    ability_id:"time_skip",\
    cooldown:25,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"ability_cooldown2",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"timekeeper",\
    item_id:"minecraft:slime_ball",\
    item_name:{"text": "Place Temporal Marker","color": "gold"},\
    description:[{"text": "Place down a marker where you are.","color": "gray"},\
                 {"text": "Placing a marker removes all others.","color": "gray"},\
                 {"text": "This marker can later be teleported to.","color": "gray"},\
                 {"text": "Cooldown: 20s","color": "dark_gray"}],\
    ability_id:"place_marker",\
    cooldown:20,\
    hotbar_slot:"hotbar.4",\
    cooldown_var:"ability_cooldown3",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"timekeeper",\
    item_id:"minecraft:magma_cream",\
    item_name:{"text": "Temporal Rewind","color": "gold"},\
    description:[{"text": "Return to your last placed marker.","color": "gray"},\
                 {"text": "It is not removed.","color": "gray"},\
                 {"text": "Cooldown: 35s","color": "dark_gray"}],\
    ability_id:"tp_marker",\
    cooldown:35,\
    hotbar_slot:"hotbar.5",\
    cooldown_var:"ability_cooldown4",\
}

execute as @a[tag=timekeeper,tag=!spectator,tag=!rewinding] if score #game_state var matches 11 if score @s health matches 1.. if score @s lives_remaining matches 1.. at @s run summon area_effect_cloud ~ ~ ~ {Duration:1200,Tags:["timekeeper_trail","kill_on_end_game"],custom_particle:{type:"minecraft:dust",color:14064170,scale:2},Radius:0.3f}

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

execute as @a[tag=runner] at @s as @e[type=area_effect_cloud,tag=timekeeper_trail,distance=..1] run tag @s add runner_triggered

execute as @e[tag=poisoned_strand] run data modify entity @s custom_particle set value {type:"minecraft:dust",color:6344480,scale:2}
execute as @e[type=area_effect_cloud,tag=poisoned_strand] run scoreboard players add @s tick_counter 1
execute as @e[type=area_effect_cloud,tag=poisoned_strand] if score @s tick_counter matches 20.. run tag @s add dying_strand
execute as @e[type=area_effect_cloud,tag=poisoned_strand] if score @s tick_counter matches 10.. at @s run tag @e[type=area_effect_cloud,tag=timekeeper_trail,distance=..3] add poisoned_strand

execute as @e[type=area_effect_cloud,tag=mid_rupture] run scoreboard players add @s var 1
execute as @e[type=area_effect_cloud,tag=mid_rupture] if score @s var matches 5..399 at @s run tag @e[type=area_effect_cloud,tag=timekeeper_trail,distance=..3] add mid_rupture
execute as @e[type=area_effect_cloud,tag=mid_rupture] at @s run data modify entity @s custom_particle set value {type:"minecraft:dust",color:14817047,scale:3}
execute as @e[type=area_effect_cloud,tag=mid_rupture,scores={var=400}] run kill @s
execute as @e[type=area_effect_cloud,tag=dying_strand] run kill @s


execute as @e[type=area_effect_cloud,tag=!mid_rupture,tag=!poisoned_strand,tag=timekeeper_trail] at @s run data modify entity @s custom_particle set value {type:"minecraft:dust",color:14064170,scale:2}
execute as @e[type=area_effect_cloud,tag=!mid_rupture,tag=!poisoned_strand,tag=timekeeper_trail] at @s run scoreboard players set @s tick_counter 0
execute as @e[type=area_effect_cloud,tag=!mid_rupture,tag=!poisoned_strand,tag=timekeeper_trail] at @s run scoreboard players set @s var 0

execute as @e[type=area_effect_cloud,tag=!mid_rupture,tag=!poisoned_strand,tag=runner_triggered] run data merge entity @s {custom_particle:{type:"minecraft:dust",color:3842263,scale:2}}

execute as @e[type=area_effect_cloud,tag=mid_rupture] at @s run \
    execute as @a[tag=runner,distance=..1] run damage @s 2 magic by @p[tag=timekeeper]
execute as @e[type=area_effect_cloud,tag=mid_rupture] at @s run \
    execute as @a[tag=runner,distance=..2] run damage @s 1 magic by @p[tag=timekeeper]