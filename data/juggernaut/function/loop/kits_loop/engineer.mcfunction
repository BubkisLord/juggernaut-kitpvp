# Engineer
# Dispelling of towers
execute at @e[type=armor_stand,tag=engineer_tower] run execute as @a[tag=juggernaut,distance=..3] run particle totem_of_undying ~ ~ ~ 0.25 1 0.25 0 20 force

# Skeleton Turret Death Logic
execute as @e[type=skeleton,tag=skeleton_turret] unless entity @e[type=armor_stand,tag=turret] run kill @s
execute as @e[type=skeleton,tag=skeleton_turret] at @s run tp @s @n[type=armor_stand,tag=turret]

# Revealing Tower Logic
execute as @e[type=armor_stand,tag=revealing_tower] unless entity @e[type=armor_stand,tag=revealing_tower_particle_emitter] run summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,CustomNameVisible:false,NoGravity:true,Small:true,Tags:["revealing_tower_particle_emitter","kill_on_end_game"]}

execute as @e[type=armor_stand,tag=revealing_tower] at @s if entity @a[tag=juggernaut,distance=..8] run data modify entity @s CustomNameVisible set value true
execute as @e[type=armor_stand,tag=revealing_tower] at @s unless entity @a[tag=juggernaut,distance=..8] run data modify entity @s CustomNameVisible set value false
execute as @e[type=armor_stand,tag=revealing_tower] at @s as @a[tag=juggernaut,distance=..8,tag=!is_undetectable] run effect give @s glowing 1 0 true

# Replenishment Tower Logic
execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter] at @s run particle dust{color:[1,1,0],scale:1} ^0.75 ^ ^0.75 0.1 0.1 0.1 0.4 4 normal
execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter] at @s run particle dust{color:[0,1,1],scale:1} ^-0.75 ^1 ^-0.75 0.1 0.1 0.1 0.4 4 normal
execute as @e[type=armor_stand,tag=replenishment_tower] at @s positioned ~ ~-1 ~ run execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter,distance=..2] unless entity @s[distance=..1] run tp @s ~ ~-0.5 ~
execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter] at @s run tp @s ~ ~0.005 ~ ~10 ~
execute as @e[type=armor_stand,tag=replenishment_tower_particle_emitter] at @s unless entity @e[type=armor_stand,tag=replenishment_tower,distance=..2] run kill @s

# Borrowed Time Logic
execute as @a[tag=borrowing_time] run effect give @s resistance 1 255 true
execute as @a[tag=borrowing_time,scores={borrowed_damage_taken=1..}] run scoreboard players operation @s borrowed_damage_taken /= #10 var
execute as @a[tag=borrowing_time] run scoreboard players operation @s borrowed_damage += @s borrowed_damage_taken
execute as @a[tag=borrowing_time] run scoreboard players set @s borrowed_damage_taken 0
execute as @a[tag=borrowing_time,scores={borrowed_time_remaining=..0}] run scoreboard players operation @s borrowed_damage *= #75 var
execute as @a[tag=borrowing_time,scores={borrowed_time_remaining=..0}] run scoreboard players operation @s borrowed_damage /= #100 var
execute as @a[tag=borrowing_time,scores={borrowed_time_remaining=..0}] run tag @s remove borrowing_time

# Spawn Revealing Tower (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"engineer",\
    item_id:"minecraft:gold_block",\
    item_name:{"text": "Spawn Revealing Tower","color": "gold"},\
    description:[{"text": "Summon a tower that is invisible until the Juggernaut is close.","color": "gray"},{"text": "Reveals the Juggernaut when they are within 8 blocks.","color": "gray"},{"text": "The Juggernaut may stand near it to dispel/remove it.","color": "gray"},{"text": "Cooldown: 1m 30s","color": "dark_gray"}],\
    ability_id:"revealing_tower",\
    cooldown:90,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"revealing_tower_cooldown",\
}

# Spawn Replenishment Tower (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"engineer",\
    item_id:"minecraft:lime_dye",\
    item_name:{"text": "Spawn Replenishment Tower","color": "green"},\
    description:[{"text": "Summon a tower with a visible nametag.","color": "gray"},{"text": "Acts as an additional, mobile replenishment station.","color": "gray"},{"text": "Only engineers can use it.","color": "gray"},{"text": "The Juggernaut may stand near it to dispel/remove it.","color": "gray"},{"text": "Cooldown: 1m","color": "dark_gray"}],\
    ability_id:"replenishment_tower",\
    cooldown:60,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"replenishment_tower_cooldown",\
}

# Spawn Turret (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"engineer",\
    item_id:"minecraft:bone",\
    item_name:{"text": "Spawn Turret","color": "gray"},\
    description:[{"text": "Summon a turret that shoots the Juggernaut.","color": "gray"},{"text": "The Juggernaut may stand near it to dispel/remove it.","color": "gray"},{"text": "Cooldown: 1m 30s","color": "dark_gray"}],\
    ability_id:"turret_tower",\
    cooldown:90,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"turret_cooldown",\
}

# Borrowed Time (Active)
function juggernaut:ability_management/check_ability {\
    player_tag:"engineer",\
    item_id:"minecraft:clock",\
    item_name:{"text": "Borrowed Time","color": "gold"},\
    description:[{"text": "Temporarily become invulnerable, but later take","color":"gray"},{"text": "damage equal to what you avoided as damage over time.","color": "gray"},{"text": "Cooldown: 2m","color": "dark_gray"}],\
    ability_id:"borrowed_time",\
    cooldown:120,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"jug_kit_cooldown",\
}