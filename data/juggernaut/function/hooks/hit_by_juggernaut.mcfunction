# Give speed on hit by juggernaut
execute if entity @s[tag=!scout] run effect give @s speed 1 0 true


# Rapid brutality perk
execute as @p[tag=juggernaut,distance=..5,tag=using_rapid_brutality] run function juggernaut:attribute_management/apply {attribute_name:"movement_speed",value:0.11,duration:4}


# Brutal efficiency perk
execute as @n[type=armor_stand,tag=replenishment.station,distance=..12] if entity @a[tag=juggernaut,distance=..6,tag=using_brutal_efficiency,scores={brutal_efficiency_cooldown=0}] run function juggernaut:replenishment_management/regress_station {percentage:10}
execute if entity @e[type=armor_stand,tag=replenishment.station,distance=..12] as @p[tag=juggernaut,distance=..6,tag=using_brutal_efficiency] run scoreboard players set @s brutal_efficiency_cooldown 15


# Unyielding wrath perk
# Remove unyielding wrath upon getting a hit.
# execute if entity @s[tag=using_unyielding_wrath] run attribute @s movement_speed modifier remove unyielding_wrath_1
# execute if entity @s[tag=using_unyielding_wrath] run attribute @s movement_speed modifier remove unyielding_wrath_2
# execute if entity @s[tag=using_unyielding_wrath] run attribute @s movement_speed modifier remove unyielding_wrath_3
# execute if entity @s[tag=using_unyielding_wrath] run attribute @s movement_speed modifier remove unyielding_wrath_4
# execute if entity @s[tag=using_unyielding_wrath] run attribute @s movement_speed modifier remove unyielding_wrath_5


# Blood pact perk
execute if entity @s[tag=using_blood_pact] run tag @s add blood_pact_active


# Predator hemorrhage
execute if entity @a[tag=predator,distance=..5] run function juggernaut:effects/apply_effect {effect:"hemorrhaged",duration:20,color:"#de5656"}


# Exposed status effect
execute if entity @s[tag=is_exposed] run function juggernaut:damage_player