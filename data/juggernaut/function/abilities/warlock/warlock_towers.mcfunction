#Display the progress of dispelling on each armor stand
execute as @e[type=armor_stand,tag=warlock_armor_stand] run scoreboard players operation @s temp_progress = @s dispel_progress
execute as @e[type=armor_stand,tag=warlock_armor_stand] run scoreboard players operation @s temp_progress *= #100 var

execute as @e[type=armor_stand,tag=warlock_armor_stand] run scoreboard players operation @s temp_max_progress = @s total_dispelling_needed
execute as @e[type=armor_stand,tag=warlock_armor_stand] run scoreboard players operation @s temp_max_progress *= #100 var

execute as @e[type=armor_stand,tag=warlock_armor_stand] run execute store result score @s replenish_decimal run scoreboard players operation @s temp_progress /= @s total_dispelling_needed

bossbar set warlock:malevolent_aura max 100
bossbar set warlock:banishment_glyph max 100
bossbar set warlock:withering_surge max 100

execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=malevolent_aura] store result bossbar warlock:malevolent_aura value run scoreboard players get @s temp_progress
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=banishment_glyph] store result bossbar warlock:banishment_glyph value run scoreboard players get @s temp_progress
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=withering_surge] store result bossbar warlock:withering_surge value run scoreboard players get @s temp_progress

execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=malevolent_aura] at @s run bossbar set warlock:malevolent_aura visible true
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=banishment_glyph] at @s run bossbar set warlock:banishment_glyph visible true
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=withering_surge] at @s run bossbar set warlock:withering_surge visible true

execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=malevolent_aura] at @s run tag @a[distance=..16] add see_malevolent_aura_bar
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=malevolent_aura] at @s run tag @a[tag=warlock] add see_malevolent_aura_bar
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=malevolent_aura] at @s run tag @a[distance=17..,tag=!warlock] remove see_malevolent_aura_bar
execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=malevolent_aura] run tag @a remove see_malevolent_aura_bar

execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=banishment_glyph] at @s run tag @a[distance=..16] add see_banishment_glyph_bar
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=banishment_glyph] at @s run tag @a[tag=warlock] add see_banishment_glyph_bar
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=banishment_glyph] at @s run tag @a[distance=17..,tag=!warlock] remove see_banishment_glyph_bar
execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=banishment_glyph] run tag @a remove see_banishment_glyph_bar

execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=withering_surge] at @s run tag @a[distance=..14] add see_withering_surge_bar
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=withering_surge] at @s run tag @a[tag=warlock] add see_withering_surge_bar
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=withering_surge] at @s run tag @a[distance=15..,tag=!warlock] remove see_withering_surge_bar
execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=withering_surge] run tag @a remove see_withering_surge_bar

execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=malevolent_aura] at @s run bossbar set warlock:malevolent_aura players @a[tag=see_malevolent_aura_bar]
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=banishment_glyph] at @s run bossbar set warlock:banishment_glyph players @a[tag=see_banishment_glyph_bar]
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=withering_surge] at @s run bossbar set warlock:withering_surge players @a[tag=see_withering_surge_bar]

execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=malevolent_aura] run bossbar set warlock:malevolent_aura visible false
execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=banishment_glyph] run bossbar set warlock:banishment_glyph visible false
execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=withering_surge] run bossbar set warlock:withering_surge visible false

#Dispelling auras
execute at @e[type=armor_stand,tag=warlock_armor_stand] run execute as @a[tag=runner,distance=..3] run scoreboard players add @n[type=armor_stand,tag=warlock_armor_stand] dispel_progress 1
execute as @e[type=armor_stand,tag=warlock_armor_stand] at @s run execute if score @s dispel_progress >= @s total_dispelling_needed run playsound block.note_block.bell master @a[tag=runner,distance=..16] ~ ~ ~ 2 1.2
execute as @e[type=armor_stand,tag=warlock_armor_stand] at @s run execute if score @s dispel_progress >= @s total_dispelling_needed run playsound entity.ender_dragon.growl master @a[tag=warlock] ~ ~ ~ 3 0.2 1
execute as @e[type=armor_stand,tag=warlock_armor_stand] at @s run execute if score @s dispel_progress >= @s total_dispelling_needed run effect give @a[tag=runner,distance=..3] glowing 3 0 true
execute as @e[type=armor_stand,tag=warlock_armor_stand] at @s run execute if score @s dispel_progress >= @s total_dispelling_needed run kill @s