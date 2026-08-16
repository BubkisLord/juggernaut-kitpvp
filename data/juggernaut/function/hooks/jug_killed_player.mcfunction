execute if entity @s[tag=using_pressure_point] as @a[tag=runner,tag=!undetectable] if entity @s[nbt=!{active_effects:[{id:"minecraft:invisibility"}]}] run effect give @s glowing 12 0 true

execute if entity @s[tag=using_crippling_defeat] as @n[type=armor_stand,tag=replenishment.station,tag=highest_station] run function juggernaut:replenishment_management/regress_station_total {percentage:25}

execute if entity @s[tag=using_bloodlust] run scoreboard players set @s ability_cooldown0 0
execute if entity @s[tag=using_bloodlust] run scoreboard players set @s ability_cooldown1 0
execute if entity @s[tag=using_bloodlust] run scoreboard players set @s ability_cooldown2 0
execute if entity @s[tag=using_bloodlust] run scoreboard players set @s ability_cooldown3 0
execute if entity @s[tag=using_bloodlust] run scoreboard players set @s ability_cooldown4 0
execute if entity @s[tag=using_bloodlust] run scoreboard players set @s ability_cooldown5 0
execute if entity @s[tag=using_bloodlust] run scoreboard players set @s ability_cooldown6 0
execute if entity @s[tag=using_bloodlust] run scoreboard players set @s ability_cooldown7 0
execute if entity @s[tag=using_bloodlust] run scoreboard players set @s ability_cooldown8 0
execute if entity @s[tag=using_bloodlust] run scoreboard players set @s ability_cooldown9 0

execute if entity @s[tag=using_silent_killer] run function juggernaut:effects/apply_effect {effect:"undetectable",duration:35,color:"dark_gray"}
execute if entity @s[tag=using_silent_killer] run effect give @s invisibility 35 0 true

execute if entity @s[tag=chameleon] run scoreboard players add @s kills_kit_chameleon 1
execute if entity @s[tag=dragon] run scoreboard players add @s kills_kit_dragon 1
execute if entity @s[tag=fishmonger] run scoreboard players add @s kills_kit_fishmonger 1
execute if entity @s[tag=hunter] run scoreboard players add @s kills_kit_hunter 1
execute if entity @s[tag=classic_jug] run scoreboard players add @s kills_kit_classic_juggernaut 1
execute if entity @s[tag=knight] run scoreboard players add @s kills_kit_knight 1
execute if entity @s[tag=predator] run scoreboard players add @s kills_kit_predator 1
execute if entity @s[tag=spirit_walker] run scoreboard players add @s kills_kit_spirit_walker 1
execute if entity @s[tag=timekeeper] run scoreboard players add @s kills_kit_timekeeper 1
execute if entity @s[tag=warlock] run scoreboard players add @s kills_kit_warlock 1
execute if entity @s[tag=witch_doctor] run scoreboard players add @s kills_kit_witch_doctor 1
execute if entity @s[tag=phantom] run scoreboard players add @s kills_kit_phantom 1
execute if entity @s[tag=beast_tamer] run scoreboard players add @s kills_kit_beast_tamer 1

execute if entity @s[tag=chameleon] run scoreboard players add #juggernaut_manager kills_kit_chameleon 1
execute if entity @s[tag=dragon] run scoreboard players add #juggernaut_manager kills_kit_dragon 1
execute if entity @s[tag=fishmonger] run scoreboard players add #juggernaut_manager kills_kit_fishmonger 1
execute if entity @s[tag=hunter] run scoreboard players add #juggernaut_manager kills_kit_hunter 1
execute if entity @s[tag=classic_jug] run scoreboard players add #juggernaut_manager kills_kit_classic_juggernaut 1
execute if entity @s[tag=knight] run scoreboard players add #juggernaut_manager kills_kit_knight 1
execute if entity @s[tag=predator] run scoreboard players add #juggernaut_manager kills_kit_predator 1
execute if entity @s[tag=spirit_walker] run scoreboard players add #juggernaut_manager kills_kit_spirit_walker 1
execute if entity @s[tag=timekeeper] run scoreboard players add #juggernaut_manager kills_kit_timekeeper 1
execute if entity @s[tag=warlock] run scoreboard players add #juggernaut_manager kills_kit_warlock 1
execute if entity @s[tag=witch_doctor] run scoreboard players add #juggernaut_manager kills_kit_witch_doctor 1
execute if entity @s[tag=phantom] run scoreboard players add #juggernaut_manager kills_kit_phantom 1
execute if entity @s[tag=beast_tamer] run scoreboard players add #juggernaut_manager kills_kit_beast_tamer 1