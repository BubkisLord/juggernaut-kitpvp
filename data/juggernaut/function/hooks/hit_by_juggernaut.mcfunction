# Give speed on hit by juggernaut
execute if entity @s[tag=!scout] run effect give @s speed 1 0 true

# Rapid brutality perk
execute as @p[tag=juggernaut,tag=using_rapid_brutality,scores={jug_dmg=1..}] run function juggernaut:attribute_management/apply {attribute_name:"movement_speed",value:0.1,modifier_name:"rapid_brutality",duration:4}

# Brutal efficiency perk
execute as @n[type=armor_stand,tag=replenishment.station,distance=..12] if entity @a[tag=juggernaut,distance=..6,tag=using_brutal_efficiency,scores={brutal_efficiency_cooldown=0}] run function juggernaut:replenishment_management/regress_station {percentage:25}
execute if entity @e[type=armor_stand,tag=replenishment.station,distance=..12] as @p[tag=juggernaut,distance=..6,tag=using_brutal_efficiency] run scoreboard players set @s brutal_efficiency_cooldown 15

# Blood pact perk
execute if entity @s[tag=using_blood_pact] run effect give @s regeneration 6 0 true