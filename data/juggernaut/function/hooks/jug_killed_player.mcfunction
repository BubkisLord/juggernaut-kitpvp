execute if entity @s[tag=using_pressure_point] as @a[tag=runner,tag=!is_undetectable] if entity @s[nbt=!{active_effects:[{id:"minecraft:invisibility"}]}] run effect give @s glowing 5 0 true

execute if entity @s[tag=using_crippling_defeat] as @n[type=armor_stand,tag=replenishment.station,tag=highest_station] run function juggernaut:replenishment_management/regress_station {percentage:35}
