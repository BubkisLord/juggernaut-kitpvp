execute if entity @s[tag=using_pressure_point] as @a[tag=runner,tag=!is_undetectable] if entity @s[nbt=!{active_effects:[{id:"minecraft:invisibility"}]}] run effect give @s glowing 5 0 true

execute if entity @s[tag=using_crippling_defeat] as @n[type=armor_stand,tag=replenishment.station,tag=highest_station] run function juggernaut:replenishment_management/regress_station {percentage:35}

execute if entity @s[tag=chameleon] run scoreboard players add @s kills_kit_chameleon 1
execute if entity @s[tag=dragon] run scoreboard players add @s kills_kit_dragon 1
execute if entity @s[tag=eclipse_stalker] run scoreboard players add @s kills_kit_eclipse_stalker 1
execute if entity @s[tag=fishmonger] run scoreboard players add @s kills_kit_fishmonger 1
execute if entity @s[tag=jug_hunter] run scoreboard players add @s kills_kit_hunter 1
execute if entity @s[tag=classic_jug] run scoreboard players add @s kills_kit_classic_juggernaut 1
execute if entity @s[tag=jug_knight] run scoreboard players add @s kills_kit_knight 1
execute if entity @s[tag=predator] run scoreboard players add @s kills_kit_predator 1
execute if entity @s[tag=spirit_walker] run scoreboard players add @s kills_kit_spirit_walker 1
execute if entity @s[tag=timekeeper] run scoreboard players add @s kills_kit_timekeeper 1
execute if entity @s[tag=warlock] run scoreboard players add @s kills_kit_warlock 1
execute if entity @s[tag=witch_doctor] run scoreboard players add @s kills_kit_witch_doctor 1

execute if entity @s[tag=chameleon] run scoreboard players add #juggernaut_manager kills_kit_chameleon 1
execute if entity @s[tag=dragon] run scoreboard players add #juggernaut_manager kills_kit_dragon 1
execute if entity @s[tag=eclipse_stalker] run scoreboard players add #juggernaut_manager kills_kit_eclipse_stalker 1
execute if entity @s[tag=fishmonger] run scoreboard players add #juggernaut_manager kills_kit_fishmonger 1
execute if entity @s[tag=jug_hunter] run scoreboard players add #juggernaut_manager kills_kit_hunter 1
execute if entity @s[tag=classic_jug] run scoreboard players add #juggernaut_manager kills_kit_classic_juggernaut 1
execute if entity @s[tag=jug_knight] run scoreboard players add #juggernaut_manager kills_kit_knight 1
execute if entity @s[tag=predator] run scoreboard players add #juggernaut_manager kills_kit_predator 1
execute if entity @s[tag=spirit_walker] run scoreboard players add #juggernaut_manager kills_kit_spirit_walker 1
execute if entity @s[tag=timekeeper] run scoreboard players add #juggernaut_manager kills_kit_timekeeper 1
execute if entity @s[tag=warlock] run scoreboard players add #juggernaut_manager kills_kit_warlock 1
execute if entity @s[tag=witch_doctor] run scoreboard players add #juggernaut_manager kills_kit_witch_doctor 1