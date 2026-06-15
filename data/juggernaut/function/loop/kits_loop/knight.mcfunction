execute as @a[tag=knight] at @s unless entity @s[nbt={active_effects:[{id:"minecraft:invisibility"}]}] if score @s health matches 1.. if score @s lives_remaining matches 1.. at @s run summon area_effect_cloud ~ ~ ~ {Duration:1,Tags:["kill_on_end_game","knight_marker"],custom_particle:{type:"block",block_state:"air"},Radius:0f}
execute as @a[tag=knight] at @s run scoreboard players add @s ability_cooldown0 1
execute as @a[tag=knight] at @s if entity @e[type=area_effect_cloud,tag=knight_marker,distance=10..] run scoreboard players set @s ability_cooldown0 0
execute as @a[tag=knight] at @s if entity @e[type=area_effect_cloud,tag=knight_marker,distance=10..] run kill @e[type=area_effect_cloud,tag=knight_marker]
execute as @a[tag=knight] at @s unless entity @s[tag=using_horse] if score @s ability_cooldown0 matches 0 run clear @s #spears
execute as @a[tag=knight] at @s unless entity @s[tag=using_horse] if score @s ability_cooldown0 matches 0 run item replace entity @s hotbar.1 with minecraft:wooden_spear[item_name={"text": "Knight's Lance", "color": "yellow"},unbreakable={},tooltip_display={hidden_components:["unbreakable","enchantments"]}]
execute as @a[tag=knight] at @s unless entity @s[tag=using_horse] if score @s ability_cooldown0 matches 40 run clear @s #spears
execute as @a[tag=knight] at @s unless entity @s[tag=using_horse] if score @s ability_cooldown0 matches 40 run item replace entity @s hotbar.1 with minecraft:stone_spear[item_name={"text": "Knight's Lance", "color": "yellow"},enchantments={sharpness:1,lunge:1},unbreakable={},attribute_modifiers=[{type:"attack_damage",id:"attack_damage",amount:-100,operation:"add_multiplied_total",slot:"mainhand"}],tooltip_display={hidden_components:["unbreakable","enchantments"]}]
execute as @a[tag=knight] at @s unless entity @s[tag=using_horse] if score @s ability_cooldown0 matches 80 run clear @s #spears
execute as @a[tag=knight] at @s unless entity @s[tag=using_horse] if score @s ability_cooldown0 matches 80 run item replace entity @s hotbar.1 with minecraft:iron_spear[item_name={"text": "Knight's Lance", "color": "yellow"},enchantments={sharpness:1,lunge:2},unbreakable={},attribute_modifiers=[{type:"attack_damage",id:"attack_damage",amount:-100,operation:"add_multiplied_total",slot:"mainhand"}],tooltip_display={hidden_components:["unbreakable","enchantments"]}]
execute as @a[tag=knight] at @s unless entity @s[tag=using_horse] if score @s ability_cooldown0 matches 90 run clear @s #spears
execute as @a[tag=knight] at @s unless entity @s[tag=using_horse] if score @s ability_cooldown0 matches 90 run item replace entity @s hotbar.1 with minecraft:golden_spear[item_name={"text": "Knight's Lance", "color": "yellow"},enchantments={sharpness:1,lunge:3},unbreakable={},attribute_modifiers=[{type:"attack_damage",id:"attack_damage",amount:-100,operation:"add_multiplied_total",slot:"mainhand"}],tooltip_display={hidden_components:["unbreakable","enchantments"]}]
execute as @a[tag=knight] at @s unless entity @s[tag=using_horse] if score @s ability_cooldown0 matches 120 run clear @s #spears
execute as @a[tag=knight] at @s unless entity @s[tag=using_horse] if score @s ability_cooldown0 matches 120 run item replace entity @s hotbar.1 with minecraft:diamond_spear[item_name={"text": "Knight's Lance", "color": "yellow"},enchantments={sharpness:1,lunge:4},unbreakable={},attribute_modifiers=[{type:"attack_damage",id:"attack_damage",amount:-100,operation:"add_multiplied_total",slot:"mainhand"}],tooltip_display={hidden_components:["unbreakable","enchantments"]}]
# execute as @a[tag=knight] at @s unless entity @s[tag=using_horse] if score @s ability_cooldown0 matches 100 run clear @s #spears
# execute as @a[tag=knight] at @s unless entity @s[tag=using_horse] if score @s ability_cooldown0 matches 100.. run item replace entity @s hotbar.1 with minecraft:netherite_spear[item_name={"text": "Knight's Lance", "color": "yellow", "color": "yellow"},enchantments={sharpness:1,lunge:6},unbreakable={},attribute_modifiers=[{type:"attack_damage",id:"attack_damage",amount:-100,operation:"add_multiplied_total",slot:"mainhand"}],tooltip_display={hidden_components:["unbreakable","enchantments"]}]

execute as @a[tag=knight,tag=using_horse,tag=!on_horse] at @s run summon minecraft:skeleton_horse ~ ~ ~ {CanPickUpLoot:false,DeathLootTable:"",Tame:true,equipment:{saddle:{id:"saddle"}},Team:"jug",Tags:["kill_on_end_game", "knight_horse"],attributes:[{"id":"minecraft:step_height",base:2.0},{"id":"movement_speed",base:0.18},{id:"max_health",base:40.0},{"id":"gravity",base:2.2}]}
execute as @a[tag=knight,tag=using_horse,tag=!on_horse] at @s anchored eyes run tp @e[type=skeleton_horse,tag=knight_horse,distance=..6] ~ ~ ~ facing ^ ^ ^99999
execute as @a[tag=knight,tag=using_horse,tag=!on_horse] at @s anchored eyes run schedule function juggernaut:loop/ride_knight_horse 0.25s append
execute as @a[tag=knight,tag=using_horse,tag=!on_horse] at @s if entity @e[type=skeleton_horse,tag=knight_horse,distance=..6] run tag @s add on_horse
execute as @a[tag=knight,tag=on_horse] at @s unless entity @e[type=skeleton_horse,tag=knight_horse,distance=..6] run tag @s remove on_horse
execute as @a[tag=knight,tag=!using_horse,tag=on_horse] at @s run kill @n[type=skeleton_horse,tag=knight_horse]
execute as @e[type=skeleton_horse,tag=knight_horse] at @s unless entity @a[tag=knight,tag=using_horse,distance=..6] run kill @s

execute as @a[tag=knight] unless entity @s[tag=using_horse] run function juggernaut:ability_management/check_ability {\
    player_tag:"knight",\
    item_id:"minecraft:saddle",\
    item_name:{"text": "Summon Steed","color": "dark_red"},\
    description:[{"text": "Summon your steed to move at faster speeds and lance your opponents!","color": "gray"},{"text": "Cooldown: 0s","color": "dark_gray"}],\
    ability_id:"summon_steed",\
    cooldown:1,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"ability_cooldown1",\
}

execute as @a[tag=knight] if entity @s[tag=using_horse] run function juggernaut:ability_management/check_ability {\
    player_tag:"knight",\
    item_id:"minecraft:leather",\
    item_name:{"text": "Dismiss Steed","color": "dark_red"},\
    description:[{"text": "Dismiss your summoned steed and return to default movement.","color": "gray"},{"text": "Cooldown: 0s","color": "dark_gray"}],\
    ability_id:"dismiss_steed",\
    cooldown:0,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"ability_cooldown1",\
}