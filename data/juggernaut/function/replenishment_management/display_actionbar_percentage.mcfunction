# Display actionbar for the closest station to a runner when not in chase
# When debuffed. Sign here is empty, as negative numbers are rendered with the `-` sign already.
execute if entity @s[tag=!in_chase] at @s if score @s replenishment_modifier < #100 var run function juggernaut:replenishment_management/station_actionbar_mod {station:"@n[type=armor_stand,tag=replenishment.station,distance=..3]",color:"red",sign:""}
# When normal speed
execute if entity @s[tag=!in_chase] at @s if score @s replenishment_modifier = #100 var run function juggernaut:replenishment_management/station_actionbar_norm {station:"@n[type=armor_stand,tag=replenishment.station,distance=..3]",color:"gold"}
# When buffed
execute if entity @s[tag=!in_chase] at @s if score @s replenishment_modifier > #100 var run function juggernaut:replenishment_management/station_actionbar_mod {station:"@n[type=armor_stand,tag=replenishment.station,distance=..3]",color:"green",sign:"+"}

# Display the most progressed station to a runner when in chase (as that is what they are progressing)
# When debuffed. Sign here is empty, as negative numbers are rendered with the `-` sign already.
execute if entity @s[tag=in_chase] at @s if score @s replenishment_modifier < #100 var run function juggernaut:replenishment_management/station_actionbar_mod {station:"@n[type=armor_stand,tag=replenishment.station,tag=highest_station]",color:"red",sign:""}
# When normal speed
execute if entity @s[tag=in_chase] at @s if score @s replenishment_modifier = #100 var run function juggernaut:replenishment_management/station_actionbar_norm {station:"@n[type=armor_stand,tag=replenishment.station,tag=highest_station]",color:"gold"}
# When buffed
execute if entity @s[tag=in_chase] at @s if score @s replenishment_modifier > #100 var run function juggernaut:replenishment_management/station_actionbar_mod {station:"@n[type=armor_stand,tag=replenishment.station,tag=highest_station]",color:"green",sign:"+"}

# Replenishment Tower
# When debuffed. Sign here is empty, as negative numbers are rendered with the `-` sign already.
execute if entity @s[tag=!in_chase] at @s if entity @n[type=armor_stand,tag=replenishment_tower,distance=..3] if score @s replenishment_modifier < #100 var run function juggernaut:replenishment_management/station_actionbar_mod {station:"@n[type=armor_stand,tag=replenishment.station,tag=highest_station]",color:"red",sign:""}
# When normal speed
execute if entity @s[tag=!in_chase] at @s if entity @n[type=armor_stand,tag=replenishment_tower,distance=..3] if score @s replenishment_modifier = #100 var run function juggernaut:replenishment_management/station_actionbar_norm {station:"@n[type=armor_stand,tag=replenishment.station,tag=highest_station]",color:"gold"}
# When buffed
execute if entity @s[tag=!in_chase] at @s if entity @n[type=armor_stand,tag=replenishment_tower,distance=..3] if score @s replenishment_modifier > #100 var run function juggernaut:replenishment_management/station_actionbar_mod {station:"@n[type=armor_stand,tag=replenishment.station,tag=highest_station]",color:"green",sign:"+"}