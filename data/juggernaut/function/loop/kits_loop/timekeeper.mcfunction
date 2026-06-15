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
    cooldown_var:"ability_cooldown0",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"timekeeper",\
    item_id:"minecraft:fermented_spider_eye",\
    item_name:{"text": "Poison Time Strand","color": "gold"},\
    description:[{"text": "Purge a strand of time, a trail of your whereabouts from the world.","color": "gray"},{"text": "Cooldown: 1s","color": "dark_gray"}],\
    ability_id:"kill_strand",\
    cooldown:4,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"ability_cooldown2",\
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
    cooldown:35,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"ability_cooldown3",\
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
execute as @e[type=area_effect_cloud,tag=mid_rupture] if score @s var matches 5..399 at @s run tag @e[type=area_effect_cloud,tag=timekeeper_trail,distance=..3] add mid_rupture
execute as @e[type=area_effect_cloud,tag=mid_rupture] at @s run data modify entity @s custom_particle set value {type:"minecraft:dust",color:14817047,scale:3}
execute as @e[type=area_effect_cloud,tag=mid_rupture,scores={var=400}] run kill @s
execute as @e[type=area_effect_cloud,tag=dying_strand] run kill @s


execute as @e[type=area_effect_cloud,tag=!mid_rupture,tag=!poisoned_strand,tag=timekeeper_trail] at @s run data modify entity @s custom_particle set value {type:"minecraft:dust",color:14064170,scale:1}
execute as @e[type=area_effect_cloud,tag=!mid_rupture,tag=!poisoned_strand,tag=timekeeper_trail] at @s run scoreboard players set @s tick_counter 0
execute as @e[type=area_effect_cloud,tag=!mid_rupture,tag=!poisoned_strand,tag=timekeeper_trail] at @s run scoreboard players set @s var 0

execute as @e[type=area_effect_cloud,tag=mid_rupture] at @s run \
    execute as @a[tag=runner,distance=..1] run damage @s 2
execute as @e[type=area_effect_cloud,tag=mid_rupture] at @s run \
    execute as @a[tag=runner,distance=..2] run damage @s 1