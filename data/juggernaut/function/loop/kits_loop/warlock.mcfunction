# Warlock
execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=malevolent_aura] run bossbar set warlock:malevolent_aura visible false
execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=banishment_glyph] run bossbar set warlock:banishment_glyph visible false
execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=withering_surge] run bossbar set warlock:withering_surge visible false
execute unless entity @e[type=armor_stand,tag=warlock_armor_stand,tag=warlock_revealing_tower] run bossbar set warlock:revealing_tower visible false

#Particle effects
execute at @e[type=armor_stand,tag=malevolent_aura] run particle dripping_lava ~ ~ ~ 16 8 16 0.00001 20 force @a[distance=..16]
execute at @e[type=armor_stand,tag=banishment_glyph] run particle dripping_water ~ ~ ~ 16 8 16 0 20 force @a[distance=..16]
execute at @e[type=armor_stand,tag=withering_surge] run particle large_smoke ~ ~ ~ 16 8 16 0.00001 10 force @a[distance=..14]
execute at @e[type=armor_stand,tag=withering_surge] run particle dripping_honey ~ ~ ~ 16 8 16 0.00001 20 force @a[distance=..16]

execute at @e[type=armor_stand,tag=warlock_armor_stand] positioned ~ ~-1 ~ if entity @a[tag=runner,distance=..3] run particle end_rod ~ ~0.75 ~ 0.25 0.5 0.25 0 10 force

execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=warlock_revealing_tower] at @s run effect give @a[tag=runner,distance=..16,tag=!undetectable] glowing 1 0 true
execute as @e[type=armor_stand,tag=warlock_armor_stand,tag=warlock_revealing_tower] at @s if entity @a[tag=runner,distance=..16,tag=!undetectable] run data modify entity @s CustomNameVisible set value true

#Warlock tower aura effects
execute if entity @e[type=armor_stand,tag=malevolent_aura] run function juggernaut:abilities/warlock/tower_effects/malevolent_aura

execute if entity @e[type=armor_stand,tag=warlock_armor_stand] run function juggernaut:abilities/warlock/warlock_towers

# Warlock aura effect
execute as @s at @s run function juggernaut:kit_auras/warlock

function juggernaut:ability_management/check_ability {\
    player_tag:"warlock",\
    item_model:"minecraft:red_dye",\
    item_name:{"text": "Spawn Malevolent Aura","color": "dark_red"},\
    description:[\
        {"text": "Summon a tower with a visible nametag.","color": "gray"},\
        {"text": "Within 24 blocks you gain Speed II.","color": "gray"},\
        {"text": "","color": "gray"},\
        {"text": "Runners may stand near it to dispel/remove it.","color": "gray"},\
        {"text": "Cooldown: 20s","color": "dark_gray"}],\
    ability_id:"malevolent_aura",\
    cooldown:20,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown0",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"warlock",\
    item_model:"minecraft:cyan_dye",\
    item_name:{"text": "Spawn Banishment Glyph","color": "dark_aqua"},\
    description:[\
        {"text": "Summon a tower with a visible nametag.","color": "gray"},\
        {"text": "Within 24 blocks replenishment stations cannot be used.","color": "gray"},\
        {"text": "","color": "gray"},\
        {"text": "Runners may stand near it to dispel/remove it.","color": "gray"},\
        {"text": "Cooldown: 30s","color": "dark_gray"}],\
    ability_id:"banishment_glyph",\
    cooldown:30,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"ability_cooldown1",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"warlock",\
    item_model:"minecraft:black_dye",\
    item_name:{"text": "Spawn Withering Surge","color": "dark_gray"},\
    description:[\
        {"text": "Summon a tower with a visible nametag.","color": "gray"},\
        {"text": "Runners within 14 blocks are inflicted with Wither.","color": "gray"},\
        {"text": "","color": "gray"},\
        {"text": "Runners may stand near it to dispel/remove it.","color": "gray"},\
        {"text": "Cooldown: 40s","color": "dark_gray"}],\
    ability_id:"withering_surge",\
    cooldown:40,\
    hotbar_slot:"hotbar.3",\
    cooldown_var:"ability_cooldown2",\
}

function juggernaut:ability_management/check_ability {\
    player_tag:"warlock",\
    item_model:"minecraft:yellow_dye",\
    item_name:{"text": "Spawn Revealing Tower","color": "gold"},\
    description:[\
        {"text": "Summon an invisible tower.","color": "gray"},\
        {"text": "It becomes visible when a Runner is nearby.","color": "gray"},\
        {"text": "Runners within 16 blocks become Glowing.","color": "gray"},\
        {"text": "","color": "gray"},\
        {"text": "Runners may stand near it to dispel/remove it.","color": "gray"},\
        {"text": "Cooldown: 35s","color": "dark_gray"}],\
    ability_id:"revealing_tower",\
    cooldown:35,\
    hotbar_slot:"hotbar.4",\
    cooldown_var:"ability_cooldown3",\
}