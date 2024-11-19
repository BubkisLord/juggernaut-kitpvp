# Give speed on hit by juggernaut
execute if entity @s[tag=!scout] run effect give @s speed 1 0 true


# Rapid brutality perk
execute as @p[tag=juggernaut,distance=..5,tag=using_rapid_brutality] run function juggernaut:attribute_management/apply {attribute_namespace:"generic",attribute_name:"movementSpeed",value:0.11,duration:4}


# Brutal efficiency perk
execute as @n[type=armor_stand,tag=replenishment.station,distance=..5] if entity @a[tag=juggernaut,distance=..5,tag=using_brutal_efficiency,scores={brutal_efficiency_cooldown=0}] run function juggernaut:regress_station {percentage:10}
execute if entity @e[type=armor_stand,tag=replenishment.station,distance=..5] as @p[tag=juggernaut,distance=..5,tag=using_brutal_efficiency] run scoreboard players set @s brutal_efficiency_cooldown 30


# Blood pact perk
execute if entity @s[tag=using_blood_pact] run tag @s add blood_pact_active
execute if entity @s[tag=using_blood_pact] run tag @s remove using_blood_pact


# Predator hemorrhage
execute if entity @a[tag=predator,distance=..5] run function juggernaut:effects/apply_effect {effect:"hemorrhaged",duration:20,color:"#de5656"}


# Exposed status effect
execute if entity @s[tag=is_exposed] run function juggernaut:damage_player