scoreboard players set #game_state var 0
scoreboard players set @a juggernaut_game_time 0
scoreboard players set @a juggernaut_release_timer 0
scoreboard players set @a jug_kit_cooldown 0
scoreboard players set @a jug_kit_cooldown_2 0
scoreboard players set @a revealing_tower_cooldown 0
scoreboard players set @a replenishment_tower_cooldown 0
scoreboard players set @a turret_cooldown 0
scoreboard players set @a shadow_mark_cooldown 0
spawnpoint @a 2000 100 0
gamerule showDeathMessages false
tag @a remove has_jug_kit
tag @a remove juggernaut
tag @a remove runner
tag @a remove spectator
tag @a remove predator
tag @a remove witchdoctor
tag @a remove medic
tag @a remove survivor
tag @a remove escapist
tag @a remove rogue
tag @a remove scout
tag @a remove engineer
tag @a remove witchdoctor
tag @a remove warlock
tag @a remove jug_hunter
tag @a remove is_hunting
tag @a remove has_hunters_mark
tag @a remove dragon
tag @a remove is_floating
tag @a remove chain_hunter
tag @a remove blinker
tag @a remove spirit_walker
tag @a remove guide
tag @a remove using_camera
tag @a remove stalker
tag @a remove eclipse_stalker
tag @e remove used_camera
tag @e remove sentinel_tower
tag @a remove shadow_marked
tag @a add lobby.player

tag @a remove using_blood_pact
tag @a remove using_flame_ward
tag @a remove using_fractured_aid
tag @a remove using_self_preservation
tag @a remove using_sentinel
tag @a remove using_quickened_stealth
tag @a remove using_undying_ties
tag @a remove using_unwavering_strength

tag @a remove has_respawn_time

execute as @e[tag=replenishment.station_deactivated] run tag @s add replenishment.station
execute as @e[tag=replenishment.station_deactivated] run tag @s remove replenishment.station_deactivated
tag @e remove station_completed
scoreboard players set #stations_completed var 0
scoreboard players set @e[tag=replenishment.station] replenish_amount 0

item replace entity @a enderchest.0 with danger_pottery_sherd[item_name='{"text": "Sentinel","color": "aqua"}',lore=['{"text": "After replenishing at a station for 8 seconds,","color": "dark_gray","italic": true}','{"text": "this perk becomes active. While active,","color": "dark_gray","italic": true}','{"text": "any juggernaut within 8 blocks of the station glows.","color": "dark_gray","italic": true}','{"text": "If the station is completed the effect ends.","color": "dark_gray","italic": true}','{"text": "This effect only applies to one station at a time.","color": "dark_gray","italic": true}']]
item replace entity @a enderchest.1 with heart_pottery_sherd[item_name='{"text": "Self-Preservation","color": "aqua"}',lore=['{"text": "Self-healing has +15% speed.","color": "dark_gray","italic": true}','{"text": "Healing has -20% speed.","color": "dark_gray","italic": true}','{"text": "This perk is permanently active.","color": "dark_gray","italic": true}']]
item replace entity @a enderchest.2 with heartbreak_pottery_sherd[item_name='{"text": "Fractured Aid","color": "aqua"}',lore=['{"text": "Self-healing has -20% speed.","color": "dark_gray","italic": true}','{"text": "Healing has +15% speed.","color": "dark_gray","italic": true}','{"text": "This perk is permanently active.","color": "dark_gray","italic": true}']]
item replace entity @a enderchest.3 with scrape_pottery_sherd[item_name='{"text": "Blood Pact","color": "aqua"}',lore=['{"text": "This perk activates after taking damage from the juggernaut.","color": "dark_gray","italic": true}','{"text": "While this perk is active, all forms of healing have +50% speed.","color": "dark_gray","italic": true}','{"text": "This perk permanently deactivates upon death.","color": "dark_gray","italic": true}']]
item replace entity @a enderchest.4 with burn_pottery_sherd[item_name='{"text": "Flame Ward","color": "aqua"}',lore=['{"text": "You cannot take damage from lava or fire.","color": "dark_gray","italic": true}','{"text": "This perk is permanently active.","color": "dark_gray","italic": true}']]
item replace entity @a enderchest.5 with flow_pottery_sherd[item_name='{"text": "Quickened Stealth","color": "aqua"}',lore=['{"text": "You are 170% faster while sneaking.","color": "dark_gray","italic": true}','{"text": "This perk is permanently active.","color": "dark_gray","italic": true}']]
item replace entity @a enderchest.6 with brewer_pottery_sherd[item_name='{"text": "Healthy Preparation","color": "aqua"}',lore=['{"text": "At the start of the match, you gain","color": "dark_gray","italic": true}','{"text": "8 splash potions of healing.","color": "dark_gray","italic": true}']]
item replace entity @a enderchest.7 with skull_pottery_sherd[item_name='{"text": "Undying Ties","color": "aqua"}',lore=['{"text": "Upon death of any means, you respawn","color": "dark_gray","italic": true}','{"text": "at the location of another player.","color": "dark_gray","italic": true}']]
item replace entity @a enderchest.8 with prize_pottery_sherd[item_name='{"text": "Unwavering Strength","color": "aqua"}',lore=['{"text": "You can replenish even when the juggernaut is close by.","color": "dark_gray","italic": true}','{"text": "This perk is permanently active.","color": "dark_gray","italic": true}']]
item replace entity @a enderchest.9 with friend_pottery_sherd[item_name='{"text": "Shared Resolve","color": "aqua"}',lore=['{"text": "When completing a station, all players working on it","color": "dark_gray","italic": true}','{"text": "receive resistance and speed 2 for 4 seconds,","color": "dark_gray","italic": true}','{"text": "as well as the undetectable status effect for 20 seconds.","color": "dark_gray","italic": true}','{"text": "Afterwards, this perk deactivates until next reactivation.","color": "dark_gray","italic": true}']]

clear @a
kill @a
gamerule showDeathMessages true
gamerule naturalRegeneration true
kill @e[type=armor_stand,tag=warlock_armor_stand]
kill @e[tag=kill_on_end_game]
kill @e[type=armor_stand,tag=hunter_remnant]
execute as @a run attribute @s generic.scale base set 1
execute as @a run attribute @s player.entity_interaction_range base set 3
execute as @a run attribute @s generic.jump_strength base set 0.41999999
execute as @a run attribute @s generic.step_height base set 0.6
execute as @a run attribute @s generic.max_health base set 20
execute as @a run attribute @s generic.movement_speed base set 0.1
execute as @a run attribute @s generic.safe_fall_distance base set 3
execute as @a run attribute @s generic.gravity base set 0.08
execute as @a run attribute @s player.sneaking_speed base set 0.3

scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] replenish_progress 0
scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal 0
scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] replenish_percentage 0
scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] total_replenishment_needed 0
scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] scout_reveal_timer 0

scoreboard players set @e[type=armor_stand,tag=replenishment.station] sentinel_progress 0

scoreboard players set @a lives 0
scoreboard players set @a game_deaths 0
scoreboard players set @a borrowed_damage 0
kill @e[type=armor_stand,tag=malevolent_aura]
kill @e[type=armor_stand,tag=banishment_glyph]
kill @e[type=armor_stand,tag=withering_surge]
team leave @a
gamemode adventure @a
stopsound @a