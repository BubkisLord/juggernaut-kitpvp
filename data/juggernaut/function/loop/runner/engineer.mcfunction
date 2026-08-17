# Engineer
# Dispelling of towers
execute at @e[type=armor_stand,tag=engineer_tower] run execute as @a[tag=juggernaut,distance=..3] run particle totem_of_undying ~ ~ ~ 0.25 1 0.25 0 20 force

# Skeleton Turret Death Logic
execute as @e[type=skeleton,tag=skeleton_turret] at @s unless entity @e[type=armor_stand,tag=turret,distance=..2] run kill @s

# Revealing Tower Logic
execute as @e[type=armor_stand,tag=revealing_tower] unless entity @e[type=armor_stand,tag=revealing_tower_particle_emitter] run summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,CustomNameVisible:false,NoGravity:true,Small:true,Tags:["revealing_tower_particle_emitter","kill_on_end_game"]}

execute as @e[type=armor_stand,tag=revealing_tower] at @s if entity @a[tag=juggernaut,distance=..8] run data modify entity @s CustomNameVisible set value true
execute as @e[type=armor_stand,tag=revealing_tower] at @s unless entity @a[tag=juggernaut,distance=..8] run data modify entity @s CustomNameVisible set value false
execute as @e[type=armor_stand,tag=revealing_tower] at @s as @a[tag=juggernaut,distance=..16,tag=!undetectable] run effect give @s glowing 1 0 true
execute if entity @e[type=armor_stand,tag=revealing_tower] at @n[type=armor_stand,tag=revealing_tower] as @a[tag=runner,distance=..16] run attribute @s name_tag_distance modifier add juggernaut:revealing_tower -100 add_multiplied_base

# Replenishment Tower Logic
execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter] at @s run particle dust{color:[1,1,0],scale:1} ^0.75 ^ ^0.75 0.1 0.1 0.1 0.4 4 normal
execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter] at @s run particle dust{color:[0,1,1],scale:1} ^-0.75 ^1 ^-0.75 0.1 0.1 0.1 0.4 4 normal
execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter] at @s run particle dust{color:[1,0,1],scale:1} ^0.75 ^ ^-0.75 0.1 0.1 0.1 0.4 4 normal
execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter] at @s run particle dust{color:[0,1,0],scale:1} ^-0.75 ^1 ^0.75 0.1 0.1 0.1 0.4 4 normal
execute as @e[type=armor_stand,tag=replenishment_tower] at @s positioned ~ ~-1 ~ run execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter,distance=..2] unless entity @s[distance=..1] run tp @s ~ ~-0.5 ~
execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter] at @s run tp @s ~ ~0.005 ~ ~10 ~
execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter] at @s unless entity @e[type=armor_stand,tag=replenishment_tower,distance=..2] run kill @s

# Spawn Revealing Tower (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"engineer",\
    item_model:"minecraft:gold_block",\
    item_name:{"text": "Spawn Revealing Tower","color": "gold"},\
    description:[{"text": "Summon a tower that is invisible until the Juggernaut is within 8 blocks.","color": "gray"},{"text": "Reveals the Juggernaut when they are within 16 blocks.","color": "gray"},{"text": "Hides Runner name tags when they are within 16 blocks.","color": "gray"},{"text": "The Juggernaut may stand near it to dispel/remove it.","color": "gray"},{"text": "Cooldown: 1m 30s","color": "dark_gray"}],\
    ability_id:"revealing_tower",\
    cooldown:90,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}

# Spawn Replenishment Tower (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"engineer",\
    item_model:"minecraft:lime_dye",\
    item_name:{"text": "Spawn Replenishment Tower","color": "green"},\
    description:[{"text": "Summons a tower which allows Runners to replenish","color": "gray"},{"text": "the highest replenishment station.","color": "gray"},{"text": "The Juggernaut may stand near it to dispel/remove it.","color": "gray"},{"text": "Cooldown: 60s","color": "dark_gray"}],\
    ability_id:"replenishment_tower",\
    cooldown:60,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown1",\
}

# Spawn Turret (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"engineer",\
    item_model:"minecraft:bone",\
    item_name:{"text": "Spawn Turret","color": "gray"},\
    description:[{"text": "Summon a turret that shoots the Juggernaut.","color": "gray"},{"text": "The Juggernaut may stand near it to dispel/remove it.","color": "gray"},{"text": "Cooldown: 1m 30s","color": "dark_gray"}],\
    ability_id:"turret_tower",\
    cooldown:45,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"ability_cooldown2",\
}

# Spawn Decoy (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"engineer",\
    item_model:"minecraft:blue_dye",\
    item_name:{"text": "Spawn Decoy","color": "#5f78d4"},\
    description:[{"text": "Summon a decoy replenishment station.","color": "gray"},{"text": "The Juggernaut may stand near it to dispel/remove it.","color": "gray"},{"text": "Cooldown: 45s","color": "dark_gray"}],\
    ability_id:"decoy",\
    cooldown:45,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"ability_cooldown3",\
}
