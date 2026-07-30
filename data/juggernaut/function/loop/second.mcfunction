# Start game when ready.
execute if score #game_state var matches 10 as @a[scores={health=0}] run function juggernaut:spectate
execute if score #game_state var matches 10 unless entity @a[tag=!has_jug_kit,tag=!spectator,scores={health=1..}] run function juggernaut:start_juggernaut

# Progress and clear old effects.
execute as @a run function juggernaut:effects/check_effects {effect:"not_replenishing"}
execute as @a run function juggernaut:effects/check_effects {effect:"undetectable"}
execute as @a run function juggernaut:effects/check_effects {effect:"risky_business"}
execute as @a run function juggernaut:effects/check_effects {effect:"haunted"}

execute as @a run function juggernaut:attribute_management/check {attribute_name:"movement_speed",modifier_name:"hopeful_sprint"}
execute as @a run function juggernaut:attribute_management/check {attribute_name:"movement_speed",modifier_name:"waiting_game"}
execute as @a run function juggernaut:attribute_management/check {attribute_name:"movement_speed",modifier_name:"rapid_brutality"}

# Juggernaut release sequence
scoreboard players remove @a[tag=juggernaut] juggernaut_release_timer 1
execute as @p[tag=juggernaut,scores={juggernaut_release_timer=30}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": false, "color": "gray"},{"text": "30","bold": false,"color": "red"},{"text": " Seconds","bold": false, "color": "gray"}]
execute as @p[tag=juggernaut,scores={juggernaut_release_timer=10}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": false, "color": "gray"},{"text": "10","bold": false,"color": "red"},{"text": " Seconds","bold": false, "color": "gray"}]
execute as @p[tag=juggernaut,scores={juggernaut_release_timer=5}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": false, "color": "gray"},{"text": "5","bold": false,"color": "red"},{"text": " Seconds","bold": false, "color": "gray"}]
execute as @p[tag=juggernaut,scores={juggernaut_release_timer=4}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": false, "color": "gray"},{"text": "4","bold": false,"color": "red"},{"text": " Seconds","bold": false, "color": "gray"}]
execute as @p[tag=juggernaut,scores={juggernaut_release_timer=3}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": false, "color": "gray"},{"text": "3","bold": false,"color": "red"},{"text": " Seconds","bold": false, "color": "gray"}]
execute as @p[tag=juggernaut,scores={juggernaut_release_timer=2}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": false, "color": "gray"},{"text": "2","bold": false,"color": "red"},{"text": " Seconds","bold": false, "color": "gray"}]
execute as @p[tag=juggernaut,scores={juggernaut_release_timer=1}] run tellraw @a [{"text": "Juggernaut is released in: ","bold": false, "color": "gray"},{"text": "1","bold": false,"color": "red"},{"text": " Seconds","bold": false, "color": "gray"}]
execute as @p[tag=juggernaut,scores={juggernaut_release_timer=0}] run tellraw @a [{"text": "Juggernaut","bold": false,"color": "red"},{"text": " Released!","bold": false,"color": "gray"}]
execute if score #juggernaut_customisation debug_mode matches 0 if entity @a[tag=juggernaut,scores={juggernaut_release_timer=0}] as @r[tag=runner] at @s run tag @e[type=armor_stand,tag=arena.spawn,limit=6,sort=furthest] add spawn.candidate
execute as @a[tag=juggernaut,scores={juggernaut_release_timer=0}] run tp @s @e[type=armor_stand,tag=spawn.candidate,limit=1,sort=random]
tag @e[tag=spawn.candidate] remove spawn.candidate
execute if score #juggernaut_customisation debug_mode matches 0 if entity @a[tag=juggernaut,scores={juggernaut_release_timer=0}] as @a[tag=runner] at @s run playsound minecraft:block.end_portal.spawn master @s ~ ~ ~ 0.4 0.1
execute as @p[tag=juggernaut,scores={juggernaut_release_timer=0}] run scoreboard players set #game_state var 11

execute as @e[type=armor_stand,tag=replenishment.station] at @s if entity @a[tag=runner,distance=..6,tag=!undetectable] if score @s replenish_timeout = #6 var run tag @s remove apply_undetectable
execute as @e[type=armor_stand,tag=replenishment.station] if score @s replenish_timeout >= #0 var run scoreboard players remove @s replenish_timeout 1
execute as @e[type=armor_stand,tag=replenishment.station] if score @s replenish_timeout = #0 var run tag @s remove apply_undetectable

# Remove is_glowing tag from juggernaut every second.
execute if entity @a[tag=juggernaut] run tag @a[tag=juggernaut] remove is_glowing

execute as @a if score @s brutal_efficiency_cooldown matches 1.. run scoreboard players remove @s brutal_efficiency_cooldown 1

# Engineer tower cooldowns/duration
execute as @e[type=armor_stand,tag=engineer_tower] run scoreboard players remove @s var 1
execute at @e[type=armor_stand,tag=engineer_tower] run execute as @a[tag=juggernaut,distance=..3] run scoreboard players add @n[type=armor_stand,tag=engineer_tower] dispel_progress 1
execute as @e[type=armor_stand,tag=engineer_tower] at @s run execute if score @s dispel_progress >= @s total_dispelling_needed run playsound block.note_block.bell master @a[tag=juggernaut,distance=..16] ~ ~ ~ 2 1.2
execute as @e[type=armor_stand,tag=engineer_tower] at @s run execute if score @s dispel_progress >= @s total_dispelling_needed run playsound entity.ender_dragon.growl master @a[tag=engineer] ~ ~ ~ 3 0.2 1
execute as @e[type=armor_stand,tag=engineer_tower] at @s run execute if score @s dispel_progress >= @s total_dispelling_needed run kill @s

# Hunter remnant delay
execute as @e[type=armor_stand,tag=hunter_remnant] if score @s var matches 1.. run scoreboard players remove @s var 1

# Scout revealing by maintaining line of sight
execute as @a[tag=scout] at @s run function juggernaut:raycasts/raycast {\
    player_tag:"scout",\
    raycast_id:"scout_los_reveal",\
    target_tag:"juggernaut",\
    hit_distance:2.5,\
    raycast_limit:200,\
    collides_with_blocks:1,\
}

# Shapeshift time limit
execute as @a[tag=chameleon,tag=!shapeshifting] run scoreboard players set @s shapeshift_time 0

execute as @a[tag=chameleon,tag=shapeshifting] run scoreboard players add @s shapeshift_time 1
execute as @a[tag=chameleon,tag=shapeshifting,scores={shapeshift_time=10}] run tellraw @s {text: "30 Seconds of Shapeshift Left.",color:white}
execute as @a[tag=chameleon,tag=shapeshifting,scores={shapeshift_time=20}] run tellraw @s {text: "20 Seconds of Shapeshift Left.",color:white}
execute as @a[tag=chameleon,tag=shapeshifting,scores={shapeshift_time=30}] run tellraw @s {text: "10 Seconds of Shapeshift Left.",color:white}
execute as @a[tag=chameleon,tag=shapeshifting,scores={shapeshift_time=40}] run tellraw @s {text: "Shapeshift expired.",color:white}
execute as @a[tag=chameleon,tag=shapeshifting,scores={shapeshift_time=40..}] at @s run function juggernaut:abilities/chameleon/exit_shapeshift
execute as @a[tag=chameleon,scores={shapeshift_time=40..}] run scoreboard players set @s shapeshift_time 0

execute as @a[tag=using_bloodlust,scores={bloodlust_remaining=1..}] run scoreboard players remove @s bloodlust_remaining 1

# Update max health score
execute as @a store result score @s max_health run attribute @s max_health get

# Update chase time
execute as @a[tag=in_chase] run scoreboard players add @s chase_time 1
execute as @a[tag=!in_chase] run scoreboard players set @s chase_time 0

execute as @a[tag=in_chase] run scoreboard players operation @s unyielding_wrath_time = @s chase_time
execute as @a[tag=in_chase] if score @s unyielding_wrath_time matches 20.. run scoreboard players set @s unyielding_wrath_time 20
execute as @a[tag=using_unyielding_wrath] run attribute @s movement_speed modifier remove juggernaut:unyielding_wrath
execute as @a[tag=using_unyielding_wrath,tag=in_chase] store result storage juggernaut:unyielding_wrath value float 0.00075 run scoreboard players get @s unyielding_wrath_time
execute as @a[tag=using_unyielding_wrath,tag=in_chase] run data modify storage juggernaut:unyielding_wrath attribute set value movement_speed
execute as @a[tag=using_unyielding_wrath,tag=in_chase] run data modify storage juggernaut:unyielding_wrath modifier_id set value unyielding_wrath
execute as @a[tag=using_unyielding_wrath,tag=in_chase] run data modify storage juggernaut:unyielding_wrath operation set value add_value
execute as @a[tag=using_unyielding_wrath,tag=in_chase] run function juggernaut:attribute_management/apply_modifier with storage juggernaut:unyielding_wrath

# Update domination speed
execute as @a[tag=juggernaut,tag=using_domination] run function juggernaut:perk_management/perk_functions/set_domination_speed

# Remove respawn protection after a few seconds.
execute as @a[tag=runner,tag=has_respawn_time] run scoreboard players remove @s respawn_time_left 1
execute as @a[tag=runner,tag=has_respawn_time] if score @s respawn_time_left matches ..0 run function juggernaut:clear_respawn_period

# Spectator
execute as @a[tag=spectator] run tag @s remove in_chase

# damage @n[type=minecraft:wolf,tag=hunter_wolf] 1 magic by @p[tag=hunted]
execute unless entity @a[tag=hunted] run kill @n[type=minecraft:wolf,tag=hunter_wolf]

# Withering Surge
execute if entity @a[tag=warlock] if entity @e[type=armor_stand,tag=withering_surge] run function juggernaut:abilities/warlock/tower_effects/withering_surge

execute as @a[tag=chameleon] run item replace entity @s container.11 with tipped_arrow[potion_contents={custom_effects:[{id:"slowness",duration:100,amplifier:0},{id:"poison",duration:1200,amplifier:0}],custom_name:"Acid",custom_color:12713016},item_name={"text":"Acid Arrow",color:"#b5ee4a"},custom_name={"text":"Acid Arrow",color:"#b5ee4a"}] 64

# Replenishment Minigame
# stopwatch create replenishment_minigame_timer
# execute if stopwatch replenishment_minigame_timer 3.. run execute as @e[type=armor_stand,tag=replenishment.station] at @s if score #game_state var matches 11 unless entity @e[type=armor_stand,tag=banishment_glyph,distance=..32] unless entity @a[tag=juggernaut,limit=1,sort=nearest,distance=0..12,tag=!shapeshifting] as @a[tag=runner,distance=..3,tag=!spectral_cloak_active] at @s run function juggernaut:replenishment_management/minigame
# execute if stopwatch replenishment_minigame_timer 3.. run stopwatch restart replenishment_minigame_timer

execute as @a[tag=ghost,tag=spectral_cloak_active,scores={ability_cooldown3=..0}] run tag @s remove spectral_cloak_active

execute as @a[tag=spectator] at @s run function survival:loop/clone_inventory