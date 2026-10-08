execute if entity @s[tag=using_pressure_point] as @a[tag=runner,tag=!undetectable] if entity @s[nbt=!{active_effects:[{id:"minecraft:invisibility"}]}] run effect give @s glowing 12 0 true

execute if entity @s[tag=using_crippling_defeat] as @n[type=armor_stand,tag=replenishment.station,tag=highest_station] run function juggernaut:replenishment_management/regress_station_total {percentage:25}

execute if entity @s[tag=using_pressure_point] run scoreboard players set @s ability_cooldown0 0
execute if entity @s[tag=using_pressure_point] run scoreboard players set @s ability_cooldown1 0
execute if entity @s[tag=using_pressure_point] run scoreboard players set @s ability_cooldown2 0
execute if entity @s[tag=using_pressure_point] run scoreboard players set @s ability_cooldown3 0
execute if entity @s[tag=using_pressure_point] run scoreboard players set @s ability_cooldown4 0
execute if entity @s[tag=using_pressure_point] run scoreboard players set @s ability_cooldown5 0
execute if entity @s[tag=using_pressure_point] run scoreboard players set @s ability_cooldown6 0
execute if entity @s[tag=using_pressure_point] run scoreboard players set @s ability_cooldown7 0
execute if entity @s[tag=using_pressure_point] run scoreboard players set @s ability_cooldown8 0
execute if entity @s[tag=using_pressure_point] run scoreboard players set @s ability_cooldown9 0

execute if entity @s[tag=using_silent_killer] run function juggernaut:effects/apply_effect {effect:"undetectable",duration:35,color:"dark_gray"}
execute if entity @s[tag=using_silent_killer] run effect give @s invisibility 35 0 true

execute if entity @s[tag=chameleon] run function stats:increment_kills {id: "chameleon"}
execute if entity @s[tag=dragon] run function stats:increment_kills {id: "dragon"}
execute if entity @s[tag=fishmonger] run function stats:increment_kills {id: "fishmonger"}
execute if entity @s[tag=hunter] run function stats:increment_kills {id: "hunter"}
execute if entity @s[tag=classic] run function stats:increment_kills {id: "classic"}
execute if entity @s[tag=knight] run function stats:increment_kills {id: "knight"}
execute if entity @s[tag=predator] run function stats:increment_kills {id: "predator"}
execute if entity @s[tag=spirit_walker] run function stats:increment_kills {id: "spirit_walker"}
execute if entity @s[tag=timekeeper] run function stats:increment_kills {id: "timekeeper"}
execute if entity @s[tag=warlock] run function stats:increment_kills {id: "warlock"}
execute if entity @s[tag=witch_doctor] run function stats:increment_kills {id: "witch_doctor"}
execute if entity @s[tag=phantom] run function stats:increment_kills {id: "phantom"}
execute if entity @s[tag=beast_tamer] run function stats:increment_kills {id: "beast_tamer"}
