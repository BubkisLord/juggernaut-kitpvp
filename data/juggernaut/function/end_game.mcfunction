scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] game_state 0
scoreboard players set @a juggernaut_game_time 0
scoreboard players set @a juggernaut_release_timer 0
scoreboard players set @a jug_kit_cooldown 0
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
clear @a
kill @a
gamerule showDeathMessages true
kill @e[type=armor_stand,tag=warlock_armor_stand]
kill @e[tag=kill_on_end_game]
kill @e[type=armor_stand,tag=hunter_remnant]
attribute @s generic.max_health base set 20
scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] replenish_progress 0
scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] replenish_decimal 0
scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] replenish_percentage 0
scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] total_replenishment_needed 0
scoreboard players set @n[type=armor_stand,tag=juggernaut_manager] scout_reveal_timer 0
scoreboard players set @a lives 0
scoreboard players set @a game_deaths 0
scoreboard players set @a borrowed_damage 0
kill @e[type=armor_stand,tag=malevolent_aura]
kill @e[type=armor_stand,tag=banishment_glyph]
kill @e[type=armor_stand,tag=withering_surge]
gamemode adventure @a