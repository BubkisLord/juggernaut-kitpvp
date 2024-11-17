# Point gaining
function juggernaut:loop/recursive_point_gaining

# Progress and clear old effects.
execute as @a run function juggernaut:effects/check_effects {effect:"bleeding"}
execute as @a run function juggernaut:effects/check_effects {effect:"hindered"}

# Juggernaut timeout countdown
execute as @a[tag=juggernaut,scores={juggernaut_game_time=1..}] run scoreboard players remove @a[tag=juggernaut] juggernaut_game_time 1
# Juggernaut release sequence
scoreboard players remove @a[tag=juggernaut] juggernaut_release_timer 1
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=30}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "30","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=10}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "10","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=9}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "9","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=8}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "8","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=7}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "7","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=6}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "6","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=5}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "5","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=4}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "4","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=3}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "3","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=2}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "2","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=1}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": true, "color": "gray"},{"text": "1","bold": true,"color": "dark_red"},{"text": " Seconds","bold": true, "color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=0}] run tellraw @a [{"text": "Juggernaut","bold": true,"color": "dark_red","underlined": true},{"text": " Released!","bold": true,"color": "gray"}]
execute as @n[tag=juggernaut,scores={juggernaut_release_timer=0}] run title @a title [{"text": "Juggernaut","bold": true,"color": "dark_red","underlined": true},{"text": " Released!","bold": true,"color": "gray"}]
execute if entity @a[tag=juggernaut,scores={juggernaut_release_timer=0}] as @r[tag=runner] at @s run tp @a[tag=juggernaut,scores={juggernaut_release_timer=0}] @e[tag=arena.spawn,limit=1,sort=furthest]

execute as @e[tag=replenishment.station] if score @s replenish_timeout > #0 var run scoreboard players remove @s replenish_timeout 1

# Remove is_glowing tag from juggernaut every second.
execute if entity @a[tag=juggernaut] run tag @a[tag=juggernaut] remove is_glowing

# General kit cooldowns
execute as @a if score #game_state var matches 10..19 if score @s jug_kit_cooldown > #0 var run scoreboard players remove @s jug_kit_cooldown 1
execute as @a unless score #game_state var matches 10..19 if score @s jug_kit_cooldown > #0 var run scoreboard players set @s jug_kit_cooldown 0

execute as @a if score #game_state var matches 10..19 if score @s jug_kit_cooldown_2 > #0 var run scoreboard players remove @s jug_kit_cooldown_2 1
execute as @a unless score #game_state var matches 10..19 if score @s jug_kit_cooldown_2 > #0 var run scoreboard players set @s jug_kit_cooldown_2 0

execute as @a if score #game_state var matches 10..19 if score @s shadow_mark_cooldown > #0 var run scoreboard players remove @s shadow_mark_cooldown 1
execute as @a unless score #game_state var matches 10..19 if score @s shadow_mark_cooldown > #0 var run scoreboard players set @s shadow_mark_cooldown 0

# Engineer tower cooldowns/duration
execute as @e[type=armor_stand,tag=engineer_tower] run scoreboard players remove @s var 1
execute as @e[tag=engineer] if score @s revealing_tower_cooldown > #0 var run scoreboard players remove @s revealing_tower_cooldown 1
execute as @e[tag=engineer] if score @s replenishment_tower_cooldown > #0 var run scoreboard players remove @s replenishment_tower_cooldown 1
execute as @e[tag=engineer] if score @s turret_cooldown > #0 var run scoreboard players remove @s turret_cooldown 1

execute at @e[type=armor_stand,tag=engineer_tower] run execute as @a[tag=juggernaut,distance=..3] run scoreboard players add @n[type=armor_stand,tag=engineer_tower] dispel_progress 1
execute as @e[type=armor_stand,tag=engineer_tower] at @s run execute if score @s dispel_progress >= @s total_dispelling_needed run playsound block.note_block.bell master @a[tag=juggernaut,distance=..16] ~ ~ ~ 2 1.2
execute as @e[type=armor_stand,tag=engineer_tower] at @s run execute if score @s dispel_progress >= @s total_dispelling_needed run playsound entity.ender_dragon.growl master @a[tag=engineer] ~ ~ ~ 3 0.2 1
execute as @e[type=armor_stand,tag=engineer_tower] at @s run execute if score @s dispel_progress >= @s total_dispelling_needed run kill @s

# Borrowed time ability
execute as @a[tag=!borrowing_time,scores={borrowed_damage=1..}] run damage @s 1
execute as @a[tag=!borrowing_time,scores={borrowed_damage=1..}] run scoreboard players remove @s borrowed_damage 1

execute as @a[tag=borrowing_time] run scoreboard players remove @s borrowed_time_remaining 1

# Chain Tether Removal
execute as @e[type=armor_stand,tag=portal_tether] at @s run scoreboard players add @s var 1

# Warlock cooldowns
execute as @e[type=armor_stand,tag=juggernaut_manager] if score #game_state var matches 10..19 if score @s malevolent_aura_cooldown > #0 var run scoreboard players remove @s malevolent_aura_cooldown 1
execute as @e[type=armor_stand,tag=juggernaut_manager] if score #game_state var matches 10..19 if score @s banishment_glyph_cooldown > #0 var run scoreboard players remove @s banishment_glyph_cooldown 1
execute as @e[type=armor_stand,tag=juggernaut_manager] if score #game_state var matches 10..19 if score @s withering_surge_cooldown > #0 var run scoreboard players remove @s withering_surge_cooldown 1

execute as @e[type=armor_stand,tag=juggernaut_manager] unless score #game_state var matches 10..19 if score @s malevolent_aura_cooldown > #0 var run scoreboard players set @s malevolent_aura_cooldown 0
execute as @e[type=armor_stand,tag=juggernaut_manager] unless score #game_state var matches 10..19 if score @s banishment_glyph_cooldown > #0 var run scoreboard players set @s banishment_glyph_cooldown 0
execute as @e[type=armor_stand,tag=juggernaut_manager] unless score #game_state var matches 10..19 if score @s withering_surge_cooldown > #0 var run scoreboard players set @s withering_surge_cooldown 0

# Hunter remnant delay
execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var > #0 var run scoreboard players remove @s var 1

execute as @a[tag=blinker,nbt={SelectedItem:{id:"minecraft:ender_pearl"}}] at @s run function juggernaut:raycasts/raycast {\
    player_tag:"blinker",\
    raycast_tag:"blinker_raycast",\
    target_tag:"blinker_remnant",\
    hit_distance:8,\
    raycast_limit:1000,\
    move_function_id:3,\
    hit_function_id:3,\
    collides_with_blocks:0,\
}

# Scout revealing by maintaining line of sight
execute as @a[tag=scout] at @s run function juggernaut:raycasts/raycast {\
    player_tag:"scout",\
    raycast_tag:"scout_raycast",\
    target_tag:"juggernaut",\
    hit_distance:2.5,\
    raycast_limit:200,\
    move_function_id:0,\
    hit_function_id:2,\
    collides_with_blocks:1,\
}

execute as @a[tag=dragon] run function juggernaut:raycasts/raycast {\
    player_tag:"dragon",\
    raycast_tag:"dragon_breath_raycast",\
    target_tag:"runner",\
    hit_distance:1.5,\
    raycast_limit:24,\
    move_function_id:1,\
    hit_function_id:1,\
    collides_with_blocks:1,\
}

scoreboard players operation #second_counter var += #1 var
scoreboard players operation #x_seconds var = #second_counter var
scoreboard players operation #x_seconds var %= #5 var
execute if score #x_seconds var matches 0 run function juggernaut:loop/5_seconds


execute if score #second_counter var matches 100.. run scoreboard players set #second_counter var 0