function juggernaut:loop/recursive_point_gaining

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
tp @a[tag=juggernaut,scores={juggernaut_release_timer=0}] @e[tag=arena.spawn,limit=1,sort=random]

execute as @e[tag=replenishment.station] if score @s replenish_timeout > #0 var run scoreboard players remove @s replenish_timeout 1

# Remove is_glowing tag from juggernaut every second.
execute if entity @a[tag=juggernaut] run tag @a[tag=juggernaut] remove is_glowing

# General kit cooldowns
execute as @a if score #game_state var matches 10..19 if score @s jug_kit_cooldown > #0 var run scoreboard players remove @s jug_kit_cooldown 1
execute as @a unless score #game_state var matches 10..19 if score @s jug_kit_cooldown > #0 var run scoreboard players set @s jug_kit_cooldown 0

execute as @a if score #game_state var matches 10..19 if score @s jug_kit_cooldown_2 > #0 var run scoreboard players remove @s jug_kit_cooldown_2 1
execute as @a unless score #game_state var matches 10..19 if score @s jug_kit_cooldown_2 > #0 var run scoreboard players set @s jug_kit_cooldown_2 0

# Engineer tower cooldowns/duration
execute as @e[type=armor_stand,tag=engineer_tower] run scoreboard players remove @s var 1
execute as @e[tag=engineer] if score @s revealing_tower_cooldown > #0 var run scoreboard players remove @s revealing_tower_cooldown 1
execute as @e[tag=engineer] if score @s revealing_tower_cooldown = #0 var run item replace entity @s hotbar.1 with raw_gold_block[item_name='[{"text": "Spawn Revealing Tower","color": "gold","bold": true},{"text": " | "},{"text": "READY","color": "green"}]']
execute as @e[tag=engineer] if score @s revealing_tower_cooldown = #0 var run scoreboard players remove @s revealing_tower_cooldown 1
execute as @e[tag=engineer] if score @s revealing_tower_cooldown > #0 var run item replace entity @s hotbar.1 with barrier[item_name='[{"text": "Spawn Revealing Tower","color": "gold","bold": true},{"text": " | "},{"text": "ON COOLDOWN","color": "red"}]']

execute as @e[tag=engineer] if score @s replenishment_tower_cooldown > #0 var run scoreboard players remove @s replenishment_tower_cooldown 1
execute as @e[tag=engineer] if score @s replenishment_tower_cooldown = #0 var run item replace entity @s hotbar.2 with lime_dye[item_name='[{"text": "Spawn Replenishment Tower","color": "green","bold": true},{"text": " | "},{"text": "READY","color": "green"}]']
execute as @e[tag=engineer] if score @s replenishment_tower_cooldown = #0 var run scoreboard players remove @s replenishment_tower_cooldown 1
execute as @e[tag=engineer] if score @s replenishment_tower_cooldown > #0 var run item replace entity @s hotbar.2 with barrier[item_name='[{"text": "Spawn Replenishment Tower","color": "green","bold": true},{"text": " | "},{"text": "ON COOLDOWN","color": "red"}]']

execute as @e[tag=engineer] if score @s turret_cooldown > #0 var run scoreboard players remove @s turret_cooldown 1
execute as @e[tag=engineer] if score @s turret_cooldown = #0 var run item replace entity @s hotbar.3 with bone[item_name='[{"text": "Spawn Turret","color": "gray","bold": true},{"text": " | "},{"text": "READY","color": "green"}]']
execute as @e[tag=engineer] if score @s turret_cooldown = #0 var run scoreboard players remove @s turret_cooldown 1
execute as @e[tag=engineer] if score @s turret_cooldown > #0 var run item replace entity @s hotbar.3 with barrier[item_name='[{"text": "Spawn Turret","color": "gray","bold": true},{"text": " | "},{"text": "ON COOLDOWN","color": "red"}]']

execute at @e[type=armor_stand,tag=engineer_tower] run execute as @a[tag=juggernaut,distance=..3] run scoreboard players add @n[type=armor_stand,tag=engineer_tower] dispel_progress 1
execute as @e[type=armor_stand,tag=engineer_tower] at @s run execute if score @s dispel_progress >= @s total_dispelling_needed run playsound block.note_block.bell master @a[tag=juggernaut,distance=..16] ~ ~ ~ 2 1.2
execute as @e[type=armor_stand,tag=engineer_tower] at @s run execute if score @s dispel_progress >= @s total_dispelling_needed run playsound entity.ender_dragon.growl master @a[tag=engineer] ~ ~ ~ 3 0.2 1
execute as @e[type=armor_stand,tag=engineer_tower] at @s run execute if score @s dispel_progress >= @s total_dispelling_needed run kill @s

# Borrowed time ability
execute as @a[tag=!borrowing_time,scores={borrowed_damage=1..}] run damage @s 1
execute as @a[tag=!borrowing_time,scores={borrowed_damage=1..}] run scoreboard players remove @s borrowed_damage 1

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
