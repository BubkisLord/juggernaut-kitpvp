# Warlock
execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=malevolent_aura] run bossbar set warlock:malevolent_aura visible false
execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=banishment_glyph] run bossbar set warlock:banishment_glyph visible false
execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=withering_surge] run bossbar set warlock:withering_surge visible false

#Particle effects
execute at @e[type=armor_stand,tag=malevolent_aura] run particle dripping_lava ~ ~ ~ 16 8 16 0.00001 20 force @a[distance=..16]
# execute as @e[type=armor_stand,tag=malevolent_aura] at @s run function juggernaut:malevolent_sphere_recursive
execute at @e[type=armor_stand,tag=banishment_glyph] run particle dripping_water ~ ~ ~ 16 8 16 0 20 force @a[distance=..16]
# execute as @e[type=armor_stand,tag=banishment_glyph] at @s run function juggernaut:banishment_sphere_recursive
execute at @e[type=armor_stand,tag=withering_surge] run particle large_smoke ~ ~ ~ 16 8 16 0.00001 10 force @a[distance=..14]
# execute as @e[type=armor_stand,tag=withering_surge] at @s run function juggernaut:withering_sphere_recursive

execute at @e[type=armor_stand,tag=warlock_armor_stand] if entity @a[tag=runner,distance=..3] run particle totem_of_undying ~ ~0.75 ~ 0.25 0.5 0.25 0 10 force

#Sound effects
execute at @e[tag=warlock_armor_stand] as @a[distance=..16] run function abilities:aura_sound

#Warlock aura effects
execute if entity @e[type=armor_stand,tag=malevolent_aura] run function juggernaut:abilities/warlock/tower_effects/malevolent_aura
execute if entity @e[type=armor_stand,tag=withering_surge] run function juggernaut:abilities/warlock/tower_effects/withering_surge

execute if entity @e[type=armor_stand,tag=warlock_armor_stand] run function juggernaut:abilities/warlock/warlock_towers